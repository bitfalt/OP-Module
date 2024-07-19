// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Token {
    address public owner;
    mapping(address => uint) public balances;
    string public name = "Dojo Coin";
    string public ticket = "DJC";
    uint public supply = 1_000_000_000;
    bool public burnable = true;

    constructor() {
        owner = msg.sender;
        balances[owner] = supply;
    }

    function burn(address _to, uint _amount) public {
        require(msg.sender == owner, "Only owner can burn!");
        require(balances[msg.sender] >= _amount, "Not enough funds to burn!");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function mint(address _to, uint _amount) public {
        require(msg.sender == owner, "Only owner can mint!");
        balances[_to] += _amount;
        supply += _amount;
    }

    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Not enough funds to send!");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}