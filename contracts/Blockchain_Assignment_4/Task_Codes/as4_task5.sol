pragma solidity ^0.8.15;

contract Wallet {
    address public owner = address(0); // Variable to store the owner's address

    // Fallback function to receive Ether
    receive() external payable {}

    // Function to set the owner (first caller becomes the owner)
    function setOwner() external returns (bool) {
        if (owner == address(0)) {
            owner = msg.sender; // Set the owner to the first caller
            return true;
        }
        return false; // Return false if the owner is already set
    }

    // Function to get the current contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance; // Returns the balance of the contract
    }

    // Function to transfer Ether to a specified address
    function transferEthToAddress(address payable _adr, uint256 value) external {
        require(msg.sender == owner, "You are not the owner"); // Only the owner can call this function
        require(address(this).balance >= value, "Insufficient contract balance"); // Check contract balance
        _adr.transfer(value); // Transfer Ether to the specified address
    }

    // Function to change the owner of the contract
    function changeOwner(address newOwner) external {
        require(msg.sender == owner, "You are not the owner"); // Only the owner can call this function
        owner = newOwner; // Change the owner to the new address
    }
}
