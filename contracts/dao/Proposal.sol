pragma solidity ^0.4.15;

import "./FinalizableProposal.sol";

contract Proposal is FinalizableProposal {
    string public title;
    string public description;
    uint votesFor = 0;
    uint votesVs = 0;

    function Proposal(uint _endBlock, string _title, string _description)
    FinalizableProposal(_endBlock)
    {
        require(bytes(_title).length > 0);
        require(bytes(_description).length > 0);

        title = _title;
        description = _description;
    }

    //ToDo: add modifier logic checing access rights
    function voteFor() isNotFinished {
        votesFor = votesFor + 1;
    }

    //ToDo: add modifier logic checing access rights
    function voteVs() isNotFinished {
        votesVs = votesVs + 1;
    }

    function getProposalResult() constant returns(bool) {
        return votesFor > votesVs;
    }
}
