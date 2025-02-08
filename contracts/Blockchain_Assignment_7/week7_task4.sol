// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICallback {
    function onVotingEnded() external;
}

contract VotingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    address[] private registeredCallbacks;
    bool public votingEnded;

    event VoteCast(address indexed voter, uint256 candidateIndex);
    event VotingEnded();

    modifier onlyWhileVotingActive() {
        require(!votingEnded, "Voting has ended");
        _;
    }

    // Add a candidate
    function addCandidate(string memory name) public onlyWhileVotingActive {
        candidates.push(Candidate(name, 0));
    }

    // Register a callback contract
    function registerCallback(address callbackAddress) public onlyWhileVotingActive {
        require(callbackAddress != address(0), "Invalid callback address");
        registeredCallbacks.push(callbackAddress);
    }

    // Cast a vote
    function vote(uint256 candidateIndex) public onlyWhileVotingActive {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        require(!hasVoted[msg.sender], "You have already voted");

        candidates[candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;

        emit VoteCast(msg.sender, candidateIndex);
    }

    // End the voting and trigger callbacks
    function endVoting() public onlyWhileVotingActive {
        votingEnded = true;

        for (uint256 i = 0; i < registeredCallbacks.length; i++) {
            ICallback(registeredCallbacks[i]).onVotingEnded();
        }

        emit VotingEnded();
    }

    // Get the total number of candidates
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    // Get candidate details
    function getCandidate(uint256 index) public view returns (string memory, uint256) {
        require(index < candidates.length, "Invalid index");
        Candidate memory candidate = candidates[index];
        return (candidate.name, candidate.voteCount);
    }
}
