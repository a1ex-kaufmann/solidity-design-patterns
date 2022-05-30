// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IComponent {
    function execute() external;
}

contract Leaf is IComponent {

    function execute() external {

        // ...

    }
}

contract Composite is IComponent {

    IComponent[] children;
    
    function add() external {
        // ...
    }
    function remove() external {
        // ...
    }
    function getChildren() external {
        // ...
    }
    function execute() external {
        // ...
        for (uint256 i = 0; i < children.length; i++) {
            children[i].execute();
        }
    }
}

contract Client {

    IComponent comp;
    function someMethod() external {

        comp.execute();
        
    }
}
