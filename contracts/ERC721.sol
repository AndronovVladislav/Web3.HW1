// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MatematessaERC721
 * @dev An ERC721 token contract offering minting features and metadata support.
 */
contract MatematessaTokenERC721 is ERC721URIStorage, Ownable {
    /**
     * @notice Initializes the contract with a token name, symbol, and initial owner.
     * @dev Sets up the token's name and symbol. The contract's initial owner is specified via parameter.
     * @param initialOwner The address to be set as the initial contract owner.
     */
    constructor(address initialOwner) ERC721("MatematessaERC721", "MTMERC721") Ownable(initialOwner) {}

    /**
     * @notice Mints a new token without assigning a URI.
     * @dev Creates a token with a unique ID and assigns it to a specified address. Only the contract owner can execute this function.
     * @param to The address designated to own the newly created token.
     * @param tokenId The token's unique ID.
     */
    function safeMint(address to, uint256 tokenId) external onlyOwner {
        _safeMint(to, tokenId);
    }

    /**
     * @notice Mints a new token and assigns a specific URI to it.
     * @dev Creates a token with a unique ID, assigns it to a given address, and links metadata URI to it. Only the contract owner can execute this function.
     * @param to The address designated to own the newly created token.
     * @param tokenId The token's unique ID.
     * @param uri The metadata URI linked to the token (e.g., URL to a JSON file).
     */
    function safeMint(address to, uint256 tokenId, string memory uri) external onlyOwner {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
}
