pragma solidity ^0.8.15;

contract CompareIntegers {
    // State variables to store a and b
    int64 public a;
    int64 public b;

    // Function to set the values of a and b
    function setValues(int64 _a, int64 _b) public {
        a = _a;
        b = _b;
    }

    // Function to swap the values of a and b
    function swapValues() public {
        (a, b) = (b, a); // Swap a and b
    }

    // Function to return the larger of a and b
    function getLarger() public view returns (int64) {
        return a >= b ? a : b; // Return a if a >= b, otherwise return b
    }

    // Function to return the smaller of a and b
    function getSmaller() public view returns (int64) {
        return a <= b ? a : b; // Return a if a <= b, otherwise return b
    }

    // Function to check if a and b are equal
    function isEqual() public view returns (bool) {
        return a == b; // Return true if a == b, otherwise false
    }
}
