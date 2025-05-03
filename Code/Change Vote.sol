// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;
    mapping(address => bool) public hasVotedBefore;

    function createVote(Choices choice) external {
        require(!hasVotedBefore[msg.sender], "You have already voted");

        votes.push(Vote({
            choice: choice,
            voter: msg.sender
        }));

        hasVotedBefore[msg.sender] = true;
    }

    function hasVoted(address user) external view returns (bool) {
        return hasVotedBefore[user];
    }

    function findChoice(address user) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return votes[i].choice;
            }
        }
        revert("Vote not found");
    }

    function changeVote(Choices newChoice) external {
        require(hasVotedBefore[msg.sender], "You haven't voted yet");

        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                return;
            }
        }

        revert("Vote not found"); // Just in case
    }
}