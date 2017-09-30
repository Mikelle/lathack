const Sportsman = artifacts.require('./Sportsman.sol');
const Proposal = artifacts.require("./Proposal.sol");
const PayableProposal = artifacts.require("./PayableProposal.sol");
const FinalizableProposal = artifacts.require("./FinalizableProposal.sol");

module.exports = function(deployer) {
    deployer.deploy(Sportsman);
    // deployer.deploy(PayableProposal);
    // deployer.deploy(FinalizableProposal);
    // deployer.link(PayableProposal, Proposal);
    // deployer.link(FinalizableProposal, Proposal);
    //
    // deployer.deploy(Proposal, false, 20, "title", "description");
};
