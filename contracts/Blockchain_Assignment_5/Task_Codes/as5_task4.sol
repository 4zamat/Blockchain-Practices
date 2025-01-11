pragma solidity ^0.8.15;

contract TimeLockedWallet {
    uint256 public releaseTime;

    address public owner;

    // Constructor to initialize the release time and owner
    constructor(uint256 _releaseTime) {
        require(_releaseTime > block.timestamp, "Release time must be in the future");
        owner = msg.sender;
        releaseTime = _releaseTime;
    }

    function deposit() public payable {}

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(block.timestamp >= releaseTime, "Funds are locked");
        payable(owner).transfer(address(this).balance);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
