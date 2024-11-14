// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Visibility{
    // private fuction can be accesiable only inside contact can not call by child contract 

    function privatefun() private pure returns(string memory){
        return "this is private func";
    }

    function callPrivate() public pure returns(string memory){
        return privatefun();
    }

    function internalfun() internal pure returns(string memory){
        return "this is internal func";
    }

    function callInternal() public pure returns(string memory){
        return internalfun();
    }

    function externalfunc() external pure returns(string memory){
        return "this is external func";
    }
}

contract Child is Visibility{
    function testInternal() public pure returns(string memory){
        return internalfun();
    }
}