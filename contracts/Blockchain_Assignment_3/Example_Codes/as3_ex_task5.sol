pragma solidity ^0.8.15;

contract task6 {

    mapping(address =>uint256) public balances;
    function addBalance (address _client,uint256 _value) public returns(bool){
         require (_value >= 0);
        balances[_client] += _value;
        return true;
    }

    function transferFrom ( address _sender,address _recipient,uint256 _value) public returns (bool){

        require (balances[_sender] >= _value);
         balances[ _sender] -= _value; 
         balances[ _recipient] += _value; 
         return true;
    }
}
