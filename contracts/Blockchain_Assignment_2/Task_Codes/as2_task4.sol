pragma solidity ^0.8.15;

contract VotingSystem {
    // State variables to store votes
    uint256 public votesFor;
    uint256 public votesAgainst;

    // Function to increment votesFor
    function voteFor() public {
        votesFor += 1;
    }

    // Function to increment votesAgainst
    function voteAgainst() public {
        votesAgainst += 1;
    }

    // Function to return the current vote counts
    function getVotes() public view returns (uint256, uint256) {
        return (votesFor, votesAgainst);
    }

    // Internal function to reset votes
    function resetVotes() internal {
        votesFor = 0;
        votesAgainst = 0;
    }
}
