pragma solidity ^0.8.15;

contract MaxValueFinder {
    function findMax(int256[] memory numbers) public pure returns (int256) {
        require(numbers.length > 0, "Array must not be empty");

        int256 max = numbers[0];

        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }

        return max;
    }
}
