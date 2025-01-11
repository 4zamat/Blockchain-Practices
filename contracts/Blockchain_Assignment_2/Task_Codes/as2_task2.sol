pragma solidity ^0.8.15;

contract TokenManagement {
    // State variables
    uint256 public totalSupply; // Total supply of tokens
    uint256 public balance;     // Balance of tokens

    // Function to mint tokens
    function mint(uint256 _amount) public {
        totalSupply += _amount; // Add the amount to totalSupply
    }

    // Function to transfer tokens
    function transfer(uint256 _amount) public {
        require(balance >= _amount, "Insufficient balance"); // Ensure enough balance to transfer
        balance -= _amount; // Decrease balance by _amount
    }

    // Function to receive tokens
    function receiveTokens(uint256 _amount) public {
        balance += _amount; // Increase balance by _amount
    }

    // Function to get token information
    function getTokenInfo() public view returns (uint256, uint256) {
        return (totalSupply, balance); // Return totalSupply and balance
    }
}
