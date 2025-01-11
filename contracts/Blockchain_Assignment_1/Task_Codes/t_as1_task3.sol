pragma solidity ^0.8.15;

contract SimpleBank {
    uint256 public balance; // State variable to store the balance

    // Function to deposit funds (add to the balance)
    function deposit(uint256 amount) public {
        balance += amount; // Add the deposit amount to the balance
    }

    // Function to withdraw funds (subtract from the balance)
    function withdraw(uint256 amount) public {
        require(balance >= amount, "Insufficient balance"); // Ensure enough balance
        balance -= amount; // Subtract the withdrawal amount from the balance
    }

    // Function to check the current balance
    function getBalance() public view returns (uint256) {
        return balance; // Return the current balance
    }

    // Function to double the balance
    function doubleBalance() public {
        balance *= 2; // Double the balance
    }

    // Function to reset the balance to zero
    function resetBalance() public {
        balance = 0; // Reset the balance to zero
    }

    // Function to transfer the balance to another contract address
    function transferBalance(address payable to) public {
        require(address(this).balance >= balance, "Contract balance is less than recorded balance");
        require(balance > 0, "Balance is zero"); // Ensure there's balance to transfer
        to.transfer(balance); // Transfer Ether to the specified address
        balance = 0; // Reset the balance after transfer
    }

    // Fallback function to allow the contract to receive Ether
    receive() external payable {}
}
