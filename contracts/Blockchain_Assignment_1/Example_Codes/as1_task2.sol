pragma solidity ^0.8.15;

contract task2{

    int16 number16;
    int256 number256;
    
    function setNumber16 (int16  number) public {
        number16 = number;
    }
    
    function setNumber256 (int256  number) public {
        number256 = number;
    
    }
    
    function getValue16 () public view returns (int16) {
        return number16;
    } 
    
    function getValue256 () public view returns (int256) {
        return number256;
    } 
    
    function getSumma() public view returns (int256) {
        return number256 +int256(number16);
    } 

}
