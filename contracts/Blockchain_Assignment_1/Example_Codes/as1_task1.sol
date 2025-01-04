pragma solidity ^0.8.15;

contract task1 {
    int64 value;
    function saveValue (int64  number) public {
        value = number;
    }
    function getValue() public view returns (int64) {
        return value;
    } 
}
