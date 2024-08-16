// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract savedInt{
    int256 public number;
    constructor(int256 savedint){
        // ask's for an int to be saved at deployment
        number = savedint;
    }

    function readnumber()public view returns (int256) {
        // returns the save integer
        return number;
    }
}