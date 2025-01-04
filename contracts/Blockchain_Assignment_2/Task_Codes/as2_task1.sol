pragma solidity ^0.8.15;

contract Task1 {
    uint number1;
    uint number2;

    // Function to initialize number1 and number2
    function setNumbers(uint _number1, uint _number2) public {
        number1 = _number1;
        number2 = _number2;
    }

    // Function to return the values of number1 and number2
    function getNumbers() public view returns (uint, uint) {
        return (number1, number2);
    }

    // Function to calculate the sum of number1, number2, and an additional number
    function getSum(uint number) public view returns (uint) {
        return number + number1 + number2;
    }

    // Function to calculate the sum of two given integers
    function getSum(uint _number1, uint _number2) public pure returns (uint) {
        return _number1 + _number2;
    }
}
