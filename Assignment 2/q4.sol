// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counting {
    // default counter setting 0
    uint private counter=0;
    function increas()public {
        // incrementing counter at the call of this method
        counter+=1;
    }
    function viewCounter()public view returns(uint) {
        // returning the current value of the counter
        return counter;
    }
}