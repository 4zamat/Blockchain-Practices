pragma solidity ^0.8.15;

contract Donation {
    mapping(address => uint256) public donators; // Dictionary to store donations
    address public owner = address(0);          // Address of the contract owner

    // Function to set the owner (first caller becomes the owner)
    function setOwner() external returns (bool) {
        if (owner == address(0)) {
            owner = msg.sender; // Set the owner to the caller's address
            return true;
        }
        return false; // Return false if the owner is already set
    }

    // Function to donate Ether
    function donate() external payable {
        require(msg.value > 0, "Donation must be greater than zero"); // Ensure non-zero donation
        donators[msg.sender] += msg.value; // Add the donation amount to the caller's address in the mapping
    }

    // Function to get the total amount donated by a specific address
    function getDonator(address _donatorAdr) external view returns (uint256) {
        return donators[_donatorAdr]; // Return the amount donated by the address
    }

    // Function to get the contract balance
    // Only the owner can see the contract's balance; others see 0
    function getBalance() external view returns (uint256) {
        if (msg.sender == owner) {
            return address(this).balance; // Return the contract balance if called by the owner
        }
        return 0; // Return 0 if called by someone other than the owner
    }
}
