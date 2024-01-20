## Learn-Solidity-With-Examples
- This repository contains various smart contract examples built using Solidity. These examples are designed to showcase different functionalities, use cases, and features of smart contracts on the Ethereum blockchain. Developers and enthusiasts can explore these contracts to gain a better understanding of how to create, deploy, and interact with smart contracts for a wide range of applications and scenarios.
      
## Blockchain-Roadmap
[Blockchain-Roadmap Link](https://docs.google.com/document/d/19vNRerdEXhu3e8nsilW_Au4D9MRXqHaOWAGCKgXxwPc/edit?usp=sharing).
## Table Of Contents
- [Codedamn](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/Codedamn)
- [CodiesAlert](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/CodiesAlert)
- [DappWorldExercises](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/DappWorldExercises)
- [NFTStaking](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/NFTStaking)
- [StakingRewards](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/StakingRewards)
- [Vault](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/Vault)
- [WETH](https://github.com/jitendragangwar123/Learn-Solidity-With-Examples/tree/main/WETH)

## natspec:-
- The standard in the Solidity community is to use a format called natspec, which looks like this:-
```shell
/**
 * @title A contract for basic math operations
 * @author Jitendra Gangwar
 * @notice For now, this contract just adds a multiply function
 */
contract Math {
  /**
   * @notice Multiplies 2 numbers together
   * @param x the first uint.
   * @param y the second uint.
   * @return z the product of (x * y)
   * @dev This function does not currently check for overflows
   */
  function multiply(uint x, uint y) returns (uint z) {
    // This is just a normal comment, and wont get picked up by natspec
    z = x * y;
  }
}
```
```shell
- @title and @author are straightforward.
- @notice explains to a user what the contract / function does. 
- @dev is for explaining extra details to developers.
- @param and @return are for describing what each parameter and return value of a function are for.
```
- Note that you don't always have to use all of these tags for every function — all tags are optional. 
But at the very least, leave a @dev note explaining what each function does.
