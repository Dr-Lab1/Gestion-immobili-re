// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract isOwner {

    address owner;

    constructor () {
        owner = msg.sender;
    }

    modifier _isOwner {
        require (owner == msg.sender, "Not the owner");
        _;
    }

}