pragma solidity ^0.8.15;
contract task6 {

    receive() external payable {}
    function getContractBalance() external view returns (uint256){

        return address(this).balance;
    }

    function getMyBalance() external view returns (uint256){
        return msg.sender.balance;
    }

    function getAddressBalance(address adr) external view returns (uint256){

        return adr.balance;
    }

    function giveMeEth(uint256 value) external{
        require(address(this).balance >=value, "Not enough funds");
        payable(msg.sender).transfer(value);
    }

    function transferEthToAddress(uint256 value,address payable adr) external {
      require(address(this).balance >=value, "Not enough funds");
        adr.transfer(value);
    }
    
}
