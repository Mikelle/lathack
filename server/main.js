const request = require("request-promise");
const config = require("./config.json");
const Web3 = require("web3");

/*
Contracts
*/
const Oracle = require("../build/contracts/Oracle.json");

const provider = new Web3("http://127.0.0.1:8545");
const web3 = new Web3(provider);


let accounts = [];
web3.eth.getAccounts().then(arr => accounts = arr).then(_ => main());
let i = 0;

const main = () => {
    const oracleContract = new web3.eth.Contract(Oracle.abi, "0x4601c1c87d4acf63236959f1c059f84806dbbdaa");

    const getEvents = (eventName) =>
        new Promise((resolve, reject) => {
            oracleContract.getPastEvents(eventName,
                {
                    fromBlock : 0, toBlock : "latest"
                },
                (err, res) => {
                    const resultArray = [];
                    res.map(item => resultArray.push(item.returnValues));

                    resolve(resultArray);
                });
        });

    const isRequestHandled = (request, responses) => {
        if (!responses || !responses.length)
            return false;

        let result = false;
        responses.map(response => response.id === request.id ? result = true : null);

        return result;
    };

    const handleRequest = (request) => {
        //ToDo: implement logic with fetching data from external resources

        oracleContract.methods.getDataFromOracle(request.id, request.id * 10).send({
            from : accounts[2]
        })
            .on("transactionHash", hash => console.log("tx hash: " + hash))
            .on("error", console.error);
    };

    const createNewEvent = () =>
        oracleContract.methods.createRequest(i, "data" + i++).send({
            from : accounts[5]
        });

    const checkNewRequests = () =>
        Promise.all([getEvents("Requests"), getEvents("Responses")]).then(results =>
            results[0].map(request => !isRequestHandled(request, results[1]) ? handleRequest(request) : null));

    setInterval(checkNewRequests, 5000);

    // setInterval(createNewEvent, 3000);
};

/*
const checkNewRequests = () =>
    new Promise((resolve, reject) => {

    });
setInterval(checkNewRequests, 5000);*/


