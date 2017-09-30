pragma solidity ^0.4.15;

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