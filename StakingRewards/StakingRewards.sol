// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";

contract StakingRewards {
    // The token used for staking
    IERC20 public immutable stakingToken;
    // The token used for rewarding
    IERC20 public immutable rewardsToken;
    // Address of the contract owner
    address public owner;

    // Duration of rewards payout in seconds
    uint public duration;
    // Timestamp indicating when the current reward period finishes
    uint public finishAt;
    // Last updated time for rewards calculations
    uint public updatedAt;
    // Rate at which rewards are distributed per second
    uint public rewardRate;
    // Accumulated reward per token, stored with precision
    uint public rewardPerTokenStored;
    // User address => rewardPerTokenStored at the time of last update
    mapping(address => uint) public userRewardPerTokenPaid;
    // User address => rewards to be claimed
    mapping(address => uint) public rewards;

    // Total amount of tokens staked
    uint public totalSupply;
    // User address => amount of tokens staked by the user
    mapping(address => uint) public balanceOf;

    // Constructor to initialize the contract with staking and reward tokens
    constructor(address _stakingToken, address _rewardToken) {
        owner = msg.sender; // Set the contract deployer as the owner
        stakingToken = IERC20(_stakingToken); // Initialize the staking token
        rewardsToken = IERC20(_rewardToken); // Initialize the rewards token
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "not authorized");
        _;
    }

    // Modifier to update rewards before executing a function
    modifier updateReward(address _account) {
        rewardPerTokenStored = rewardPerToken(); // Update stored reward per token
        updatedAt = lastTimeRewardApplicable(); // Update the last applicable time for rewards

        if (_account != address(0)) {
            // Update the rewards and reward per token for the account
            rewards[_account] = earned(_account);
            userRewardPerTokenPaid[_account] = rewardPerTokenStored;
        }
        _;
    }

    // Returns the last applicable time for reward calculations
    function lastTimeRewardApplicable() public view returns (uint) {
        return _min(finishAt, block.timestamp); // Return the lesser of finishAt or current time
    }

    // Calculates the reward per token
    function rewardPerToken() public view returns (uint) {
        if (totalSupply == 0) {
            return rewardPerTokenStored; // No staked tokens, return stored reward per token
        }

        // Calculate the reward per token considering the elapsed time
        return
            rewardPerTokenStored +
            (rewardRate * (lastTimeRewardApplicable() - updatedAt) * 1e18) / totalSupply;
    }

    // Allows users to stake tokens
    function stake(uint _amount) external updateReward(msg.sender) {
        require(_amount > 0, "amount = 0"); // Ensure the amount is positive
        stakingToken.transferFrom(msg.sender, address(this), _amount); // Transfer tokens from user to contract
        balanceOf[msg.sender] += _amount; // Update the user's staked balance
        totalSupply += _amount; // Update the total staked amount
    }

    // Allows users to withdraw staked tokens
    function withdraw(uint _amount) external updateReward(msg.sender) {
        require(_amount > 0, "amount = 0"); // Ensure the amount is positive
        balanceOf[msg.sender] -= _amount; // Update the user's staked balance
        totalSupply -= _amount; // Update the total staked amount
        stakingToken.transfer(msg.sender, _amount); // Transfer tokens back to the user
    }

    // Calculates the total rewards earned by a user
    function earned(address _account) public view returns (uint) {
        return
            ((balanceOf[_account] *
                (rewardPerToken() - userRewardPerTokenPaid[_account])) / 1e18) +
            rewards[_account]; // Calculate the earned rewards including any unclaimed rewards
    }

    // Allows users to claim their rewards
    function getReward() external updateReward(msg.sender) {
        uint reward = rewards[msg.sender]; // Get the rewards for the user
        if (reward > 0) {
            rewards[msg.sender] = 0; // Reset the rewards for the user
            rewardsToken.transfer(msg.sender, reward); // Transfer rewards to the user
        }
    }

    // Allows the owner to set the duration for rewards
    function setRewardsDuration(uint _duration) external onlyOwner {
        require(finishAt < block.timestamp, "reward duration not finished"); // Ensure the current reward period has ended
        duration = _duration; // Set the new reward duration
    }

    // Notifies the contract of a new reward amount and updates the reward rate
    function notifyRewardAmount(uint _amount)
        external
        onlyOwner
        updateReward(address(0))
    {
        if (block.timestamp >= finishAt) {
            rewardRate = _amount / duration; // Calculate the reward rate if the reward period has ended
        } else {
            uint remainingRewards = (finishAt - block.timestamp) * rewardRate; // Calculate remaining rewards
            rewardRate = (_amount + remainingRewards) / duration; // Update reward rate considering the remaining rewards
        }

        require(rewardRate > 0, "reward rate = 0"); // Ensure the reward rate is positive
        require(
            rewardRate * duration <= rewardsToken.balanceOf(address(this)),
            "reward amount > balance"
        ); // Ensure the contract has enough balance to cover the rewards

        finishAt = block.timestamp + duration; // Set the new finish time for the reward period
        updatedAt = block.timestamp; // Update the last updated time
    }

    // Private function to return the minimum of two values
    function _min(uint x, uint y) private pure returns (uint) {
        return x <= y ? x : y; // Return the lesser of x and y
    }
}
