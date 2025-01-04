pragma solidity ^0.8.15;

contract SimpleStorage {
    int64 value;

    // Function to set the value
    function setValue(int64 number) public {
        value = number;
    }

    // Function to get the value
    function getValue() public view returns (int64) {
        return value;
    }
}
