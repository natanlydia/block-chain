contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    // Public storage array of Vote structs
    Vote[] public votes;

    // Function to create and store a new vote
    function createVote(Choices choice) external {
        votes.push(Vote({
            choice: choice,
            voter: msg.sender
        }));
    }

    // Check if an address has already voted
    function hasVoted(address user) external view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return true;
            }
        }
        return false;
    }

    // Find the choice made by an address (assumes vote exists)
    function findChoice(address user) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return votes[i].choice;
            }
        }
        revert("Vote not found"); // Optional fallback in case vote is missing
    }
}