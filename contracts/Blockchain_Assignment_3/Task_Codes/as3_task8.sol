// Problem 8

// Write a contract that contains one function

// This function takes one value - the number n and returns the n-th element of the Fibonacci series

pragma solidity ^0.8.15;

contract Fibonacci {
    function getFibonacci(uint256 n) public pure returns (uint256) {
        require(n > 0, "n must be greater than 0");

        if (n == 1) {
            return 0; // The first Fibonacci number is 0
        } else if (n == 2) {
            return 1; // The second Fibonacci number is 1
        }

        uint256 a = 0;
        uint256 b = 1;
        uint256 fib;

        for (uint256 i = 3; i <= n; i++) {
            fib = a + b;
            a = b;
            b = fib;
        }

        return fib;
    }
}

