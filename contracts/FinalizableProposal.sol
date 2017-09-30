pragma solidity ^0.4.15;


contract FinalizableProposal {
    uint endBlock;
    bool isFinished = false;

    function FinalizableProposal(uint _endBlock) {
        require(_endBlock > block.number);

        endBlock = _endBlock;
    }

    //ToDo: implement function modifier which will check access rights
    function finalize() returns (bool) {
        if (block.number > endBlock) {
            isFinished = true;
            doFinalizableRoutine();
        }
    }

    //Should be overridden to add finalization routine
    function doFinalizableRoutine() {

    }

    modifier isNotFinished() {
        require(!isFinished);
        _;
    }
}
