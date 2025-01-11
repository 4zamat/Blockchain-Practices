pragma solidity ^0.8.15;

contract PermissionedToken {
    // Mapping to track balances
    mapping(address => uint256) public balances;

    // Constructor to initialize the deployer with an initial balance
    constructor(uint256 initialSupply) {
        balances[msg.sender] = initialSupply; // Assign the initial supply to the deployer
    }

    // Function to transfer tokens
    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance"); // Ensure the sender has enough balance
        require(recipient != address(0), "Invalid recipient address"); // Prevent sending to the zero address

        balances[msg.sender] -= amount; // Deduct the amount from the sender's balance
        balances[recipient] += amount; // Add the amount to the recipient's balance
    }
}
