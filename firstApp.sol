// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract NftCout{
    uint256 public no_of_nft;

    function checkTotalNft() public view returns(uint256){
        return no_of_nft;
    }

    function addNft() public {
        no_of_nft += 1;
    }

    function decNft() public {
        no_of_nft -= 1;
    }
}