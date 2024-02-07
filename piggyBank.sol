// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract PiggyBank{
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    function deposit() external payable{}

    function withdraw() external {
       require(msg.sender == owner, "Not owner");
       require(address(this).balance > 0, "Insufficient balance");
       selfdestruct(owner);
    }

    receive() external payable { }
}