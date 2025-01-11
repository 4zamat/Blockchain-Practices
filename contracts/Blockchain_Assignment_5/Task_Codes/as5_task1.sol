pragma solidity ^0.8.15;

contract OwnerOnlySetter {
    // Variables
    uint256 public value; // Variable to store a value
    address public owner; // Variable to store the owner's address

    // Constructor to set the owner as the deployer
    constructor() {
        owner = msg.sender;
    }

    // Function to set the value, restricted to the owner
    function setValue(uint256 _value) public {
        require(msg.sender == owner, "You are not the owner"); // Restrict access to the owner
        value = _value; // Update the value variable
    }
}
