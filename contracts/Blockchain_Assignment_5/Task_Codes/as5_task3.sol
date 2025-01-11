pragma solidity ^0.8.15;

contract Escrow {
    // State variables
    address public owner;       // Owner of the contract
    address public recipient;   // Recipient of the funds

    // Constructor to initialize owner and recipient
    constructor(address _recipient) {
        require(_recipient != address(0), "Recipient address cannot be zero");
        owner = msg.sender; // Deployer is the owner
        recipient = _recipient; // Set the specified recipient
    }

    // Function to receive Ether into the contract
    receive() external payable {}

    // Function to release funds to the recipient
    function releaseFunds() public {
        require(msg.sender == owner, "You are not the owner"); // Restrict access to the owner
        require(address(this).balance > 0, "No funds available"); // Ensure there are funds to release

        payable(recipient).transfer(address(this).balance); // Transfer all contract balance to the recipient
    }

    // Function to get the contract's balance (optional for testing)
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
