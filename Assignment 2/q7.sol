// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerAccess {
    // assigning owner;s address
    address public owner = 0x1111111112111111111111111111111111111111;
    // counter is 0 only owner can increas it
    int256 public x =0;

    // this function will chage the owner to the owner of account
    function changeOwner() public {
        // msg.sender == owner's account hash
        owner = msg.sender;
    }

    //modifier is to chage the behaviour of other function
    modifier onlyOwner() {
        //require is like if statement cheking if it's owner
        require(msg.sender == owner);
        // if statement is true then the body of code which is represented by_ will run else error 
        _;
    }

    //adding modifier to the this function now only owner wil be able to run it
    function restrictedFunction() public onlyOwner() {
        x+=1;
    }
}