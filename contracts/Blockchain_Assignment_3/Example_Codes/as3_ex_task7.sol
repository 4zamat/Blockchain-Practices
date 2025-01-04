pragma solidity ^0.8.15;

contract task7 {

    mapping(address =>uint256) public balances;
    uint256 public balance;
    uint256 public fee;
    
    function setFee (uint256 _fee) public {
        if (fee != 0 ) {
           fee = _fee;
        }
   
    }

    function withdraw (address _client,uint256 _value) public returns (bool){
        if(_value > balances[_client]){
            return false;
        }
        balances[_client] -= _value;
        return true;

    }
    function addBalance (address _client,uint256 _value) public returns(bool){
         require (_value >= 0);
        balances[_client] += _value;
        return true;
    }

    function transferFrom ( address _sender,address _recipient,uint256 _value) public returns (bool){

        require (balances[_sender] >= _value);
        uint256 comission = (_value * fee) / 100;
         balances[ _sender] -= (_value + comission) ; 
         balances[ _recipient] += _value; 
         balance += comission;
         return true;
    }
}
