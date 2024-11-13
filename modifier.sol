// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Modifier{
    address public owner;
    uint public x=8;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner, "Not Owner");
        _;
    }

    modifier validateAddress(address _add){
        require(_add != address(0), "Not a valid address");
        _;
    }

    function checkOwner(address _newOwn) public onlyOwner validateAddress(_newOwn){
        owner = _newOwn;
    }

    modifier noReetrancy(){
        require(!locked, "No Reetrancy");
        locked=true;
        _;
        locked = false;
    }

    function decreament(uint i) public noReetrancy{

        if (i>1){
            decreament(i-1);
        }
        x -= 1;
    }
}