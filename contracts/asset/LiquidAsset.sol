pragma solidity ^0.4.15;

import '/usr/local/lib/node_modules/zeppelin-solidity/contracts/token/StandardToken.sol';

contract LiquidAsset is StandardToken {
	
	string name;
	string symbol;
	uint256 initialSupply;

	struct Account {
		uint balance;
		uint lastDividends;
	}
	
    mapping(address => Account) accounts;
    uint totalSupply;
    uint totalDividends;
    
	function LiquidAsset(string _name, string _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        initialSupply = _initialSupply * 1 ether;
        accounts[msg.sender].balance = _initialSupply * 1 ether;
    }
    
	uint32 public constant decimals = 18;

	function dividendsOwing(address account) internal returns(uint) {
		var newDividends = totalDividends.sub(accounts[account].lastDividends);
		return ((accounts[account].balance).mul(newDividends).div(totalSupply));
	}

    modifier updateAccount(address account) {
    	var owing = dividendsOwing(account);
    	if (owing > 0) {
    		accounts[account].balance = accounts[account].balance.add(owing);
    		accounts[account].lastDividends = totalDividends;
    	}
    	_;
    }

    function addDividend() payable {
    	require(msg.value >= 0);
    	totalDividends = totalDividends.add(msg.value);
    }

    function transfer(address _to, uint256 _value) updateAccount(msg.sender) 
    updateAccount(_to) returns (bool) {
    	accounts[msg.sender].balance = accounts[msg.sender].balance.sub(_value);
    	accounts[_to].balance = accounts[_to].balance.add(_value);
    	Transfer(msg.sender, _to, _value);
    	return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) 
    updateAccount(_from) updateAccount(_to) returns (bool) {
    	var _allowance = allowed[_from][msg.sender];

    	accounts[_to].balance = accounts[_to].balance.add(_value);
    	accounts[_from].balance = accounts[_from].balance.sub(_value);
    	allowed[_from][msg.sender] = _allowance.sub(_value);
    	Transfer(_from, _to, _value);
    	return true;
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
    	return accounts[_owner].balance;
    }
}