// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract RecieveEther{
    receive() external payable { }

    fallback() external payable{}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract sendEther{
    // not recommended
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    // not recommended
    function sendViaSend(address payable _to) public payable {
        bool send = _to.send(msg.value);
        require(send, "Failed to send");
    }

    // recommmended 
    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send ether");
        data;
    }
}