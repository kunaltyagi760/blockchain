// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EventTicket{
    uint public noOfTicket;
    uint public ticketPrice;
    uint public totalAmount;
    uint public startAt;
    uint public endAt;
    uint public timeRange;
    string public message = "Buy your first Event Ticket";

    constructor(uint _ticketPrice){
        ticketPrice = _ticketPrice;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timeRange = (endAt - startAt) / 60 /60 /24;
    }

    function buyTicket(uint _value) public returns(uint){
        noOfTicket++;
        totalAmount += _value;
        return noOfTicket;
    }
}