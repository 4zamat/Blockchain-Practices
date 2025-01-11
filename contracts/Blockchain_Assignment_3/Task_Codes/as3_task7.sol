pragma solidity ^0.8.15;

contract EvenNumberFilter {
    function filterEvenNumbers(int256[] memory numbers) public pure returns (int256[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }

        int256[] memory evens = new int256[](count);

        uint256 index = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }

        return evens;
    }
}
