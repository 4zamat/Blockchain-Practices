pragma solidity ^0.8.15;

contract Task2 {
    int16 number16; // 16-bit integer
    int256 number256; // 256-bit integer

    // Function to set the value of number16
    function setNumber16(int16 number) public {
        number16 = number;
    }

    // Function to set the value of number256
    function setNumber256(int256 number) public {
        number256 = number;
    }

    // Function to get the value of number16
    function getNumber16() public view returns (int16) {
        return number16;
    }

    // Function to get the value of number256
    function getNumber256() public view returns (int256) {
        return number256;
    }

    // Function to return the sum of number16 and number256
    function getSum() public view returns (int256) {
        return number256 + int256(number16);
    }
}
