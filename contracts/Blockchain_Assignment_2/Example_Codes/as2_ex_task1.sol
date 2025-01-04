pragma solidity ^0.8.15;

contract task1 {

    uint number1;
    uint number2;

    function setNumbers (uint _number1, uint _number2) public {
        number1 =_number1;
        number2 =_number2;
    }

    function getNumbers () public view returns (uint,uint) {
        return (number1, number2);
    }

    function getSumma (uint number) public view returns (uint) {
        return number + number1 + number2;
    }

    function getSumma (uint _number1, uint _number2) public pure returns (uint) {
        return _number1 + _number2;
    }
}
