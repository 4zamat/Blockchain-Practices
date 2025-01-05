pragma solidity ^0.8.15;

contract task2 {

    address owner = address(0);
    function setOwner() external returns (bool) {

        if ( owner == address(0) ) {

            owner = msg.sender;
            return true;
        }
        return false;
    }

    function changeOwner(address newOwner) external returns (bool){

        if (msg.sender == owner) {

            owner = newOwner;
            return true;
        }
        return false;
    }
}
