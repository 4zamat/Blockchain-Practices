pragma solidity ^0.8.15;

contract LimitedCounter {
    // Public variable to store the current counter value
    uint256 public count;

    // Function to increment the counter
    function increment(uint256 value) public {
        require(value <= 10, "Value exceeds the allowed limit of 10"); // Restrict increment to a maximum of 10
        count += value; // Increase the counter by the value
    }

    // Function to decrement the counter
    function decrement(uint256 value) public {
        require(value <= count, "Value exceeds the current counter value"); // Ensure the counter does not go below zero
        count -= value; // Decrease the counter by the value
    }
}
