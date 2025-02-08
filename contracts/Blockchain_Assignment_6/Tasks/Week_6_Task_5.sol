// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenAirdrop {
    address public owner;
    mapping(address => uint256) public contributions;
    mapping(address => uint256) public tokenBalances;
    uint256 public totalTokens;
    uint256 public totalContributions;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(uint256 _totalTokens) {
        owner = msg.sender;
        totalTokens = _totalTokens;
    }

    function contribute() public payable {
        require(msg.value > 0, "Contribution must be greater than 0");
        contributions[msg.sender] += msg.value;
        totalContributions += msg.value;
    }

    function distributeTokens(uint256 tokens) public onlyOwner {
        require(totalContributions > 0, "No contributions made");
        require(tokens <= totalTokens, "Not enough tokens available");

        for (uint256 i = 0; i < totalContributions; i++) {
            address contributor = address(uint160(uint256(keccak256(abi.encodePacked(i, block.timestamp)))));
            if (contributions[contributor] > 0) {
                uint256 share = (contributions[contributor] * tokens) / totalContributions;
                tokenBalances[contributor] += share;
            }
        }

        totalTokens -= tokens;
    }

    function withdrawTokens() public {
        require(tokenBalances[msg.sender] > 0, "No tokens to withdraw");

        uint256 amount = tokenBalances[msg.sender];
        tokenBalances[msg.sender] = 0;

        // Replace with actual token transfer logic in a real token contract
        // For demonstration, assume it's just an event
        emit TokensWithdrawn(msg.sender, amount);
    }

    event TokensWithdrawn(address indexed user, uint256 amount);
}
