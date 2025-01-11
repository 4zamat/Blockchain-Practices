pragma solidity ^0.8.15;

contract StringReverser {
    function reverseString(string memory input) public pure returns (string memory) {
        bytes memory strBytes = bytes(input);
        bytes memory reversed = new bytes(strBytes.length); // new bytes array for string

        for (uint256 i = 0; i < strBytes.length; i++) {
            reversed[i] = strBytes[strBytes.length - 1 - i];
        }

        return string(reversed);
    }
}
