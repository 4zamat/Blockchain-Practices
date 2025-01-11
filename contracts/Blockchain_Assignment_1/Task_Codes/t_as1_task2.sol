pragma solidity ^0.8.15;

contract FlagCounter {
    bool public flag;
    uint128 public counter;

    function toggleFlag() public {
        flag = !flag;
    }

    function resetCounter() public {
        counter = 0;
    }

    function incrementCounter(uint128 value) public {
        counter += value;
    }

    function decrementCounter(uint128 value) public {
        require(counter >= value, "Counter cannot be negative");
        counter -= value;
    }

    function getValues() public view returns (bool, uint128) {
        return (flag, counter);
    }
}
