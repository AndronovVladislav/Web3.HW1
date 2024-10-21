// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MatematessaTokenERC721} from "contracts/ERC721.sol";

contract MintTokenScript is Script {
    MatematessaTokenERC721 public token;

    function setUp() public {}

    function run() public {
        address deployer = vm.envAddress("DEPLOYER_ADDRESS");
        address recipient = vm.envAddress("RECIPIENT_ADDRESS");

        vm.startBroadcast(deployer);

        token = new MatematessaTokenERC721(deployer);

        token.safeMint(recipient, 1);

        string memory tokenURI = vm.envString("TOKEN_URI");
        token.safeMint(recipient, 2, tokenURI);

        vm.stopBroadcast();
    }
}
