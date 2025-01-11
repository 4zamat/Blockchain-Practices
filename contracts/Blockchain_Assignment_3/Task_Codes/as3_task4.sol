pragma solidity ^0.8.15;

contract PalindromeChecker {
    function isPalindrome(uint256 n) public pure returns (bool) {
        uint256 original = n;
        uint256 reversed = 0;
        uint256 remainder;

        while (n > 0) {
            remainder = n % 10; // last digit
            reversed = reversed * 10 + remainder; //reversed number
            n /= 10; // Remove last
        }

        return original == reversed;
    }
}
