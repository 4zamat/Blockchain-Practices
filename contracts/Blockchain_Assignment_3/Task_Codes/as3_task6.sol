pragma solidity ^0.8.15;

contract VowelCounter {
    function countVowels(string memory input) public pure returns (uint256) {
        bytes memory strBytes = bytes(input);
        uint256 vowelCount = 0;

        for (uint256 i = 0; i < strBytes.length; i++) {
            bytes1 char = strBytes[i];
            if (
                char == "a" || char == "e" || char == "i" || char == "o" || char == "u" ||
                char == "A" || char == "E" || char == "I" || char == "O" || char == "U"
            ) {
                vowelCount++;
            }
        }

        return vowelCount;
    }
}
