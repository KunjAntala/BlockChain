// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PersonalizedMassage{
    string public massage;
    constructor(string memory personalmas) {
        // setting personalized massage at deployment
        massage = personalmas;
    }
    function getMassage()public view returns (string memory) {
        // getting personalized massage
        return massage; 
    }
}