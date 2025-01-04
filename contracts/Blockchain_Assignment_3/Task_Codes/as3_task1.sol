pragma solidity ^0.8.15;

contract GreaterNumber {
    // Function to return the greater of two numbers
    // If the numbers are equal, it returns either of them
    function getGreater(int256 number1, int256 number2) public pure returns (int256) {
        if (number1 >= number2) {
            return number1;
        } else {
            return number2;
        }
    }
}
