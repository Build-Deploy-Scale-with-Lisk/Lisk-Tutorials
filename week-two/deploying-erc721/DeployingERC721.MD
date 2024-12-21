// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"; import "hardhat/console.sol";

contract NFT is ERC721URIStorage {

```
// Counter for tracking token IDs
uint private _tokenIds;

// Constructor to initialize the ERC721 contract
constructor() ERC721("Vitalik Buterin", "VITALIK") {}

// Function to mint a new NFT
function mintNFT() public returns (uint256) {
    // Increment the token ID counter
    _tokenIds++;

    // Assign the new token ID
    uint newItemId = _tokenIds;

    // Mint the NFT and assign it to the sender
    _mint(msg.sender, newItemId);

    // Set a default URI for the NFT
    _setTokenURI(newItemId, "hello world");

    // Log the minting event to the console
    console.log(
        "The NFT ID %s has been minted to %s",
        newItemId,
        msg.sender
    );

    // Return the new token ID
    return newItemId;
}
```

}

---

### Understanding the Code

This code defines a smart contract called **NFT**, which implements the ERC721 standard for non-fungible tokens (NFTs). Let’s break it down step by step:

#### 1. **Imports**

- ``: Extends the ERC721 standard by adding functions to store and retrieve token URIs, making it easier to link metadata to NFTs.
- ``: Provides console logging functionality for debugging during development.

#### 2. **Token ID Counter**

- The `_tokenIds` variable tracks the unique ID for each minted NFT. Instead of using OpenZeppelin's `Counters` utility, we manage this manually by incrementing the counter directly.

#### 3. **Constructor**

- The contract’s name is "Vitalik Buterin," and its symbol is "VITALIK," set during deployment.

#### 4. **Minting Function**

- **Increment the Counter**: `_tokenIds` is incremented to ensure each NFT gets a unique ID.
- **Mint the NFT**: `_mint` is called to create the NFT and assign it to the caller’s address.
- **Set Token URI**: `_setTokenURI` assigns a default metadata URI ("hello world") to the newly minted NFT.
- **Log the Event**: `console.log` outputs a message to the development console, making it easier to debug.
- **Return the Token ID**: The function returns the unique ID of the minted NFT.

#### 5. **How It Works**

- When you call `mintNFT`, a new NFT is created, assigned to your wallet, and logged to the console with its ID.
- The hardcoded URI "hello world" is a placeholder and can be replaced with actual metadata in a real-world scenario.




### Metadata and IPFS for NFTs

Every NFT has associated metadata in JSON format, describing its attributes and content. Metadata is crucial for properly displaying NFTs on platforms like OpenSea and Rarible. To ensure compatibility, the metadata must follow a standardized JSON format.

#### Steps to Link Metadata to an NFT Using Pinata IPFS

### 1. **What is Pinata?**
Pinata is a peer-to-peer storage system that allows you to store and retrieve data using URLs. This service is ideal for hosting NFT metadata and images on IPFS.

---

### 2. **Overview of the Workflow**
1. Signup to Pinata
2. Upload an image to Pinata
3. Fetch the image URL
4. Add the image URL to a JSON file and create metadata
5. Upload the metadata JSON file to IPFS
6. Update your smart contract to use the metadata URL

---

### 3. **Signup to Pinata**
- Navigate to [Pinata](https://pinata.cloud) and create a free account.
- Click on the “Start Building” button to access the signup page.
- Fill in the form with your email address, select “Builder” as the title, and click “Next.”
- Provide your first name, last name, and password.
- Confirm your email by entering the verification code.

---

### 4. **Upload an Image to Pinata**
- Log in to your Pinata dashboard.
- Click the “+ Add Files” button and choose “File.”
- Browse your folders, select the image you want to upload, and click “Open.”

---

### 5. **Fetch the Image URL**
- After the image is uploaded, click on its file name in the Pinata dashboard.
- The image will open in a new browser tab.
- Copy the image’s URL from the address bar.

---

### 6. **Create Metadata**
- Create a JSON file named `Vitalik.json`.
- Paste the following code into the file and replace `YOUR-IMAGE-PINATA-URL` with the copied image URL:

```json
{
	"name": "Vitalik Buterin",
	"description": "Revolutionizing finance and governance with Ethereum, enabling a decentralized future.",
	"image": "YOUR-IMAGE-PINATA-URL",
	"attributes": [
		{
			"trait_type": "Zodiac",
			"value": "Aquarius"
		},
		{
			"trait_type": "Height",
			"value": "6'1"
		},
		{
			"trait_type": "Personality Type",
			"value": "INTP"
		}
	]
}
```

---

### 7. **Upload Metadata JSON File to IPFS**
- Return to your Pinata dashboard.
- Upload the `Vitalik.json` file.
- Click the “Share” button to copy the public link to the JSON file.

---

### 8. **Update the Smart Contract**
- Open the `NFT.sol` file in your development environment.
- Replace the hardcoded URI in the `_setTokenURI` function with the JSON metadata URL from Pinata:

```solidity
_setTokenURI(newItemId, "YOUR-JSON-FILE-LINK-FROM-PINATA");
```

- Deploy your contract:

```bash
npx hardhat ignition deploy ignition/modules/Lock.js --network lisk-sepolia --verify
```

---

### Summary
By following these steps, you can successfully upload images and metadata to IPFS using Pinata, link them to your NFTs, and deploy a smart contract to make your NFTs viewable and functional on popular platforms.




### Viewing Your NFT in MetaMask

You can also view your NFTs directly within your MetaMask wallet. Here’s how:

#### Steps to View Your NFT in MetaMask:
1. **Open MetaMask Mobile App:**
   - If you don’t already have the MetaMask mobile app, download and install it.
   - Import your current MetaMask wallet using your recovery phrase.

2. **Navigate to the NFT Section:**
   - Open the app and go to the NFT tab or section.

3. **Import Your NFT:**
   - Click on the “Import NFTs” option.
   - Enter the contract address of the NFT. You can find this on PolygonScan (or another relevant block explorer).
   - Enter the Token ID of the NFT you minted.

4. **Refresh MetaMask:**
   - Refresh the app a few times, and your NFT should now appear in the NFT section.

---

### What’s Next?

Great work so far! You’ve successfully minted and viewed your NFT both on OpenSea and in MetaMask. The next and final step is deploying the contract on the Production Network. 

