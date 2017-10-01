pragma solidity ^0.4.15;

import "./IIdentity.sol";
import "./IInformation.sol";
import "./LiquidAsset.sol";

contract Sportsman is LiquidAsset, IInformation {
    uint salary;
    
    function setName(string _name) onlySource {
        name = _name;
        FieldStringChanged("Setted name", _name, sourceAddress);
    }
    
    function getName() constant returns(string) {
        return name;
    }
    
    function setSalary(uint _salary) onlySource {
        salary = _salary;
        FieldUintChanged("Setted salary", _salary, sourceAddress);
    }
    
    function getSalary() constant returns(uint) {
        return salary;
    }
}

