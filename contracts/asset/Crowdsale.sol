pragma solidity ^0.4.15;

import './LiquidAsset.sol';
import './Source';

contract Crowdsale is Source {
    
	using SafeMath for uint;

	address owner;

	uint restrictedPercent;

	address restricted;

	LiquidAsset token;

	uint rate;

	uint start;

	uint period;

	function Crowdsale(string _name, string _symbol, uint256 _initialSupply, 
	address _owner, address _restricted, uint _restrictedPercent, uint _rate, 
	uint _start, uint _period) {
		token = new LiquidAsset(_name, _symbol, _initialSupply);
		owner = _owner;
		restricted = _restricted;
		restrictedPercent = _restrictedPercent;
		rate = _rate;
		start = _start;
		period = _period;
	}

	modifier saleIsOn() {
		require(now > start && now < start + period * 1 days);
		_;
	}

	function createTokens() saleIsOn payable {
		owner.transfer(msg.value);
		uint tokens = rate.mul(msg.value).div(1 ether);
		token.transfer(msg.sender, tokens);
		uint restrictedTokens = tokens.mul(restrictedPercent).div(100 - restrictedPercent);
		token.transfer(restricted, restrictedTokens);
	}

	function() external payable {
		createTokens();
	}
}