pragma solidity ^0.8.15;

contract Leaderboard {
    // Mapping to store scores
    mapping(address => uint16) public scores;
    address[] private players;

    function setScore(address player, uint16 score) public {
        if (scores[player] == 0) {
            players.push(player);
        }
        scores[player] = score;
    }

    function getScore(address player) public view returns (uint16) {
        return scores[player];
    }

    function resetScore(address player) public {
        scores[player] = 0;
    }

    function getTotalScore() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < players.length; i++) {
            total += scores[players[i]];
        }
        return total;
    }

    function getHighestScorer() public view returns (address, uint16) {
        address highestScorer;
        uint16 highestScore = 0;

        for (uint256 i = 0; i < players.length; i++) {
            if (scores[players[i]] > highestScore) {
                highestScore = scores[players[i]];
                highestScorer = players[i];
            }
        }

        return (highestScorer, highestScore);
    }
}
