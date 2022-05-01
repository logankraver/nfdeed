// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract InfrastructeDeeds is ERC721, Ownable {
    uint tokenId;

    // token metadata
    struct tokenMetaData {
        uint tokenId;
        uint timestamp;
        string tokenURI;
    }

    // record of NFT ownership
    mapping(address=>tokenMetaData[]) public ownershipRecord;

    // basic constructor
    constructor() ERC721("InfrastructeDeeds", "ID") {}

    // minting function
    function mintToken(address recipient, string memory tokenURI) onlyOwner public {
        require (owner() != recipient, "Recipient cannot be owner of the contract");
        _safeMint(msg.sender, tokenId);
        ownershipRecord[recipient].push(tokenMetaData(tokenId, block.timestamp, tokenURI));
        tokenId = tokenId + 1;
    }
    
}
