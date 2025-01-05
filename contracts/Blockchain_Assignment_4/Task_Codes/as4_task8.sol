pragma solidity ^0.8.15;

contract EqualEtherDistribution {
    // Fallback function to allow the contract to receive Ether
    receive() external payable {}

    // Function to get the current contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to get the balance of a specific address
    function getAddressBalance(address adr) external view returns (uint256) {
        return adr.balance;
    }

    // Function to distribute Ether equally among the given addresses
    function distributeEth(address[] memory addresses) external payable {
        require(addresses.length > 0, "No addresses provided");
        require(msg.value > 0, "No Ether sent for distribution");

        uint256 totalEth = msg.value; // Total Ether sent with the transaction
        uint256 numberOfRecipients = addresses.length + 1; // Includes the contract as a recipient
        uint256 amountPerRecipient = totalEth / numberOfRecipients; // Equal share for each recipient
        uint256 remainingBalance = totalEth % numberOfRecipients; // Remaining balance to stay in the contract

        // Distribute Ether to each recipient
        for (uint256 i = 0; i < addresses.length; i++) {
            payable(addresses[i]).transfer(amountPerRecipient);
        }

        // Keep one share and the remaining balance in the contract
        payable(address(this)).transfer(amountPerRecipient + remainingBalance);
    }
}
