pragma solidity ^0.8.15;

contract FirstGetsTheContract {
    address owner = address(0); // Variable to store the owner's address

    // Function to set the owner if called for the first time
    function setOwner() external returns (bool) {
        if (owner == address(0)) {
            owner = msg.sender; // Set the owner to the caller's address
            return true;
        }
        return false; // Return false if the owner is already set
    }

    // Function to change the owner to a new address
    function changeOwner(address newOwner) external returns (bool) {
        if (msg.sender == owner) { // Check if the caller is the current owner
            owner = newOwner; // Update the owner to the new address
            return true;
        }
        return false; // Return false if the caller is not the current owner
    }
}
