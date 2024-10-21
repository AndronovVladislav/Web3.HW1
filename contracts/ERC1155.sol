// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; // Importing the Strings library

/**
 * @title MatematessaERC1155
 * @dev An ERC1155 token contract with minting capabilities and metadata URI support.
 */
contract MatematessaTokenERC1155 is ERC1155Supply, Ownable {
    string private _baseURI;

    /**
     * @notice Initializes the contract with the base URI for all token types and sets the initial owner.
     * @dev Establishes the initial owner and the base URI for metadata.
     * @param baseURI The base metadata URI.
     * @param initialOwner The address assigned as the initial owner of the contract.
     */
    constructor(string memory baseURI, address initialOwner) ERC1155(baseURI) Ownable(initialOwner) {
        _baseURI = baseURI;
    }

    /**
     * @notice Mint a new set of tokens with specific metadata.
     * @dev Creates a certain number of tokens with a designated ID for a specific address. Only callable by the contract owner.
     * @param to The address receiving the newly minted tokens.
     * @param id The unique ID of the token to be minted.
     * @param amount The number of tokens to mint.
     * @param data Additional data that goes along with the minting process.
     */
    function mint(address to, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(to, id, amount, data);
    }

    /**
     * @notice Mint a batch of multiple tokens at once.
     * @dev Creates a batch of tokens for specified IDs and assigns them to a specific address. Executable only by the contract owner.
     * @param to The recipient address for the newly minted batch of tokens.
     * @param ids An array of unique token IDs to be minted.
     * @param amounts An array specifying the number of tokens to mint for each ID.
     * @param data Additional data that is included with the minting.
     */
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    /**
     * @notice Get the metadata URI for a specific token ID.
     * @dev Generates the full URI by concatenating the base URI and the string representation of the token ID.
     * @param id The unique token ID of interest.
     * @return A string representing the complete metadata URI for the specified token.
     */
    function uri(uint256 id) public view override returns (string memory) {
        return string(abi.encodePacked(_baseURI, Strings.toString(id)));
    }
}
