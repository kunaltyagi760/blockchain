// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

contract Array{
    uint[] public arr;
    uint[] public arr2=[1,2,3,4];
    // In fixed size array all elements initialize to 0
    uint[10] public fixed_arr;

    function get(uint i) public view returns(uint){
        return arr[i];
    }

    // solidity can returns the entire array but this function avoid for array that can grow indifinitely in length

    function getArr() public view returns(uint[] memory){
        return arr;
    }

    function push(uint num) public {
        arr.push(num);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns(uint){
        return arr.length;
    }

    // it do change the length of array just reset the value to 0
    function remove(uint index) public {
        delete arr[index];
    }

    // create a memory in array only fixed sized can be created
    // function examples() external {
    //     uint[] memory a = new uint[](5);
    // }
}