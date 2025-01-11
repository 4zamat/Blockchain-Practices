pragma solidity ^0.8.15;

contract PerfectSquareChecker {
    // Function to check if a number is a perfect square
    function isPerfectSquare(uint256 n) public pure returns (bool) {
        if (n == 0 || n == 1) {
            return true; // 0 and 1 are perfect squares
        }

        uint256 low = 1;
        uint256 high = n;

        // Use binary search to find the square root
        while (low <= high) {
            uint256 mid = (low + high) / 2;
            uint256 square = mid * mid;

            if (square == n) {
                return true; // Found the square root
            } else if (square < n) {
                low = mid + 1; // Move to the right half
            } else {
                high = mid - 1; // Move to the left half
            }
        }

        return false; // Not a perfect square
    }
}
