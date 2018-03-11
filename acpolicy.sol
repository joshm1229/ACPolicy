pragma solidity ^0.4.21;
contract mortal {
    /* Define variable owner of the type address */
    address owner;

    /* This function is executed at initialization and sets the owner of the contract */
    function mortal() public { owner = msg.sender; }

    /* Function to recover the funds on the contract */
    function kill() public { if (msg.sender == owner) selfdestruct(owner); }
}

contract ACPolicy is mortal {
    /* This variable is the policy limit */
    int acLimit;
    
    /* This runs when the contract is executed */
    function update(int newLimit) public {
        acLimit = newLimit;
    }

    /* Main function */
    function get() public constant returns (int) {
        return acLimit;
    }
}

