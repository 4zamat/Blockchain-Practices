pragma solidity ^0.8.15;

contract SimpleToken {
    // Token details
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // Mapping to track balances
    mapping(address => uint256) public balances;

    // Constructor to initialize the token details and assign totalSupply to the deployer
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply; // Assign all tokens to the deployer
    }

    // Function to transfer tokens
    function transfer(address to, uint256 amount) public returns (bool) {
        require(to != address(0), "Transfer to the zero address is not allowed");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount; // Deduct tokens from sender
        balances[to] += amount; // Add tokens to the recipient
        return true;
    }

    // Function to get the balance of an account
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
