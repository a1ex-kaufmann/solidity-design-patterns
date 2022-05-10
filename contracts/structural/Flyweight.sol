// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;


contract FlyweightFactory {

    Flyweight[] cache;

    function getFlyweight(uint256 repeatingState) external returns(Flyweight) {
        
        if (repeatingState == cache.length) {
            cache.push(new Flyweight());
        } else if(repeatingState < cache.length) {
            return cache[repeatingState];
        } else {
            revert();
        }
    }
}

contract Flyweight {

    uint256 repeatingState;

    function operation(uint256 uniqueState) external {
        // ...
    }
}

contract Context {

    FlyweightFactory factory;
    Flyweight flyweight;
    uint256 uniqueState;

    constructor(FlyweightFactory _factory, uint256 _repeatingState, uint256 _uniqueState) {
        factory = _factory;
        flyweight = factory.getFlyweight(_repeatingState);
        uniqueState = _uniqueState;
    }

    function operation(uint256 _uniqueState) external {
        flyweight.operation(_uniqueState);
    }
}

contract Client {

    Context[] context;

    function someMethod() external {

        FlyweightFactory factory = new FlyweightFactory();  // or from storage
        context.push(new Context(factory, 0, 123));
        context.push(new Context(factory, 0, 123123123));
        context.push(new Context(factory, 0, 1223123));
        context.push(new Context(factory, 0, 12223));
        
    }
}
