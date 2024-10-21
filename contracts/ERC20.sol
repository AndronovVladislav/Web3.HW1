// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MatematessaTokenERC20
 * @dev An ERC20 token contract with a purchase function and a fee mechanism on transfers.
 */
contract MatematessaTokenERC20 is ERC20, Ownable {
    uint256 private tokensPerEther = 10 ** 9;
    uint256 private feeShare = 10000;

    /**
     * @notice Initializes the contract with a token name, symbol, and initial owner and minting initial supply.
     * @param initialOwner The address to be set as the initial owner of the contract.
     */
    constructor(address initialOwner) ERC20("MatematessaERC20", "MTMERC20") Ownable(initialOwner) {
        _mint(initialOwner, 8 * 10 ** decimals());
    }

    /**
     * @notice Allows the purchase of tokens by sending Ether to the contract.
     * @dev Requires a non-zero Ether value and sufficient token reserve in the owner's account.
     * @param to The address that will receive the purchased tokens.
     */
    function buy(address to) external payable {
        require(msg.value > 0, "Send coins to purchase tokens");
        uint256 tokens = (msg.value * tokensPerEther) / 1 ether;

        require(balanceOf(owner()) >= tokens, "Not enough tokens in reserve");
        _transfer(owner(), to, tokens);
    }

    /**
     * @notice Transfers tokens from the caller's account to another address, with a fee.
     * @dev Transfers the specified value minus the fee to the recipient, and the fee to the owner.
     * @param to The recipient address.
     * @param value The amount of tokens to transfer.
     * @return A boolean value indicating whether the operation succeeded.
     */
    function transfer(address to, uint256 value) public override returns (bool) {
        uint256 fee = value / feeShare;
        unchecked {
            _transfer(msg.sender, to, value - fee);
        }
        _transfer(msg.sender, owner(), fee);
        return true;
    }

    /**
     * @notice Transfers tokens on behalf of another address, with a fee, using an allowance.
     * @dev Transfers the specified value minus the fee from the sender to the recipient, and the fee to the owner.
     * @param from The address to transfer tokens from.
     * @param to The recipient address.
     * @param value The amount of tokens to transfer.
     * @return A boolean value indicating whether the operation succeeded.
     */
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        uint256 fee = value / feeShare;
        _spendAllowance(from, msg.sender, value);

        unchecked {
            _transfer(msg.sender, to, value - fee);
        }
        _transfer(msg.sender, owner(), fee);
        return true;
    }
}
