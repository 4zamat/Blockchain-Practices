pragma solidity ^0.8.15;
contract task4 {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner,"You are not owner");
        _;
    }
    receive() external payable{}
    function getBalance() external view returns (uint256) {

        return address(this).balance;

    }

    function transferEth(address payable recepient,uint256 value) external onlyOwner {
        require(address(this).balance >= value,"You have not money");
        recepient.transfer(value);


    }

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
