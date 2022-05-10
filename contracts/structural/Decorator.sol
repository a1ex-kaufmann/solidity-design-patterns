// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IComponent {
    function execute() external;
}

contract ConcreteComponent is IComponent {

    function execute() external {
        // ...
    }
}

contract BaseDecorator is IComponent {

    IComponent wrappee;

    function execute() public virtual override {
        wrappee.execute();
    }
}

contract ConcreteDecorators is BaseDecorator {

    function execute() public override {
        super.execute();
    }

    function extra() external {}
}

contract Client {

    IComponent comp;
    function someMethod() external {

        comp.execute();
        
    }
}
