pragma solidity ^0.8.15;

contract SortedChecker {
    // Function to check if a list is sorted in ascending order
    function isSorted(int256[] memory numbers) public pure returns (bool) {
        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] < numbers[i - 1]) {
                return false;
            }
        }
        return true;
    }
}
