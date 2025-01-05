pragma solidity ^0.8.15;

contract EtherTransfer {
    // Fallback function to allow the contract to receive Ether
    receive() external payable {}

    // Function to get the current balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance; // Returns the balance of the contract
    }

    // Function to get the balance of the caller
    function getMyBalance() external view returns (uint256) {
        return msg.sender.balance; // Returns the balance of the caller
    }

    // Function to get the balance of a specified address
    function getAddressBalance(address _adr) external view returns (uint256) {
        return _adr.balance; // Returns the balance of the specified address
    }

    // Function to send Ether to the caller if the contract has enough funds
    function giveMeEth(uint256 value) external {
        require(address(this).balance >= value, "Not enough funds"); // Ensure sufficient funds in the contract
        payable(msg.sender).transfer(value); // Transfer Ether to the caller
    }

    // Function to transfer Ether to a specified address if the contract has enough funds
    function transferEthToAddress(address payable _adr, uint256 value) external {
        require(address(this).balance >= value, "Not enough funds"); // Ensure sufficient funds in the contract
        _adr.transfer(value); // Transfer Ether to the specified address
    }
}
