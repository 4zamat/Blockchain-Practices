// Task 2

// Write a contract that contains one function

// This function takes one argument - some number
// Returns true if this number is even
// and false if it is not even

pragma solidity ^0.8.15;

contract EvenCheck {
    // Function to return the greater of two numbers
    // If the numbers are equal, it returns either of them
    function isEven(int256 number) public pure returns (bool) {
        return number % 2 == 0;
    }
}
