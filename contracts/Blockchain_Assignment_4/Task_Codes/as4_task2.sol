pragma solidity ^0.8.15;

contract GuessTheNumber {
    uint256 private secretNumber;

    constructor(uint256 _secretNumber) {
        secretNumber = _secretNumber;
    }

    function guess(uint256 guessedNumber) public view returns (bool) {
        return guessedNumber == secretNumber;
    }
}
