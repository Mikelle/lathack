pragma solidity ^0.4.15;

import "./PayableProposal.sol";
import "./FinalizableProposal.sol";

contract Proposal is PayableProposal, FinalizableProposal {
    string public title;
    string public description;
    uint votesFor = 0;
    uint votesVs = 0;

    function Proposal(bool _isPayable, uint _endBlock, string _title, string _description)
    PayableProposal(_isPayable)
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
}
