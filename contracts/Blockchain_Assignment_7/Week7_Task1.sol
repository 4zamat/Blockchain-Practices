// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library StringLib {
    function concatenate(string[] memory arr) internal pure returns (string memory) {
        string memory result = "";
        for (uint256 i = 0; i < arr.length; i++) {
            result = string(abi.encodePacked(result, arr[i]));
        }
        return result;
    }

    function toUpperCase(string[] memory arr) internal pure returns (string[] memory) {
        string[] memory uppercased = new string[](arr.length);
        for (uint256 i = 0; i < arr.length; i++) {
            bytes memory bStr = bytes(arr[i]);
            bytes memory bUpper = new bytes(bStr.length);
            for (uint256 j = 0; j < bStr.length; j++) {
                if (bStr[j] >= 0x61 && bStr[j] <= 0x7A) {
                    bUpper[j] = bytes1(uint8(bStr[j]) - 32);
                } else {
                    bUpper[j] = bStr[j];
                }
            }
            uppercased[i] = string(bUpper);
        }
        return uppercased;
    }

    function filter(string[] memory arr, uint256 minLength) internal pure returns (string[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            if (bytes(arr[i]).length > minLength) {
                count++;
            }
        }

        string[] memory filtered = new string[](count);
        uint256 index = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            if (bytes(arr[i]).length > minLength) {
                filtered[index] = arr[i];
                index++;
            }
        }
        return filtered;
    }
}

contract StringLibraryUser {
    using StringLib for string[];

    string[] public data;

    function addString(string memory newString) public {
        data.push(newString);
    }

    function getConcatenated() public view returns (string memory) {
        return data.concatenate();
    }

    function getUpperCase() public view returns (string[] memory) {
        return data.toUpperCase();
    }

    function getFiltered(uint256 minLength) public view returns (string[] memory) {
        return data.filter(minLength);
    }
}
