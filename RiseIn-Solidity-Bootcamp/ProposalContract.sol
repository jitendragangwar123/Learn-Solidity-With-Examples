// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    address owner; // Owner of the contract
    uint256 private counter; // This line is added
    
    // create the constructor
    constructor() {
        owner = msg.sender;
    }
    
    // create the modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    //create the structure for Proposal
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
    
    // function to create the new proposal
    function create(string calldata _description, uint256 _total_vote_to_end, string calldata _title) external onlyOwner{
        counter += 1;
        proposal_history[counter] = Proposal(_description, 0, 0, 0, _total_vote_to_end, false, true, _title);
    }

    // function to transfer the ownership to other address
    function setOwner(address new_owner) external onlyOwner {
        owner = new_owner;
    }
}
