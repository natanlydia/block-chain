contract Contract {
    enum Choices { Yes, No }

    // Create a Vote struct with a choice and a voter address
    struct Vote {
        Choices choice;
        address voter;
    }

    // Public storage variable of type Vote
    Vote public vote;

    // Function to create a new vote
    function createVote(Choices choice) external {
        vote = Vote({
            choice: choice,
            voter: msg.sender
        });
    }
}