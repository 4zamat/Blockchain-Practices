pragma solidity ^0.8.15;
contract task6 {
    address public owner;

    error badOwner( address sender);
    error badValue(uint256 balance,uint256 value);
    error badSignature (bytes input);

    receive() external payable{}
    function getBalance() external view returns (uint256) {

        return address(this).balance;

    }

    function transferEth(address payable recepient,uint256 value) external  {
         if (msg.sender != owner) {
            revert badOwner(msg.sender);
         }
          if (value > address(this).balance){
            revert badValue(address(this).balance,value);
          }

        recepient.transfer(value);


    }
     
     function fallback () external payable{
        revert badSignature(msg.data);
     }
    function changeOwner(address newOwner) external  {
        if (msg.sender != owner) {
            revert badOwner(msg.sender);
         }
        owner = newOwner;
    }
}
