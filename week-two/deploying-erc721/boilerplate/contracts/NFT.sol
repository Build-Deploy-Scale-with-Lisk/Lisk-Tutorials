// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; import "hardhat/console.sol";

contract Vitalik is ERC721URIStorage {

// Counter for tracking token IDs
uint private _tokenIds;

// Constructor to initialize the ERC721 contract
constructor() ERC721("Vitalik Buterin", "VITALIK") {
    mintNFT();
}

// Function to mint a new NFT
function mintNFT() public returns (uint256) {
    // Increment the token ID counter
    _tokenIds++;

    // Assign the new token ID
    uint newItemId = _tokenIds;

    // Mint the NFT and assign it to the sender
    _mint(msg.sender, newItemId);

    // Set a default URI for the NFT
    _setTokenURI(newItemId, "https://aquamarine-rare-firefly-756.mypinata.cloud/ipfs/QmXyM5zvzF6GhjcyHuLoTSmsvhjxEWxRRuYUv7jDQozb5b");

    // Log the minting event to the console
    console.log(
        "The NFT ID %s has been minted to %s",
        newItemId,
        msg.sender
    );

    // Return the new token ID
    return newItemId;
}

}