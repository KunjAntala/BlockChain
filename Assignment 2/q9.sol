// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleLedger {
    //for ledger taking vaue of the owner other party and the value
    struct Transaction {
        address from;
        address to;
        uint256 value;
    }
    // creating array of the structure
    Transaction[] public transactions;

    function recordTransaction(address from, address to, uint256 value) public {
        //creating thr new structure and assign in the given value
        Transaction memory temp = Transaction(from, to, value);
        // add that structure ti the array
        transactions.push(temp);
    }

    function getTransactions(uint x) public view returns (Transaction memory) {
        // checking if the length of the array is bigger then asked index
        require(x < transactions.length);
        // if yes then returnig tuple else an error
        return transactions[x];
    }
}