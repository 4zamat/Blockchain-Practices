pragma solidity ^0.8.15;

contract task1 {
    uint256 public a;
    uint8 public b;
    address public sender;
    string public str;
    uint256 public value;
    bytes public data;
    bytes4 public sig;
    
    function init (uint256 _a,uint8 _b,string memory _str) external payable {
        a=_a;
        b= _b;
        str= _str;
        sender=msg.sender;
        value=msg.value;
        data=msg.data;
        sig=msg.sig;
    }
}
