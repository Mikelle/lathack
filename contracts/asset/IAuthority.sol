pragma solidity ^0.4.15;

import './IIdentity.sol';
import './LiquidAsset.sol';

contract IAuthority {

	function isCapableForIdentity(IIdentity identity) {

	}

	function isCapableForAsset(LiquidAsset asset) {

	}

	function canSell(IIdentity identity, LiquidAsset asset) returns (bool) {
		if (!identity.getKYCCompleted()) {
			return false;
		} 

		if (asset.balanceOf(msg.sender) == 0) {
			return false;
		}
	}

	function canBuy(IIdentity identity, LiquidAsset asset) returns (bool) {
		if (!identity.getKYCCompleted()) {
			return false;
		} 

	}
}