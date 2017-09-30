pragma solidity ^0.4.9;

contract IIdentity {
    bytes name;
}

contract Source {
    address sourceAddress;
    
    function Source() {
        sourceAddress = msg.sender;
    }
    
    modifier onlySource() {
        require(msg.sender == sourceAddress);
        _;
    }
    
    function transferSource(address newSourceAddress) onlySource {
        sourceAddress = newSourceAddress;
    }
}
contract IInformation is Source {
    
    event FieldChanged(int field, bytes newValue, address sourceAddress, 
    uint requestId);
    
	function setField(int field, bytes value, uint requestId) onlySource returns (bool ok);
}

contract Sportsman is IIdentity, IInformation {
    bytes salary;
    
    function setField(int field, bytes value, uint requestId) onlySource returns (bool ok) {
        if (field == 0) {
            setName(value);
            FieldChanged(field, value, sourceAddress, requestId);
        } else if (field == 1) {
            setSalary(salary);
            FieldChanged(field, value, sourceAddress, requestId);
        }
    }
    
    function setName(bytes _name) {
        name = _name;
    }
    
    function getName() constant returns(bytes) {
        return name;
    }
    
    function setSalary(bytes _salary) {
        salary = _salary;
    }
    
    function getSalary() constant returns(bytes) {
        return salary;
    }
}