pragma solidity ^0.8.15;

contract PrimeNumbers {
    // Function to find all prime numbers less than or equal to n
    function getPrimes(uint256 n) public pure returns (uint256[] memory) {
        require(n >= 2, "There are no primes less than 2");

        // Create a dynamic array to store primes
        uint256[] memory primes = new uint256[](n);
        uint256 count = 0;

        // is prime
        for (uint256 i = 2; i <= n; i++) {
            if (isPrime(i)) {
                primes[count] = i;
                count++;
            }
        }

        // fit only the prime numbers
        uint256[] memory result = new uint256[](count);
        for (uint256 i = 0; i < count; i++) {
            result[i] = primes[i];
        }

        return result;
    }

    function isPrime(uint256 num) internal pure returns (bool) {
        if (num < 2) {
            return false;
        }
        for (uint256 i = 2; i * i <= num; i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }
}
