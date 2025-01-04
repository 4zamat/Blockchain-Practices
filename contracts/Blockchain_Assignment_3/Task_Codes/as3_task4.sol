// Task 4

// Write a contract that contains one function

// This function takes one value - some number, calculates and returns its factorial

// Factorial is the product of all numbers from some number n to 1 inclusive

// For example, the factorial of the number 5:

// 5! = 5 * 4 * 3 * 2 * 1 = 120

pragma solidity ^0.8.15;

contract FactorialCalculator {
    function calculateFactorial(uint256 number) public pure returns (uint256) {
        require(number >= 0, "Number must be non-negative");

        uint256 factorial = 1;
        for (uint256 i = 1; i <= number; i++) {
            factorial *= i;
        }

        return factorial;
    }
}
