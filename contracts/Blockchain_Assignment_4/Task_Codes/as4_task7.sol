pragma solidity ^0.8.15;

contract TimeLockedContract {
    // Variable to store the unlock time
    uint256 public unlockTime;

    // Address of the owner
    address public owner;

    // Constructor to set the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to set the unlock time
    function setUnlockTime(uint256 time) public {
        require(msg.sender == owner, "Only the owner can set the unlock time");
        require(time > block.timestamp, "Unlock time must be in the future");
        unlockTime = time;
    }

    // Function to withdraw the contract's ETH balance
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(block.timestamp >= unlockTime, "Cannot withdraw before unlock time");
        payable(owner).transfer(address(this).balance);
    }

    // Fallback function to receive ETH
    receive() external payable {}

    // Function to check the contract's balance (for testing purposes)
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
