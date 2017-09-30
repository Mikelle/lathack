pragma solidity ^0.4.15;


contract DAO {
    //ToDo: replace by Identity
    mapping(address => uint) identities;

    function DAO() {

    }

    function addIdentity(uint id) {
        identities[0] = 0;
    }
}
