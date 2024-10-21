// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MatematessaTokenERC20} from "../contracts/ERC20.sol";

contract MatematessaTokenERC20Script is Script {
    MatematessaTokenERC20 public token;

    function setUp() public {}

    function run() external returns (address) {
        vm.startBroadcast();
        token = new MatematessaTokenERC20(address(0x8bfb4E185a58bBB4F1D5e6Be4F1da699e701Da2b));
        vm.stopBroadcast();

        return address(token);
    }
}
