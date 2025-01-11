pragma solidity ^0.8.15;

contract ArithmeticOperations {
    uint256 public value;

    function add(uint256 _value) public {
        value += _value;
    }

    function subtract(uint256 _value) external {
        require(value >= _value, "Cannot subtract more than the current value");
        value -= _value;
    }

    function multiply(uint256 _value) internal {
        value *= _value;
    }

    function divide(uint256 _value) private {
        require(_value > 0, "Division by zero is not allowed");
        value /= _value;
    }

    function testMultiply(uint256 _value) public {
        multiply(_value);
    }

    function testDivide(uint256 _value) public {
        divide(_value);
    }
}
