// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.15;

contract task3 {
    int public number; 
    int public iterator;

    function setNumber (int _number) public returns (int256) {
       number = _number;
       int _iterator = iteration();
       return _iterator;
    }

    function iteration () public returns (int256) { 
       iterator += 1;
       return iterator;
    }
}
