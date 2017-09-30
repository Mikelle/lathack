pragma solidity ^0.4.15;


contract PayableProposal {
    bool public isPayableProposal;

    function PayableProposal(bool isPayable) {
        isPayableProposal = isPayable;
    }

    //ToDo: implement logic
    function () payable {

    }
}
