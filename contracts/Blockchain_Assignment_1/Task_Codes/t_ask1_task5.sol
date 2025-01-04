pragma solidity ^0.8.15;

contract Calculator {
    // Variables to store the operands, result, and operation name
    int32 private operand1;
    int32 private operand2;
    int64 private lastResult;
    string private lastOperation;

    // Function to perform addition
    function add(int32 number1, int32 number2) public returns (int64) {
        operand1 = number1;
        operand2 = number2;
        lastResult = int64(operand1 + operand2);
        lastOperation = "Addition";
        return lastResult;
    }

    // Function to perform subtraction
    function subtract(int32 number1, int32 number2) public returns (int64) {
        operand1 = number1;
        operand2 = number2;
        lastResult = int64(operand1 - operand2);
        lastOperation = "Subtraction";
        return lastResult;
    }

    // Function to perform multiplication
    function multiply(int32 number1, int32 number2) public returns (int64) {
        operand1 = number1;
        operand2 = number2;
        lastResult = int64(operand1 * operand2);
        lastOperation = "Multiplication";
        return lastResult;
    }

    // Function to perform division
    function divide(int32 number1, int32 number2) public returns (int64) {
        require(number2 != 0, "Division by zero is not allowed");
        operand1 = number1;
        operand2 = number2;
        lastResult = int64(operand1 / operand2);
        lastOperation = "Division";
        return lastResult;
    }

    // Function to get information about the last operation
    function getLastOperation()
        public
        view
        returns (int32, int32, int64, string memory)
    {
        return (operand1, operand2, lastResult, lastOperation);
    }
}
