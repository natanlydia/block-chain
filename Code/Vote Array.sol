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
}