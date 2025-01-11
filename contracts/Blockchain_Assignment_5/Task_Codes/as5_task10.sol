pragma solidity ^0.8.15;

contract TokenVesting {
    // State variables
    address public beneficiary;   // Address of the token beneficiary
    uint256 public releaseDate;   // Timestamp when tokens can be claimed
    uint256 public tokenAmount;   // Number of tokens locked
    address public owner;         // Owner of the contract

    // Constructor to initialize the vesting contract
    constructor(address _beneficiary, uint256 _releaseDate, uint256 _tokenAmount) {
        require(_beneficiary != address(0), "Invalid beneficiary address");
        require(_releaseDate > block.timestamp, "Release date must be in the future");
        require(_tokenAmount > 0, "Token amount must be greater than zero");

        owner = msg.sender;
        beneficiary = _beneficiary;
        releaseDate = _releaseDate;
        tokenAmount = _tokenAmount;
    }

    // claim the release date
    function claimTokens() public {
        require(msg.sender == beneficiary, "Only the beneficiary can claim tokens");
        require(block.timestamp >= releaseDate, "Tokens are locked");

        uint256 amount = tokenAmount;
        tokenAmount = 0; // prevent reentrancy

        // Transfer tokens
        payable(beneficiary).transfer(amount);
    }

    // into vesting contract
    function depositTokens() public payable {
        require(msg.sender == owner, "Only the owner can deposit tokens");
        require(msg.value == tokenAmount, "Deposit amount must match the locked token amount");
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
