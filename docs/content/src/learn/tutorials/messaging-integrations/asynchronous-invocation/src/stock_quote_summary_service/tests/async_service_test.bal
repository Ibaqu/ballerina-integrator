import ballerina/test;
import ballerina/http;

@test:Config {}
function testStockSummaryService() {
    // Invoking the main function
    http:Client httpEndpoint = new("http://localhost:9090");

    json expectedPayload = { "GOOG": "Something wrong with the connection",
        "APPL": "Something wrong with the connection", "MSFT":
        "Something wrong with the connection" };

    // Send a GET request to the specified endpoint
    var response = httpEndpoint->get("/quote-summary");
    if (response is http:Response) {
        var res = response.getJsonPayload();
        if (res is json) {
            test:assertEquals(res, expectedPayload);
        } else {
            test:assertFail(msg = "Failed to retrive the payload");
        }
    } else {
        test:assertFail(msg = "Failed to call the endpoint:");
    }
}
