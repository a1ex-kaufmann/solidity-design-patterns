// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IStrategy {

    function execute(bytes32 data) external;

}

contract Context {

    IStrategy _strategy;

    function setStrategy(IStrategy strategy) public {
        _strategy = strategy;
    }

    function doSomething() public {
        _strategy.execute(bytes32(0));
    }
}

contract ConcreteStrategy1 is IStrategy {

    function execute(bytes32 data) external {
        // ...
    }

}

contract ConcreteStrategy2 is IStrategy {

    function execute(bytes32 data) external {
        // ...
    }

}

contract Client {

    function someMethod() public {
        Context c = new Context();

        ConcreteStrategy1 str1 = new ConcreteStrategy1();
        c.setStrategy(str1);
        c.doSomething();

        ConcreteStrategy2 str2 = new ConcreteStrategy2();
        c.setStrategy(str2);
        c.doSomething();
    }

}
