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

    constructor(IComponent _wrappee) {
        wrappee = _wrappee;
    }

    function execute() public virtual override {
        wrappee.execute();
        // ...
    }
}

contract ConcreteDecorators is BaseDecorator {

    constructor(IComponent _wrappee) BaseDecorator(_wrappee) {
        // ...
    }

    function execute() public override {
        super.execute();
    }

    function extra() external {}
}

contract Client {

    function someMethod() external {

        ConcreteComponent comp = new ConcreteComponent();
        BaseDecorator decorated1 = new BaseDecorator(comp);

        decorated1;
        // ...
        
    }
}
