// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld{
    string public hello = "Hello World";
    function givehello() public view returns (string memory) 
    {
        // returns Hello word saved in String hello
        return hello ;
    }
}