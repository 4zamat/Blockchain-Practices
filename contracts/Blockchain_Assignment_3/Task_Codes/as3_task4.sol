pragma solidity ^0.8.15;

contract PalindromeChecker {
    // Function to check if a number is a palindrome
    function isPalindrome(uint256 n) public pure returns (bool) {
        uint256 original = n; // Store the original number
        uint256 reversed = 0;
        uint256 remainder;

        // Reverse the digits of the number
        while (n > 0) {
            remainder = n % 10; // Get the last digit
            reversed = reversed * 10 + remainder; // Build the reversed number
            n /= 10; // Remove the last digit
        }

        // Check if the original number equals the reversed number
        return original == reversed;
    }
}
