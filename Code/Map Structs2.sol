// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");

        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    function transfer(address recipient, uint amount) external {
        User storage sender = users[msg.sender];
        User storage receiver = users[recipient];

        require(sender.isActive, "Sender is not an active user");
        require(receiver.isActive, "Recipient is not an active user");
        require(sender.balance >= amount, "Insufficient balance");

        sender.balance -= amount;
        receiver.balance += amount;
    }
}
