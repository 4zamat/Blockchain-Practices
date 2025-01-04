// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

contract IteratorExample {
    int public number; // Public variable to store the number
    int public iterator; // Public variable to track iterations

    // Function to set the number and call iteration
    function setNumber(int _number) public returns (int256) {
        number = _number; // Initialize the number variable
        int _iterator = iteration(); // Call iteration and store its return value
        return _iterator; // Return the local variable _iterator
    }

    // Function to increment the iterator and return its value
    function iteration() public returns (int256) {
        iterator += 1; // Increment the iterator by one
        return iterator; // Return the updated iterator value
    }
}
