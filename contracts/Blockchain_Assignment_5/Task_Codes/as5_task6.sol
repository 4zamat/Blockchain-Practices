pragma solidity ^0.8.15;

contract VotingContract {
    // Mapping to track if an address has already voted
    mapping(address => bool) public hasVoted;

    // Function to cast a vote
    function vote() public {
        require(!hasVoted[msg.sender], "Already voted"); // Check if the user has already voted
        hasVoted[msg.sender] = true; // Mark the user as having voted
    }
}
