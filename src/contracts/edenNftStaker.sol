// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Receiver.sol";
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract EdenNftStaker {
    IERC1155 public parentNFT;
	ERC20 private _token;
	
	uint256 public lockinPeriod = 0;
	uint256 public _amount = 1000000000000000;

    struct Stake {
        uint256 tokenId;
        uint256 amount;
        uint256 timestamp;
    }

    // map staker address to stake details
    mapping(address => Stake) public stakes;

    // map staker to total staking time 
    mapping(address => uint256) public stakingTime;    

    constructor(ERC20 token, address nftAddress) {
		_token = token;
        parentNFT = IERC1155(nftAddress); // Change it to your NFT contract addr
    }

    function stake(uint256 _tokenId, uint256 _amount) public {
        stakes[msg.sender] = Stake(_tokenId, _amount, block.timestamp); 
        parentNFT.safeTransferFrom(msg.sender, address(this), _tokenId, _amount, "0x00");
    } 

    function unstake() public {
        parentNFT.safeTransferFrom(address(this), msg.sender, stakes[msg.sender].tokenId, stakes[msg.sender].amount, "0x00");
        stakingTime[msg.sender] += (block.timestamp - stakes[msg.sender].timestamp);
		reward(
        delete stakes[msg.sender];
    }      

	function lockin(uint256 period) {
		require(period > 0, 'Lock in period must be greater than 0');
		lockinPeriod = period;
	}	
	
	function reward(uint256 period, uint256 stakeTime) {
		require(period > 0, 'Lock in period must be greater than 0');
		require(stakeTime > 0, 'Staking time must be greater than 0');
		
		uint256 tokenBalance = _token.balanceOf(address(this));
        require(_amount > 0, 'You need to send reward amount');
        require(_amount <= tokenBalance, 'Not enough tokens in the reserve');
        _token.increaseAllowance(address(this), _amount);
        _token.transfer(msg.sender, _amount);
	}

     function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    ) external returns (bytes4) {
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

}