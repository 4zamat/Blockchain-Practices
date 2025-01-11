pragma solidity ^0.8.15;

contract task1 {
    string public str;
    address public owner;
    
    function setString (string memory _str ) external{
        require(owner == msg.sender,"You are not owner");
        str = _str;
    }
}
