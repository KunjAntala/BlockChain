// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogging {
    // crating an event which can be accessed in th frontend to display to user
    event Transfer(address from, address to, uint256 value);

    function transfer(address to, uint256 value) public {
        //emit will run the event 
        emit Transfer(msg.sender, to, value);
    }
}