pragma solidity ^0.8.15;

contract SimpleBank {
    uint256 public balance;

    function deposit(uint256 amount) public {
        balance += amount;
    }

    function withdraw(uint256 amount) public {
        require(balance >= amount, "Insufficient balance");
        balance -= amount;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function doubleBalance() public {
        balance *= 2;
    }

    function resetBalance() public {
        balance = 0;
    }

    function transferBalance(address payable to) public {
        require(address(this).balance >= balance, "Contract balance is less than recorded balance");
        require(balance > 0, "Balance is zero");
        to.transfer(balance);
        balance = 0;
    }

    // Fallback function to allow the contract to receive Ether
    receive() external payable {}
}
