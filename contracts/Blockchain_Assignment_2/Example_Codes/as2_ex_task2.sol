pragma solidity ^0.8.15;

contract task2 {
    uint8 number;

    function getNumber () public view returns (uint8) {
        return number;
    }

    function setNumberPublic (uint8 _number) public {
        setNumberInternal(_number);
    }

    function setNumberInternal (uint8 _number) internal {
        number = _number;
    }

    function setNumberExternal (uint8 _number) external {
        setNumberPrivate(_number);

    }
    function setNumberPrivate (uint8 _number) private {
        number = _number;
    }
}
