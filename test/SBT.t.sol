// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {SBTToken} from "contracts/SBT.sol";

contract SBTTokenTest is Test {
    SBTToken public token;

    address recipient1 = makeAddr("recipient1");
    address recipient2 = makeAddr("recipient2");

    function setUp() public {
        token = new SBTToken();
    }

    function testTransferFrom() public {
        vm.expectRevert("Transfer is forbidden");
        token.transferFrom(recipient1, recipient2, 1);
    }

    function testSafeTransferFrom() public {
        vm.expectRevert("Transfer is forbidden");
        token.safeTransferFrom(recipient1, recipient2, 1);
    }
}