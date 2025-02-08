pragma solidity ^0.8.0;

library GenericMapping {
    struct Map {
        mapping(address => bytes) data;
        address[] keys;
        mapping(address => bool) exists;
    }

    function add(Map storage self, address key, bytes memory value) internal {
        require(!self.exists[key], "Key already exists");
        self.data[key] = value;
        self.keys.push(key);
        self.exists[key] = true;
    }

    function update(Map storage self, address key, bytes memory value) internal {
        require(self.exists[key], "Key does not exist");
        self.data[key] = value;
    }

    function remove(Map storage self, address key) internal {
        require(self.exists[key], "Key does not exist");
        delete self.data[key];
        self.exists[key] = false;
        
        for (uint i = 0; i < self.keys.length; i++) {
            if (self.keys[i] == key) {
                self.keys[i] = self.keys[self.keys.length - 1];
                self.keys.pop();
                break;
            }
        }
    }

    function get(Map storage self, address key) internal view returns (bytes memory) {
        require(self.exists[key], "Key does not exist");
        return self.data[key];
    }
}

contract GenericMappingUser {
    using GenericMapping for GenericMapping.Map;

    GenericMapping.Map private myMap;

    function addEntry(address key, bytes memory value) external {
        myMap.add(key, value);
    }

    function updateEntry(address key, bytes memory value) external {
        myMap.update(key, value);
    }

    function removeEntry(address key) external {
        myMap.remove(key);
    }

    function getEntry(address key) external view returns (bytes memory) {
        return myMap.get(key);
    }
}
