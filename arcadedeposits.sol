// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ArcadeDeposit {
    IERC20 public immutable arcadeToken;
    address public immutable admin;

    event TokenDeposited(address indexed user, uint256 amount);

    constructor() {
        arcadeToken = IERC20(0xFF3fD61427d3485c8e33cb5f5999EAd9639C56a5);
        admin = 0xA27F8d05b33486785B2cff6D6A0BDe9269c68607;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        require(arcadeToken.transferFrom(msg.sender, admin, amount), "Transfer failed");
        emit TokenDeposited(msg.sender, amount);
    }
} 
