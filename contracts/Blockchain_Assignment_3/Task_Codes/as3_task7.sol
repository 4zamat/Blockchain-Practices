// Task 7

// Write a contract that contains one function

// This function takes a number as an argument and returns a Boolean value
// true - if it is a prime number
// false - if it is not a prime number

// A prime number is one that is divisible only by 1 and itself

pragma solidity ^0.8.15;

contract Prime {
    // Function to check if a number is prime
    function isPrime(uint256 number) public pure returns (bool) {
        if (number < 2) {
            return false; // Numbers less than 2 are not prime
        }
        for (uint256 i = 2; i * i <= number; i++) { // Only check up to square root
            if (number % i == 0) {
                return false; // If divisible, not a prime number
            }
        }
        return true; // Number is prime
    }
}
