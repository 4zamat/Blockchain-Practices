pragma solidity ^0.8.15;

contract CompareIntegers {
    int64 public a;
    int64 public b;

    function setValues(int64 _a, int64 _b) public {
        a = _a;
        b = _b;
    }

    function swapValues() public {
        (a, b) = (b, a);
    }

    function getLarger() public view returns (int64) {
        return a >= b ? a : b;
    }

    function getSmaller() public view returns (int64) {
        return a <= b ? a : b;
    }

    function isEqual() public view returns (bool) {
        return a == b;
    }
}
