// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    address owner; // Owner of the contract
    uint256 private counter; // This line is added
    
    // create the constructor
    constructor() {
        owner = msg.sender;
        voted_addresses.push(msg.sender);
    }
    
    // create the modifiers
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier active() {
        require(proposal_history[counter].is_active == true);
        _;
    }

    modifier newVoter(address _address) {
        require(!isVoted(_address), "Address has already voted");
        _;
    }

    // create the structure for Proposal
    struct Proposal {
        string description; // Description of the proposal
        uint256 approve; // Number of approve votes
        uint256 reject; // Number of reject votes
        uint256 pass; // Number of pass votes
        uint256 total_vote_to_end; // When the total votes in the proposal reaches this limit, proposal ends
        bool current_state; // This shows the current state of the proposal, meaning whether if passes of fails
        bool is_active; // This shows if others can vote to our contract
        string title; // This allow each proposal to have a brief title in addition to its description
    }
    
    mapping(uint256 => Proposal) proposal_history; // Recordings of previous proposals
    address[] private voted_addresses; 
    
    // function to create the new proposal
    function create(string calldata _description, uint256 _total_vote_to_end, string calldata _title) external onlyOwner{
        counter += 1;
        proposal_history[counter] = Proposal(_description, 0, 0, 0, _total_vote_to_end, false, true, _title);
    }

    // function to transfer the ownership to other address
    function setOwner(address new_owner) external onlyOwner {
        owner = new_owner;
    }
    
    // function to calculate the current state for proposal
    function calculateCurrentState() private view returns(bool) {
        Proposal storage proposal = proposal_history[counter];

        uint256 approve = proposal.approve;
        uint256 reject = proposal.reject;
        uint256 pass = proposal.pass;
        
        // approve = reject + pass / 2
        if (proposal.pass %2 == 1) {
            pass += 1;
        }

        return approve > reject + pass / 2;
    }

    // function to caste the vote
    function vote(uint8 choice) external active newVoter(msg.sender){
        Proposal storage proposal = proposal_history[counter];
        uint256 total_vote = proposal.approve + proposal.reject + proposal.pass;

        voted_addresses.push(msg.sender);

        if (choice == 1) {
            proposal.approve += 1;
            proposal.current_state = calculateCurrentState();
        } else if (choice == 2) {
            proposal.reject += 1;
            proposal.current_state = calculateCurrentState();
        } else if (choice == 0) {
            proposal.pass += 1;
            proposal.current_state = calculateCurrentState();
        }

        if ((proposal.total_vote_to_end - total_vote == 1) && (choice == 1 || choice == 2 || choice == 0)) {
            proposal.is_active = false;
            voted_addresses = [owner];
        }
    }
    
    // function to terminate the proposal
    function terminateProposal() external onlyOwner active {
        proposal_history[counter].is_active = false;
    }
    
    // function to check the address is participated in voting or not
    function isVoted(address _address) public view returns (bool) {
        for (uint i = 0; i < voted_addresses.length; i++) {
            if (voted_addresses[i] == _address) {
                return true;
            }
        }
        return false;
    }
    
    // function to check the current proposal
    function getCurrentProposal() external view returns(Proposal memory) {
        return proposal_history[counter];
    }
    
    // function to get the total proposal
    function getProposal(uint256 number) external view returns(Proposal memory) {
        return proposal_history[number];
    }
}
