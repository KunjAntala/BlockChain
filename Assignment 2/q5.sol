// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameStorage{
    string private name;
    function setName(string memory Nname)public {
        //  in this method which takes string as input it is storing usering name 
        name = Nname;
    }
    function getName()public view returns(string memory) {
        // retriveing user's name
        return name;
    }
}