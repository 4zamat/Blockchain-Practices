pragma solidity ^0.8.15;

contract VotingSystem {
    uint256 public votesFor;
    uint256 public votesAgainst;

    function voteFor() public {
        votesFor += 1;
    }

    function voteAgainst() public {
        votesAgainst += 1;
    }

    function getVotes() public view returns (uint256, uint256) {
        return (votesFor, votesAgainst);
    }

    function resetVotes() internal {
        votesFor = 0;
        votesAgainst = 0;
    }
}
