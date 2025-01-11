pragma solidity ^0.8.15;

contract PowerCalculator {
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        require(base > 0 || exponent > 0, "Base or exponent must be positive");
        if (exponent == 0) {
            return 1;
        }

        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }

        return result;
    }
}
