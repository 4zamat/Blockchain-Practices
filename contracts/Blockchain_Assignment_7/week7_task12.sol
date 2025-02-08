pragma solidity ^0.8.0;

interface IStateModifier {
    function onStateChange(uint256 newState) external;
}

contract SharedState {
    uint256 private globalState;
    address[] private registeredContracts;
    mapping(address => bool) private isRegistered;

    event StateUpdated(uint256 newState);
    event ContractRegistered(address contractAddress);

    function registerContract(address contractAddress) external {
        require(contractAddress != address(0), "Invalid address");
        require(!isRegistered[contractAddress], "Contract already registered");
        registeredContracts.push(contractAddress);
        isRegistered[contractAddress] = true;
        emit ContractRegistered(contractAddress);
    }

    function updateState(uint256 newState) external {
        globalState = newState;
        emit StateUpdated(newState);
        _notifyContracts(newState);
    }

    function getState() external view returns (uint256) {
        return globalState;
    }

    function _notifyContracts(uint256 newState) private {
        for (uint256 i = 0; i < registeredContracts.length; i++) {
            if (isRegistered[registeredContracts[i]]) {
                IStateModifier(registeredContracts[i]).onStateChange(newState);
            }
        }
    }
}