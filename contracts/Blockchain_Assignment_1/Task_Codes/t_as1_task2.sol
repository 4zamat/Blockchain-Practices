pragma solidity ^0.8.15;

contract FlagCounter {
    // State variables
    bool public flag; // Boolean variable
    uint128 public counter; // Unsigned 128-bit integer

    // Function to toggle the value of flag
    function toggleFlag() public {
        flag = !flag; // Toggle the value of flag
    }

    // Function to reset counter to zero
    function resetCounter() public {
        counter = 0; // Reset counter to zero
    }

    // Function to increment counter by a given value
    function incrementCounter(uint128 value) public {
        counter += value; // Increment counter by the given value
    }

    // Function to decrement counter by a given value
    function decrementCounter(uint128 value) public {
        require(counter >= value, "Counter cannot be negative"); // Ensure counter does not go below zero
        counter -= value; // Decrement counter by the given value
    }

    // View function to return the current values of flag and counter
    function getValues() public view returns (bool, uint128) {
        return (flag, counter); // Return current values of flag and counter
    }
}
