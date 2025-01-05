pragma solidity ^0.8.15;

contract Task5 {
    address public owner = address(0);

    // Function to set the owner
    function setOwner() external returns (bool) {
        if (owner == address(0)) {
            owner = msg.sender;
            return true;
        }
        return false;
    }

    // Function to get the contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to change the owner
    function changeOwner(address newOwner) external returns (bool) {
        if (msg.sender != owner) {
            return false;
        }
        owner = newOwner;
        return true;
    }

    // Function to transfer Ether to a specified address
    function transferEthToAddress(address payable adr, uint256 value) external {
        require(msg.sender == owner, "You are not the owner");
        adr.transfer(value);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}
