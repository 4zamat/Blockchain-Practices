pragma solidity ^0.8.15;

contract ArithmeticOperations {
    uint256 public value; // State variable to store the value

    // Function to add a value, with a public modifier
    function add(uint256 _value) public {
        value += _value; // Add _value to value
    }

    // Function to subtract a value, with an external modifier
    function subtract(uint256 _value) external {
        require(value >= _value, "Cannot subtract more than the current value"); // Ensure no underflow
        value -= _value; // Subtract _value from value
    }

    // Function to multiply value by a given number, with an internal modifier
    function multiply(uint256 _value) internal {
        value *= _value; // Multiply value by _value
    }

    // Function to divide value by a given number, with a private modifier
    function divide(uint256 _value) private {
        require(_value > 0, "Division by zero is not allowed"); // Ensure no division by zero
        value /= _value; // Divide value by _value
    }

    // Function to test multiply (calls the internal function)
    function testMultiply(uint256 _value) public {
        multiply(_value); // Call the internal multiply function
    }

    // Function to test divide (calls the private function)
    function testDivide(uint256 _value) public {
        divide(_value); // Call the private divide function
    }
}
