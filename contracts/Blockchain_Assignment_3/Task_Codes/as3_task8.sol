pragma solidity ^0.8.15;

contract DigitSum {
    // Function to calculate the sum of the digits of a number
    function sumOfDigits(uint256 n) public pure returns (uint256) {
        uint256 sum = 0;

        // Extract digits and calculate their sum
        while (n > 0) {
            sum += n % 10; // Add the last digit to the sum
            n /= 10;       // Remove the last digit
        }

        return sum; // Return the total sum of digits
    }
}
