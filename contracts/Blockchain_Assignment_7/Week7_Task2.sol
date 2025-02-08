// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathLib {
    function power(uint256 base, uint256 exponent) internal pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
        return result;
    }

    function factorial(uint256 n) internal pure returns (uint256) {
        require(n >= 0, "Factorial is not defined for negative numbers");
        uint256 result = 1;
        for (uint256 i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    function gcd(uint256 a, uint256 b) internal pure returns (uint256) {
        while (b != 0) {
            uint256 temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }
}

contract MathLibraryUser {
    using MathLib for uint256;

    function calculatePower(uint256 base, uint256 exponent) public pure returns (uint256) {
        return base.power(exponent);
    }

    function calculateFactorial(uint256 n) public pure returns (uint256) {
        return n.factorial();
    }

    function calculateGCD(uint256 a, uint256 b) public pure returns (uint256) {
        return a.gcd(b);
    }
}
