pragma solidity ^0.8.15;

contract Lottery {
    address[] public players;
    address public owner;

    // Constructor to initialize the owner
    constructor() {
        owner = msg.sender;
    }

    function enter() public payable {
        require(msg.value == 1 ether, "You must send exactly 1 ETH to participate");
        players.push(msg.sender);
    }

    function pickWinner() public {
        require(msg.sender == owner, "Only the owner can pick a winner");
        require(players.length > 0, "No players in the lottery");

        uint256 winnerIndex = random() % players.length;
        address winner = players[winnerIndex];

        payable(winner).transfer(address(this).balance);
        delete players;
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, players)));
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
