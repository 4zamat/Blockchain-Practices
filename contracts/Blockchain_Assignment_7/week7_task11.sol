// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

interface INFTMetadataCallback {
    function generateMetadata(uint256 tokenId) external view returns (string memory);
}

contract CustomizableNFT is ERC721 {
    mapping(uint256 => address) private metadataCallbacks;
    uint256 private _tokenIdCounter;
    
    event MetadataCallbackRegistered(uint256 tokenId, address callbackContract);
    
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}
    
    function mint(address to) external returns (uint256) {
        _tokenIdCounter++;
        uint256 tokenId = _tokenIdCounter;
        _mint(to, tokenId);
        return tokenId;
    }
    
    function registerMetadataCallback(uint256 tokenId, address callbackContract) external {
        require(ownerOf(tokenId) == msg.sender, "Not the token owner");
        require(callbackContract != address(0), "Invalid callback address");
        metadataCallbacks[tokenId] = callbackContract;
        emit MetadataCallbackRegistered(tokenId, callbackContract);
    }
    
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
    require(_ownerOf(tokenId) != address(0), "Token does not exist");

    address callbackContract = metadataCallbacks[tokenId];
    if (callbackContract != address(0)) {
        return INFTMetadataCallback(callbackContract).generateMetadata(tokenId);
    }
    return "default metadata URI";
    }

}
