pragma solidity ^0.8.15;

contract as3_task1 {
    uint256[] public fibArray;

    function initFib () public {
        fibArray = [0,1];
    }

    function addFib (uint256 count) public returns (uint256[] memory ) {
       for (uint256 i = 2;i<count; i++) {
           fibArray.push(fibArray[i-1] + fibArray[i-2]); 
       }

      return fibArray;   
    }

    function getElement (uint256 number) public returns  (uint256) {
      return fibArray[number-1];
    }
}
