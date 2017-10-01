pragma solidity ^0.4.15;

import './IIdentity.sol';
import './LiquidAsset.sol';

contract IAuthority {
	function isCapableForIdentity(IIdentity identity) {

	}
	function isCapableForAsset(LiquidAsset asset) {

	}

	function canSell(IIdentity identity, LiquidAsset asset) {
		
	}

	function canBuy(IIdentity identity, LiquidAsset asset) {

	}
}