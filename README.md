# Learn-Solidity-With-Examples
This repository have some smart contract examples build by using the solidity.
## Blockchain-Roadmap
This is the [Blockchain-Roadmap Link](https://docs.google.com/document/d/19vNRerdEXhu3e8nsilW_Au4D9MRXqHaOWAGCKgXxwPc/edit?usp=sharing).


```shell
The standard in the Solidity community is to use a format called ###natspec, which looks like this:

/// @title A contract for basic math operations
/// @author H4XF13LD MORRIS 💯💯😎💯💯
/// @notice For now, this contract just adds a multiply function
contract Math {
  /// @notice Multiplies 2 numbers together
  /// @param x the first uint.
  /// @param y the second uint.
  /// @return z the product of (x * y)
  /// @dev This function does not currently check for overflows
  function multiply(uint x, uint y) returns (uint z) {
    // This is just a normal comment, and won't get picked up by natspec
    z = x * y;
  }
}
@title and @author are straightforward.

@notice explains to a user what the contract / function does. @dev is for explaining extra details to developers.

@param and @return are for describing what each parameter and return value of a function are for.

Note that you don't always have to use all of these tags for every function — all tags are optional. But at the very least, leave a @dev note explaining what each function does.
```
