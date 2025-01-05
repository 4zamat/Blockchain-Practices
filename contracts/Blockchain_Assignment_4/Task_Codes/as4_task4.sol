pragma solidity ^0.8.15;

contract AccountBalanceResearch {
    // Function to get the balance of the current contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance; // Returns the balance of the contract
    }

    // Function to get the balance of the caller (msg.sender)
    function getSenderBalance() external view returns (uint256) {
        return msg.sender.balance; // Returns the balance of the caller
    }

    // Function to get the balance of a specific address
    function getAddressBalance(address _adr) external view returns (uint256) {
        return _adr.balance; // Returns the balance of the provided address
    }
}
