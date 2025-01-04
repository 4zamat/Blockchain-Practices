// Task 6
// Write a contract that contains one function
// This function takes three integer arguments number1, number2, and operation
// If the operation value is 1, the function returns the sum of number1 and number2
// If the operation value is 2, the function returns the difference of number1 and number2
// If the operation value is 3, the function returns the multiplication of number1 and number2
// If the operation value is 4, the function returns the ratio of number1 and number2

pragma solidity ^0.8.15;

contract Calculator {
    // Function to perform the desired operation based on the operation value
    function calculate(int256 number1, int256 number2, uint8 operation) public pure returns (int256) {
        if (operation == 1) {
            return number1 + number2; // Addition
        } else if (operation == 2) {
            return number1 - number2; // Subtraction
        } else if (operation == 3) {
            return number1 * number2; // Multiplication
        } else if (operation == 4) {
            require(number2 != 0, "Division by zero is not allowed");
            return number1 / number2; // Division
        } else {
            revert("Invalid operation"); // Revert if operation is not valid
        }
    }
}
