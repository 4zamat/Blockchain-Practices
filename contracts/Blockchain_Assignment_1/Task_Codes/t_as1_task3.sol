pragma solidity ^0.8.15;

contract Task3 {
    int128 value; // Variable to store the value

    // Function to set the value
    function setValue(int128 number) public {
        value = number;
    }

    // Function to return the sum of value and a given number
    function getSum(int128 number) public view returns (int128) {
        return value + number;
    }

    // Function to return the difference between value and a given number
    function getDifference(int128 number) public view returns (int128) {
        return value - number;
    }

    // Function to return the product of value and a given number
    function getProduct(int128 number) public view returns (int128) {
        return value * number;
    }

    // Function to return the result of dividing value by a given number
    function getQuotient(int128 number) public view returns (int128) {
        require(number != 0, "Division by zero is not allowed");
        return value / number;
    }

    // Function to return the remainder of dividing value by a given number
    function getRemainder(int128 number) public view returns (int128) {
        require(number != 0, "Division by zero is not allowed");
        return value % number;
    }
}
