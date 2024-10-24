// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract BuyMeACoffee {
    event NewMemo(
        address indexed from,
        string name,
        string message
    );

    struct Memo {
        address from;
        string name;
        string message;
    }

    Memo[] public memos;

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    
    function buyACoffee(
        string memory _name,
        string memory _message
    ) public payable {
        require(msg.value > 0, "Can't buy a coffee with 0 MATIC.");

        memos.push(Memo(msg.sender, _name, _message));

        emit NewMemo(msg.sender, _name, _message);
    }

    /*
     retrive all the memos received and stored on the blockchain
     */
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
