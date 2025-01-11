pragma solidity ^0.8.15;

contract Lottery {
    address[] public players; // Array to store participants
    address public owner; // Owner of the contract

    // Constructor to initialize the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to enter the lottery
    function enter() public payable {
        require(msg.value == 1 ether, "You must send exactly 1 ETH to participate"); // Require 1 ETH
        players.push(msg.sender); // Add sender to the players array
    }

    // Function to pick a random winner
    function pickWinner() public {
        require(msg.sender == owner, "Only the owner can pick a winner"); // Restrict access to the owner
        require(players.length > 0, "No players in the lottery"); // Ensure there are participants

        uint256 winnerIndex = random() % players.length; // Pick a random index
        address winner = players[winnerIndex]; // Get the winner's address

        payable(winner).transfer(address(this).balance); // Transfer contract balance to the winner
        delete players; // Reset the players array
    }

    // Helper function to generate a pseudo-random number
    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players)));
    }

    // Function to get the current players
    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    // Function to get the contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
