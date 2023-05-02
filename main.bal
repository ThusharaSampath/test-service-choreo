import ballerina/log;
import ballerina/http;

type Album readonly & record {|
    string title;
    string artist;
|};

table<Album> key(title) albums = table [
    {title: "Blue Train", artist: "John Coltrane"},
    {title: "Jeru", artist: "Gerry Mulligan"}
];

type Animal readonly & record {|
    string name;
    string kind;
|};

table<Animal> key(name) animal = table [
    {name: "Blue Train", kind: "John Coltrane"},
    {name: "Jeru", kind: "Gerry Mulligan"}
];

service / on new http:Listener(9090) {

    resource function get albums() returns Album[] {
        return albums.toArray();
    }

    resource function post album(@http:Payload json payload, @http:Header string header) returns Album {
        log:printInfo("Payload: " + payload.toString());
        return {title: payload.toString(), artist: payload.toString()};
    }
}


service / on new http:Listener(8080) {

    resource function get animal() returns Animal[] {
        return animal.toArray();
    }

    resource function post animal(@http:Payload json payload, @http:Header string header) returns Animal {
        log:printInfo("Payload: " + payload.toString());
        return {name: payload.toString(), kind: payload.toString()};
    }
}