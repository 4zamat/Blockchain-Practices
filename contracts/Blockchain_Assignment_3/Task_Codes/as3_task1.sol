pragma solidity ^0.8.15;

contract SumCalculator {
    // Function to calculate the sum of all elements in the list
    function calculateSum(int256[] memory numbers) public pure returns (int256) {
        int256 sum = 0;

        // Iterate through the array and calculate the sum
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }

        return sum;
    }
}
