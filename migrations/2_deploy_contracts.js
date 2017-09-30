var Sportsman = artifacts.require('./Sportsman.sol');

module.exports = function(deployer) {
  deployer.deploy(Sportsman);
};
