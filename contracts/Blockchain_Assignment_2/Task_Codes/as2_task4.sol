pragma solidity ^0.8.15;

contract MultiCalculator {
    int256 public sum;  // Variable to store the sum
    int256 public sub;  // Variable to store the difference
    int256 public mult; // Variable to store the product
    int256 public div;  // Variable to store the quotient

    // Internal function to perform addition
    function addition(int256 number1, int256 number2) internal {
        sum = number1 + number2;
    }

    // Internal function to perform subtraction
    function subtraction(int256 number1, int256 number2) internal {
        sub = number1 - number2;
    }

    // Internal function to perform multiplication
    function multiplication(int256 number1, int256 number2) internal {
        mult = number1 * number2;
    }

    // Internal function to perform division
    function division(int256 number1, int256 number2) internal {
        require(number2 != 0, "No division by zero");
        div = number1 / number2;
    }

    // Internal function to return the results
    function getResult() internal view returns (int256, int256, int256, int256) {
        return (sum, sub, mult, div);
    }

    // Public function to perform all operations and return results
    function start(int256 number1, int256 number2) public returns (int256, int256, int256, int256) {
        addition(number1, number2);
        subtraction(number1, number2);
        multiplication(number1, number2);
        division(number1, number2);

        int256 _sum;
        int256 _sub;
        int256 _mult;
        int256 _div;

        (_sum, _sub, _mult, _div) = getResult();

        return (_sum, _sub, _mult, _div);
    }
}
