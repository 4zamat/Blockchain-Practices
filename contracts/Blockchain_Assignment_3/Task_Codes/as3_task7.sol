pragma solidity ^0.8.15;

contract EvenNumberFilter {
    // Function to filter even numbers from an array
    function filterEvenNumbers(int256[] memory numbers) public pure returns (int256[] memory) {
        // First, count the number of even numbers
        uint256 count = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        // Create a new array to store the even numbers
        int256[] memory evens = new int256[](count);

        // Populate the array with even numbers
        uint256 index = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }

        return evens; // Return the array of even numbers
    }
}
