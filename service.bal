import ballerina/http;

# A Ballerina service representing a network-accessible API
# bound to port `9090`.

configurable int port = 9090;
configurable string name = "Sampa";

service /greet on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Greeting," + name;
    }
}

service /hello on new http:Listener(8080) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get hello(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
