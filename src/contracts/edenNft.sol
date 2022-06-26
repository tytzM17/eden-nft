// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract EdenNFT is ERC1155 {
    uint256 public constant DOGGO = 0;
    uint256 public constant CATTO = 1;
    uint256 public constant RATTO = 2;


    constructor() ERC1155("https://github.com/tytzM17/eden-nft/blob/main/public/{id}.json") {
        _mint(msg.sender, DOGGO, 50, "");
        _mint(msg.sender, CATTO, 40, "");
        _mint(msg.sender, RATTO, 10, "");
    }
}