//Public Modifiers

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Contract One
contract One{
    //Public Modifier 
    function PublicOneFunc() public pure returns(string memory){
        return "Public One Function";
    }
}

//Public fuction Accessible into Contract Two also
contract Two is One{
    function PublicTwoFunc() public pure returns(string memory){
        return PublicOneFunc();
    }
}


//Internal Modifiers

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Contract One
contract One{
    //Internal Modifier 
    function InternalOneFunc() internal pure returns(string memory){
        return "Internal One Function";
    }
}

//Internal fuction Accessible into inherited Contract also
contract Two is One{
    function InternalTwoFunc() public pure returns(string memory){
        return InternalOneFunc();
    }
}



//Private Modifiers

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Contract One
contract One{
    //Private Modifier 
    function PrivateOneFunc() private pure returns(string memory){
        return "Private One Function";
    }

    function accessPrivateOnefunc() public pure returns(string memory){
        return PrivateOneFunc();
    }
}


