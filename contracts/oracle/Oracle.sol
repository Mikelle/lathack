pragma solidity ^0.4.0;


contract Oracle {
    struct Request {

    }

    /*
    All requests which was asked to do
     */
    event Requests(
        uint id,
        string data
    );

    /*
    All requests which was handled
     */
    event Responses(
        uint id,
        uint result
    );

    function Oracle(){

    }

    function createRequest(uint id, string data) {
        Requests(id, data);
    }

    //ToDo: trigger callback for this request
    function getDataFromOracle(uint requestId, uint result) {
        Responses(requestId, result);
    }
}
