pragma solidity ^0.8.15;

contract StringReverser {
    // Function to reverse a string
    function reverseString(string memory input) public pure returns (string memory) {
        bytes memory strBytes = bytes(input); // Convert the string to bytes
        bytes memory reversed = new bytes(strBytes.length); // Create a new bytes array for the reversed string

        // Reverse the string
        for (uint256 i = 0; i < strBytes.length; i++) {
            reversed[i] = strBytes[strBytes.length - 1 - i];
        }

        return string(reversed); // Convert the reversed bytes back to a string and return it
    }
}
