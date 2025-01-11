pragma solidity ^0.8.15;

contract VowelCounter {
    // Function to count the vowels in a string
    function countVowels(string memory input) public pure returns (uint256) {
        bytes memory strBytes = bytes(input); // Convert the string to bytes
        uint256 vowelCount = 0;

        // Iterate through each character in the string
        for (uint256 i = 0; i < strBytes.length; i++) {
            // Check if the character is a vowel (case-insensitive)
            bytes1 char = strBytes[i];
            if (
                char == "a" || char == "e" || char == "i" || char == "o" || char == "u" ||
                char == "A" || char == "E" || char == "I" || char == "O" || char == "U"
            ) {
                vowelCount++;
            }
        }

        return vowelCount; // Return the count of vowels
    }
}
