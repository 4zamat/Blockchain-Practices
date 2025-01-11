pragma solidity ^0.8.15;

contract VotingContract {
    // Mapping to track if an address has already voted
    mapping(address => bool) public hasVoted;

    function vote() public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
    }
}
