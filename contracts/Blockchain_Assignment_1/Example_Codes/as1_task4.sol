pragma solidity ^0.8.15;

contract calculator {
    function summa(int256 number1,int256 number2) public pure returns (int256) {
        return number1+number2;
    }

    function substraction(int256 number1,int256 number2) public pure returns (int256) {
        return number1-number2;
    }

    function multiplication (int256 number1,int256 number2) public pure returns (int256) {
        return number1*number2;
    
    }

    function division  (int256 number1,int256 number2) public pure returns (int256) {
        require (number2 != 0, "can not divide by zero");
        return number1/number2;
    }

    function remainder (int256 number1,int256 number2) public pure returns (int256) {
       require (number2 != 0, "can not divide by zero");
        return number1%number2;
    }
}
