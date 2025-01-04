// Task 5

// Write a contract that contains one function

// This function helps calculate the profit from a bank deposit
// It takes three values - the initial deposit amount, the interest rate, and the number of months for which the deposit is made

// The function returns the deposit amount after months

// This tariff uses compound interest - at the end of each month, an amount equal to the rate of interest on the current deposit amount is added to the deposit

pragma solidity ^0.8.15;

contract BankDeposit {
    function calculateProfit(uint256 principal, uint256 interestRate, uint256 months) public pure returns (uint256) {
        require(principal > 0, "Principal amount must be greater than zero");
        require(interestRate > 0, "Interest rate must be greater than zero");
        require(months > 0, "Number of months must be greater than zero");

        uint256 amount = principal;

        for (uint256 i = 0; i < months; i++) {
            amount += (amount * interestRate) / 100; // Compound interest calculation
        }

        return amount;
    }
}
