pragma solidity ^0.8.15;

contract SavingsAccount {
    // Mapping to track balances of users
    mapping(address => uint256) public balances;

    // Function to deposit ETH into the account
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value; // Update the user's balance
    }

    // Function to withdraw ETH from the account
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount; // Deduct the amount from the user's balance
        payable(msg.sender).transfer(amount); // Transfer the amount to the user
    }

    // Function to check the contract's balance (optional for testing)
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
