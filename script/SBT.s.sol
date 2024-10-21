// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MatematessaSBTToken} from "contracts/SBT.sol";

contract MatematessaTokenERC721Script is Script {
    MatematessaSBTToken public token;

    function setUp() public {}

    function run() external returns (address) {
        vm.startBroadcast();
        token = new MatematessaSBTToken();
        vm.stopBroadcast();

        return address(token);
    }
}
