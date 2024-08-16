// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    // to party to vote and default vote is 0
    uint private c1=0;
    uint private c2=0;
    function VoteForC1()public{
        // voteing for c1
        c1+=1;
    }
    function VoteForC2()public {
        //votiing for c2
        c2+=1;
    }
    function ResultVotesofc1()public view returns(uint){
        // viewing vote for c1
        return c1;
    }
    function ResultVotesofc2()public view returns(uint) {
        //viewing vote for c2
        return c2;
    }
}