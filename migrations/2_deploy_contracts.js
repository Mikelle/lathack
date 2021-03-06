const Sportsman = artifacts.require('./asset/Sportsman.sol');
const LiquidAsset = artifacts.require('./asset/LiquidAsset.sol');
const Crowdsale = artifacts.require('./asset/Crowdsale.sol');
const Proposal = artifacts.require("./Proposal.sol");
const FinalizableProposal = artifacts.require("./FinalizableProposal.sol");

module.exports = function(deployer) {
    deployer.deploy(Sportsman);
    deployer.deploy(LiquidAsset);
    deployer.deploy(Crowdsale);
    // deployer.deploy(PayableProposal);
    // deployer.deploy(FinalizableProposal);
    // deployer.link(PayableProposal, Proposal);
    // deployer.link(FinalizableProposal, Proposal);
    //
    // deployer.deploy(Proposal, false, 20, "title", "description");
};
