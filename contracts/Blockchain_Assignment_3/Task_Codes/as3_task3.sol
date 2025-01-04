// Task 3

// Write a contract that contains one function

// This function takes three integer arguments a, b and c
// and returns true if
// a is either greater than b and c
// or if a is greater than c and less than b
// otherwise, the function returns false

pragma solidity ^0.8.15;

contract Comparition {
    function compare(int256 a, int256 b, int256 c) public pure returns (bool) {
        if (a > b && a > c) {
            return true;
        } else if (a > c && a < b) {
            return true;
        } else {
            return false;
        }
    }
}