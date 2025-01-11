pragma solidity ^0.8.15;

contract SortedChecker {
    // Function to check if a list is sorted in ascending order
    function isSorted(int256[] memory numbers) public pure returns (bool) {
        // Iterate through the array and check if it is sorted
        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] < numbers[i - 1]) {
                return false; // If any element is smaller than the previous one, return false
            }
        }
        return true; // If no issues found, the array is sorted
    }
}
