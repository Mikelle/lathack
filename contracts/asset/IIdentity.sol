pragma solidity ^0.4.15;

import './IInformation.sol';

contract IIdentity is IInformation {

    address account;

    struct Identity {
    	string name;
    	bool isKYCCompleted;
    }
    
    mapping(address => Identity) identities;

    function setName(string _name) onlySource {
		identities[msg.sender].name = _name;
		FieldStringChanged("Setted name to IIDentity", _name, msg.sender);
	}

	function setKYCCompleted(bool _isKYCCompleted) onlySource {
		identities[msg.sender].isKYCCompleted = _isKYCCompleted;
		FieldBoolChanged("Setted isKYCCompleted", _isKYCCompleted, msg.sender);
	}

	function getName() constant returns (string) {
		return identities[msg.sender].name;
	}

	function getKYCCompleted() constant returns (bool) {
		return identities[msg.sender].isKYCCompleted;
	}


}