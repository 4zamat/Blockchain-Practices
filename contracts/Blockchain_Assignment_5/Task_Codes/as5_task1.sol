pragma solidity ^0.8.15;

contract OwnerOnlySetter {
    uint256 public value;
    address public owner;

    // Constructor to set the owner as the deployer
    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _value) public {
        require(msg.sender == owner, "You are not the owner");
        value = _value;
    }
}
