pragma solidity ^0.8.15;

contract TimeLockedWallet {
    // Variable to store the release time
    uint256 public releaseTime;

    // Address of the wallet owner
    address public owner;

    // Constructor to initialize the release time and owner
    constructor(uint256 _releaseTime) {
        require(_releaseTime > block.timestamp, "Release time must be in the future");
        owner = msg.sender;
        releaseTime = _releaseTime;
    }

    // Function to deposit ETH into the contract
    function deposit() public payable {}

    // Function to withdraw ETH from the contract
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(block.timestamp >= releaseTime, "Funds are locked"); // Ensure release time has passed
        payable(owner).transfer(address(this).balance); // Transfer all funds to the owner
    }

    // Function to get the contract balance (for testing purposes)
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
