pragma solidity ^0.8.15;
contract task4 {

    function getContractBalance() external view returns (uint256){

        return address(this).balance;

    }

    function getSenderBalance() external view returns (uint256){

        return msg.sender.balance;
    }

    function getAddressBalance(address adr) external view returns(uint256){

        return adr.balance;
    }
}
