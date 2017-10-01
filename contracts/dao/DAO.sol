pragma solidity ^0.4.15;

import "../asset/LiquidAsset.sol";
import "./Proposal.sol";

contract DAO {
    mapping(address => Proposal) proposals;
    LiquidAsset asset;

    function DAO(address assetAddress) {
        require(assetAddress != 0x0);
        asset = LiquidAsset(assetAddress);
    }

    //ToDo: add isAssetOwner modifier
    function createProposal(uint _endBlock, string _title, string _description) returns(address) {
        Proposal proposalAddress = new Proposal(_endBlock, _title, _description);
        proposals[proposalAddress] = Proposal(proposalAddress);

        return proposalAddress;
    }

    modifier isAssetOwner() {
        require(asset.balanceOf(msg.sender) > 0);
        _;
    }
}
