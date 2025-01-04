pragma solidity ^0.8.15;

contract task2 {
    int256[10] public intArray;

    function initArray(int256 value) public {
        for (uint256 i = 0;i<intArray.length;i++) {
            intArray[i] = value * int256 (i);
        }
    } 
}
