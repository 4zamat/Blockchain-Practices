pragma solidity ^0.8.15;

contract Leaderboard {
    // Mapping to store scores
    mapping(address => uint16) public scores;
    // Array to keep track of player addresses
    address[] private players;

    // Function to set a player's score
    function setScore(address player, uint16 score) public {
        if (scores[player] == 0) {
            players.push(player); // Add player to the list if they are new
        }
        scores[player] = score; // Update the player's score
    }

    // Function to retrieve a player's score
    function getScore(address player) public view returns (uint16) {
        return scores[player];
    }

    // Function to reset a player's score
    function resetScore(address player) public {
        scores[player] = 0; // Set the player's score to zero
    }

    // Function to calculate the total score of all players
    function getTotalScore() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < players.length; i++) {
            total += scores[players[i]];
        }
        return total;
    }

    // Function to determine the player with the highest score
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
