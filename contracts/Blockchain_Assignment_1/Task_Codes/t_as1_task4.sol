pragma solidity ^0.8.15;

contract Calculator {
    // Function to perform addition
    function add(int256 number1, int256 number2) public pure returns (int256) {
        return number1 + number2;
    }

    // Function to perform subtraction
    function subtract(int256 number1, int256 number2) public pure returns (int256) {
        return number1 - number2;
    }

    // Function to perform multiplication
    function multiply(int256 number1, int256 number2) public pure returns (int256) {
        return number1 * number2;
    }

    // Function to perform division
    function divide(int256 number1, int256 number2) public pure returns (int256) {
        require(number2 != 0, "Division by zero is not allowed");
        return number1 / number2;
    }

    // Function to find the remainder of division
    function remainder(int256 number1, int256 number2) public pure returns (int256) {
        require(number2 != 0, "Division by zero is not allowed");
        return number1 % number2;
    }
}
