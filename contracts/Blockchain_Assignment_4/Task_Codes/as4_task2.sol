pragma solidity ^0.8.15;

contract GuessTheNumber {
    // Private variable to store the secret number
    uint256 private secretNumber;

    // Constructor to initialize the secret number
    constructor(uint256 _secretNumber) {
        secretNumber = _secretNumber;
    }

    // Public function to guess the number
    function guess(uint256 guessedNumber) public view returns (bool) {
        return guessedNumber == secretNumber; // Return true if guessed number matches the secret number
    }
}
