pragma solidity ^0.8.15;

contract MaxValueFinder {
    // Function to find the maximum value in an array
    function findMax(int256[] memory numbers) public pure returns (int256) {
        require(numbers.length > 0, "Array must not be empty"); // Ensure the array is not empty

        int256 max = numbers[0]; // Initialize max with the first element

        // Iterate through the array to find the maximum value
        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i]; // Update max if a larger value is found
            }
        }

        return max; // Return the maximum value
    }
}
