pragma solidity ^0.8.15;

contract Escrow {
    // State variables
    address public owner;
    address public recipient;

    // Constructor to initialize owner and recipient
    constructor(address _recipient) {
        require(_recipient != address(0), "Recipient address cannot be zero");
        owner = msg.sender; // Deployer is the owner
        recipient = _recipient;
    }

    receive() external payable {}

    function releaseFunds() public {
        require(msg.sender == owner, "You are not the owner");
        require(address(this).balance > 0, "No funds available");

        payable(recipient).transfer(address(this).balance);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
