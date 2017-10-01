pragma solidity ^0.4.15;

contract CAuthorityHelper {
	IAuthority[] authorities;

	function getCapableAuthorityForIdentity(IIdentity identity)
		returns (IAuthority authority);
}