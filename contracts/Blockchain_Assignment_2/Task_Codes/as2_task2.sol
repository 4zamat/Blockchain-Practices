pragma solidity ^0.8.15;

contract TokenManagement {
    // State variables
    uint256 public totalSupply;
    uint256 public balance;

    function mint(uint256 _amount) public {
        totalSupply += _amount;
    }

    function transfer(uint256 _amount) public {
        require(balance >= _amount, "Insufficient balance");
        balance -= _amount;
    }

    function receiveTokens(uint256 _amount) public {
        balance += _amount;
    }

    function getTokenInfo() public view returns (uint256, uint256) {
        return (totalSupply, balance);
    }
}
