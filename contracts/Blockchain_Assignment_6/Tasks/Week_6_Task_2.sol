// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    uint256 public ticketPrice;
    address[] public participants;
    address public owner;
    uint256 public prizePool;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(uint256 _ticketPrice) {
        owner = msg.sender;
        ticketPrice = _ticketPrice;
    }

    function buyTicket() public payable {
        require(msg.value >= ticketPrice, "Insufficient payment for ticket");

        participants.push(msg.sender);
        prizePool += msg.value;
    }

    function drawWinner() public onlyOwner {
        require(participants.length > 0, "No participants in the lottery");

        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, participants.length))) % participants.length;
        address winner = participants[randomIndex];

        payable(winner).transfer(prizePool);

        // Reset the game
        delete participants;
        prizePool = 0;
    }

    function setTicketPrice(uint256 price) public onlyOwner {
        ticketPrice = price;
    }

    function getParticipants() public view returns (address[] memory) {
        return participants;
    }
}
