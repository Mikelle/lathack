pragma solidity ^0.4.15;

import './IAuthority.sol';

contract CAuthorityHelper {
	IAuthority[] authorities;

	function getCapableAuthorityForIdentity(IIdentity identity)
		returns (IAuthority authority);

	function getCapableAuthorityForAsset(LiquidAsset asset) returns (IAuthority authority);

	function getCapableAuthorityForDeal(IIdentity identity, LiquidAsset asset) returns (IAuthority authority);

	function registerAuthority(IAuthority authority);
	function unregisterAuthority(IAuthority authority);
}