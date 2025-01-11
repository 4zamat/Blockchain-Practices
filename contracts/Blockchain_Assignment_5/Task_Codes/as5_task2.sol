pragma solidity ^0.8.15;

contract PermissionedToken {
    mapping(address => uint256) public balances;

    // Constructor to initialize the deployer with an initial balance
    constructor(uint256 initialSupply) {
        balances[msg.sender] = initialSupply; // Assign the initial supply to the deployer
    }

    function transfer(address recipient, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(recipient != address(0), "Invalid recipient address");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
