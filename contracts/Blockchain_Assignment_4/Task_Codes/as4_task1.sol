pragma solidity ^0.8.15;

contract LimitedCounter {
    uint256 public count;

    function increment(uint256 value) public {
        require(value <= 10, "Value exceeds the allowed limit of 10");
        count += value;
    }

    function decrement(uint256 value) public {
        require(value <= count, "Value exceeds the current counter value");
        count -= value;
    }
}
