pragma solidity ^0.8.15;

contract FixedInterestSavings {
    // Mapping to track deposits of each user
    mapping(address => uint256) public deposits;

    // Fixed interest rate
    uint256 public constant interestRate = 5; // 5% interest

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        deposits[msg.sender] += msg.value;
    }

    function withdrawWithInterest() public {
        uint256 principal = deposits[msg.sender];
        require(principal > 0, "No funds to withdraw");

        uint256 interest = (principal * interestRate) / 100;

        uint256 totalAmount = principal + interest;

        require(address(this).balance >= totalAmount, "Insufficient balance");

        // Reset user balance
        deposits[msg.sender] = 0;

        // Transfer the total amount to the user
        payable(msg.sender).transfer(totalAmount);
    }

    // Function to check the contract's balance (optional for testing)
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
