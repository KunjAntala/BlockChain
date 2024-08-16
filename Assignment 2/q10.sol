// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MassageStore {
    string public massage;

    function Store(string memory msag)public {
        // takes input from user and store's in the massage variable
        massage = msag;
    }
    function getMassage()public view returns(string memory) {
        // returns the massage stored in massage variable
        return  massage;
    }
}