// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnumerableMapping {
    mapping(address => uint256) private balances;
    address[] private nonZeroAddresses;
    mapping(address => bool) private isNonZeroAddress;

    event BalanceAdded(address indexed account, uint256 amount);
    event BalanceRemoved(address indexed account);

    // Add balance to an address
    function addBalance(address account, uint256 amount) public {
        require(account != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");

        if (balances[account] == 0 && !isNonZeroAddress[account]) {
            nonZeroAddresses.push(account);
            isNonZeroAddress[account] = true;
        }

        balances[account] += amount;
        emit BalanceAdded(account, amount);
    }

    // Remove balance from an address
    function removeBalance(address account) public {
        require(account != address(0), "Invalid address");
        require(balances[account] > 0, "No balance to remove");

        balances[account] = 0;
        isNonZeroAddress[account] = false;

        for (uint256 i = 0; i < nonZeroAddresses.length; i++) {
            if (nonZeroAddresses[i] == account) {
                nonZeroAddresses[i] = nonZeroAddresses[nonZeroAddresses.length - 1];
                nonZeroAddresses.pop();
                break;
            }
        }

        emit BalanceRemoved(account);
    }

    // Get all addresses with non-zero balances
    function getAllNonZeroAddresses() public view returns (address[] memory) {
        return nonZeroAddresses;
    }

    // Get balance of an address
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
