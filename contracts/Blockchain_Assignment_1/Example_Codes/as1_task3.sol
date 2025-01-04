pragma solidity ^0.8.15;

contract task3 {
    
    int128 value;
    function saveValue (int128  number) public {
        value = number;
    }
    
    function summa (int128 number) public view returns (int128) {
        return value+number;
    }
    
    function substraction (int128 number) public view returns (int128) {
        return value-number;
    }
    
    function multiplication  (int128 number) public view returns (int128) {
        return value*number;
    }
    
    function division  (int128 number) public view returns (int128) {
        return value/number;
    }
    
    function remainder  (int128 number) public view returns (int128) {
        return value%number;
    }
}
