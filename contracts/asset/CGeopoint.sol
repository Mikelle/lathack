pragma solidity ^0.4.15;

import './IInformation.sol';

contract CGeopoint is IInformation {
	uint latitude;
	uint longtitude;

	function setLatitude(uint _latitude) {
		latitude = _latitude;
		FieldUintChanged("Setted latitude to geopoint", _latitude, sourceAddress);
	}

	function setLongtitude(uint _longtitude) {
		longtitude = _longtitude;
		FieldUintChanged("Setted longtitude to geopoint", _longtitude, sourceAddress);
	}

	function getLatitude() constant returns (uint) {
		return latitude;
	}

	function getLongtitude() constant returns (uint) {
		return longtitude;
	}
}
