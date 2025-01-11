pragma solidity ^0.8.15;

contract TokenMinting {
    // State variables
    address public owner; // Address of the contract owner
    mapping(address => uint256) public balances; // Mapping to track token balances

    // Constructor to initialize the owner
    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // Function to mint tokens
    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Cannot mint to the zero address"); // Prevent minting to the zero address
        balances[to] += amount; // Increase the recipient's balance
    }

    // Function to check the balance of an address
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
