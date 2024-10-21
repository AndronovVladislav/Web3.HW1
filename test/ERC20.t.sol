// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MatematessaTokenERC20} from "contracts/ERC20.sol";

contract MatematessaTokenERC20Test is Test {
    MatematessaTokenERC20 public token;

    address owner = makeAddr("owner");
    address recipient1 = makeAddr("recipient1");
    address recipient2 = makeAddr("recipient2");

    function setUp() public {
        token = new MatematessaTokenERC20(owner);
    }

    function testBuy() public {
        token.buy{value: 10 ** 9}(recipient1);
        assertEq(token.balanceOf(recipient1), 1);
    }

    function testTransfer() public {
        vm.startPrank(owner);
        assertTrue(token.transfer(recipient1, 10 ** 5));
        vm.stopPrank();
        assertEq(token.balanceOf(recipient1), 99990);
        assertEq(token.balanceOf(owner), 8 * 10 ** token.decimals() - 10 ** 5 + 10);
    }

    function testTransferFrom() public {
        token.buy{value: 10 ** 15}(recipient1);

        vm.startPrank(recipient1);
        assertTrue(token.approve(owner, 100));
        vm.stopPrank();

        vm.startPrank(owner);
        assertTrue(token.transferFrom(recipient1, recipient2, 100));
        vm.stopPrank();
    }
}
