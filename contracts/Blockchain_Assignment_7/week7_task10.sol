// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library CustomModifiers {
    struct AccessControl {
        mapping(address => bool) admins;
        uint256 startTime;
    }

    function addAdmin(AccessControl storage self, address admin) internal {
        self.admins[admin] = true;
    }

    function removeAdmin(AccessControl storage self, address admin) internal {
        self.admins[admin] = false;
    }

    function setStartTime(AccessControl storage self, uint256 time) internal {
        self.startTime = time;
    }

    function isAdmin(AccessControl storage self, address user) internal view returns (bool) {
        return self.admins[user];
    }

    function hasTimePassed(AccessControl storage self, uint256 delay) internal view returns (bool) {
        return block.timestamp >= self.startTime + delay;
    }
}

contract ModifierUser {
    using CustomModifiers for CustomModifiers.AccessControl;
    CustomModifiers.AccessControl private accessControl;

    constructor() {
        accessControl.addAdmin(msg.sender);
        accessControl.setStartTime(block.timestamp);
    }

    modifier onlyAdmin() {
        require(accessControl.isAdmin(msg.sender), "Not an admin");
        _;
    }

    modifier timeRestricted(uint256 delay) {
        require(accessControl.hasTimePassed(delay), "Function is time-restricted");
        _;
    }

    function restrictedFunction() external onlyAdmin {
        // Only admins can call this
    }

    function timeLockedFunction(uint256 delay) external timeRestricted(delay) {
        // Can only be called after the delay has passed
    }

    function addAdmin(address admin) external onlyAdmin {
        accessControl.addAdmin(admin);
    }

    function removeAdmin(address admin) external onlyAdmin {
        accessControl.removeAdmin(admin);
    }
}
