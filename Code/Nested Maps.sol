// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum ConnectionTypes {
        Unacquainted,
        Friend,
        Family
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address _other, ConnectionTypes _connectionType) external {
        connections[msg.sender][_other] = _connectionType;
    }
}
