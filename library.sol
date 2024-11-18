// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

library Array{
    function remove (uint[] storage arr, uint index) public {
        require(arr.length < 1, "Can't remove fom empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray{
    using Array for uint[];

    uint[]  public arr;

    constructor() {
        for(uint i=0; i<3; i++){
        arr.push(i);
     }
    }
    
    function testRemove() public {
        arr.remove(1);

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1]==2);
    }
    
}