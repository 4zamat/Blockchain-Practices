// Problem 9

// Write a contract that contains one function

// This function takes two arguments, the numbers number1 and number2
// The function returns the greatest common divisor of these two numbers

// hint: the Euclidean algorithm will help you find the greatest common divisor

pragma solidity ^0.8.15;

contract GCD {
    // Function to calculate the greatest common divisor of two numbers
    function findGCD(uint256 number1, uint256 number2) public pure returns (uint256) {
        require(number1 > 0 && number2 > 0, "Numbers must be greater than 0");

        while (number2 != 0) {
            uint256 temp = number2;
            number2 = number1 % number2;
            number1 = temp;
        }

        return number1;
    }
}
