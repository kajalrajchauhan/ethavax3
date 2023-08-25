// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract MyToken  {
    string public  tokenName = "Kajal";
    string public  tokenAbbrv = "Chauhan";
    uint public  totalSupply = 0;
    address public owner;
    mapping  (address=>uint ) public  balances;
    constructor() {
        owner = msg.sender;
        
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        totalSupply+= amount;
        balances[to]+= amount;
        //mint(to, amount);
    }

     function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function burn(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        totalSupply -= amount;
    }


}