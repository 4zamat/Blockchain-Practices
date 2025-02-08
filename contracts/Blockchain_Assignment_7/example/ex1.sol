pragma solidity ^0.8.0;

library Int256ArrayLibrary {
    function init(uint256 length) internal pure returns (int256[] memory) {
        int256[] memory newArray = new int256[](length);
        for (uint256 i = 0; i < length; i++) {
            newArray[i] = int256(i);
        }
        return newArray;
    }

    function map(int256[] memory data, function(int256) pure returns(int256) f) internal pure returns (int256[] memory) {
        for (uint256 i = 0; i < data.length; i++) {
            data[i] = f(data[i]);
        }
        return data;
    }

    function reduce(int256[] memory data, function(int256[] memory) pure returns(int256) f) internal pure returns (int256) {
        return f(data);
    }

    function sum(int256[] memory data) internal pure returns (int256) {
        int256 result = 0;
        for (uint256 i = 0; i < data.length; i++) {
            result += data[i];
        }
        return result;
    }

    function mult(int256[] memory data) internal pure returns (int256) {
        int256 result = 1;
        for (uint256 i = 0; i < data.length; i++) {
            result *= data[i];
        }
        return result;
    }

    function reverse(int256 value) internal pure returns (int256) {
        return value * -1;
    }

    function reverseArray(int256[] memory data) internal pure returns (int256[] memory) {
        int256[] memory result = new int256[](data.length);
        for (uint256 i = 0; i < data.length; i++) {
            result[i] = reverse(data[i]);
        }
        return result;
    }
}

contract ArrayManipulationContract {
    using Int256ArrayLibrary for int256[];

    function initializeAndSum(uint256 length) external pure returns (int256) {
        int256[] memory array = Int256ArrayLibrary.init(length);
        return array.sum();
    }

    function mapAndReverse(int256[] memory data) external pure returns (int256[] memory) {
        return data.map(Int256ArrayLibrary.reverse);
    }

    function reduceAndMultiply(int256[] memory data) external pure returns (int256) {
        return data.reduce(Int256ArrayLibrary.mult);
    }

    function sumAndReverse(int256[] memory data) external pure returns (int256) {
        int256[] memory reversedArray = data.reverseArray();
        return reversedArray.sum();
    }

    function reverseArray(int256[] memory data) external pure returns (int256[] memory) {
        return data.reverseArray();
    }
}
