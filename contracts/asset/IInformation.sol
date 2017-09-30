pragma solidity ^0.4.15;

import "./asset/Source.sol";

contract IInformation is Source {
    
    event FieldStringChanged(string message, string value, address sourceAddress);

    event FieldUintChanged(string message, uint value, address sourceAddress);
}