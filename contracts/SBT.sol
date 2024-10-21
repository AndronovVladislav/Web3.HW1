// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MatematessaSBTToken is ERC721 {
    constructor() ERC721("MatematessaSBT", "MTMSBT") {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public pure override {
        require(false, "Transfer is forbidden");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public pure override {
        require(false, "Transfer is forbidden");
    }
}
