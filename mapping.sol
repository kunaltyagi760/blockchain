// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Mapping{

   mapping (address => uint) public myMap;

   function get(address _add) public view returns(uint){
    return myMap[_add];
   }

   function set(address _add, uint _i) public {
    myMap[_add] = _i;
   }

   function remove(address _add) public {
    delete myMap[_add];
   }
}

