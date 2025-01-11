pragma solidity ^0.8.15;

contract DigitSum {
    function sumOfDigits(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;

        while (n > 0) {
            sum += n % 10;
            n /= 10;
        }

        return sum;
    }
}

//123 = 1+2+3=6
