// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    address public owner;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raisedAmount;
    mapping(address => uint256) public contributions;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier campaignActive() {
        require(block.timestamp <= deadline, "The campaign has ended");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function startCampaign(uint256 _goal, uint256 _duration) public onlyOwner {
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable campaignActive {
        require(msg.value > 0, "Contribution must be greater than 0");
        contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    function withdrawFunds() public onlyOwner {
        require(raisedAmount >= goal, "Funding goal not reached");
        payable(owner).transfer(raisedAmount);
        raisedAmount = 0;
    }

    function refund() public {
        require(block.timestamp > deadline, "Campaign is still active");
        require(raisedAmount < goal, "Funding goal was reached, refunds not available");
        require(contributions[msg.sender] > 0, "No contributions to refund");

        uint256 amount = contributions[msg.sender];
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
