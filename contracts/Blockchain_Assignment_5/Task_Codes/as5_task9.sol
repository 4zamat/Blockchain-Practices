pragma solidity ^0.8.15;

contract MultiSigWallet {
    address[] public owners;
    uint256 public threshold;

    struct Transaction {
        address recipient;
        uint256 amount;
        uint256 approvals;
        bool executed;
    }

    Transaction[] public transactions;
    mapping(uint256 => mapping(address => bool)) public approvals;

    constructor(address[] memory _owners, uint256 _threshold) {
        require(_owners.length > 0, "Owners required");
        require(_threshold > 0 && _threshold <= _owners.length, "Invalid threshold");
        owners = _owners;
        threshold = _threshold;
    }

    function isOwner(address addr) private view returns (bool) {
        for (uint256 i = 0; i < owners.length; i++) {
            if (owners[i] == addr) return true;
        }
        return false;
    }

    function submitTransaction(address recipient, uint256 amount) public {
        require(isOwner(msg.sender), "Not an owner");
        transactions.push(Transaction(recipient, amount, 0, false));
    }

    function approveTransaction(uint256 txIndex) public {
        require(isOwner(msg.sender), "Not an owner");
        Transaction storage tx = transactions[txIndex];
        require(!tx.executed, "Transaction already executed");
        require(!approvals[txIndex][msg.sender], "Already approved");

        approvals[txIndex][msg.sender] = true;
        tx.approvals++;
    }

    function executeTransaction(uint256 txIndex) public {
        Transaction storage tx = transactions[txIndex];
        require(tx.approvals >= threshold, "Insufficient approvals");
        require(!tx.executed, "Transaction already executed");
        tx.executed = true;
        payable(tx.recipient).transfer(tx.amount);
    }

    receive() external payable {}
}
