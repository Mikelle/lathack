pragma solidity ^0.4.15;

import '/usr/local/lib/node_modules/zeppelin-solidity/contracts/token/StandartToken.sol';

contract LiquidAsset is StandartToken {
	
	string name;
	string symbol;
	uint256 initialSupply;

	function LiquidAsset(string _name, string _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        initialSupply = _initialSupply * 1 ether;
        balances[msg.sender] = _initialSupply * 1 ether;
    }

	uint32 public constant decimals = 18;
}