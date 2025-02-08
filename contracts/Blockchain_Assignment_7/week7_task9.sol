// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimedAccess {
    struct Access {
        address user;
        uint256 unlockTime;
        bytes4 functionSelector;
    }

    mapping(address => Access) public accessRegistry;

    event AccessRegistered(address indexed user, uint256 unlockTime, bytes4 functionSelector);
    event FunctionExecuted(address indexed user, bytes4 functionSelector);

    function registerAccess(uint256 delay, bytes4 functionSelector) external {
        require(accessRegistry[msg.sender].unlockTime == 0, "Already registered");
        uint256 unlockTime = block.timestamp + delay;
        accessRegistry[msg.sender] = Access(msg.sender, unlockTime, functionSelector);
        emit AccessRegistered(msg.sender, unlockTime, functionSelector);
    }

    function executeFunction() external {
        Access memory access = accessRegistry[msg.sender];
        require(access.unlockTime != 0, "No access registered");
        require(block.timestamp >= access.unlockTime, "Access time not reached");
        
        emit FunctionExecuted(msg.sender, access.functionSelector);
        delete accessRegistry[msg.sender];
    }
}
