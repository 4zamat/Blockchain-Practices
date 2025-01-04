pragma solidity ^0.8.15;

contract AccessModifiersExample {
    uint8 number;

    // Function to get the value of the number variable
    function getNumber() public view returns (uint8) {
        return number;
    }

    // Public function to set the number
    // Calls the internal function setNumberInternal
    function setNumberPublic(uint8 _number) public {
        setNumberInternal(_number);
    }

    // External function to set the number
    // Calls the private function setNumberPrivate
    function setNumberExternal(uint8 _number) external {
        setNumberPrivate(_number);
    }

    // Internal function to set the number
    function setNumberInternal(uint8 _number) internal {
        number = _number;
    }

    // Private function to set the number
    function setNumberPrivate(uint8 _number) private {
        number = _number;
    }
}
