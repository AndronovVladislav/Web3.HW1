// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MatematessaTokenERC1155} from "../contracts/ERC1155.sol";

contract MatematessaTokenERC1155Script is Script {
    MatematessaTokenERC1155 public token;

    function setUp() public {}

    function run() external returns (address) {
        vm.startBroadcast();
        token = new MatematessaTokenERC1155("", address(0x8bfb4E185a58bBB4F1D5e6Be4F1da699e701Da2b));
        vm.stopBroadcast();

        return address(token);
    }
}
