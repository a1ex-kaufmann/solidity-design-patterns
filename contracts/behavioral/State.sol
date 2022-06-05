// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IState {

    function doA() external;
    function doB() external;

}

contract Context {

    IState _state;

    constructor(IState initialState) {
        _state = initialState;
    }

    function changeState(IState newState) public {
        _state = newState;
    }

    function doA() public {
        _state.doA();
    }

    function doB() public {
        _state.doB();
    }

}

contract ConcreteState1 is IState {

    function doA() external {
        // ...
    }
    function doB() external {
        // ...
    }

}

contract ConcreteState2 is IState {

    function doA() external {
        // ...
    }
    function doB() external {
        // ...
    }

}

contract Client {

    function doSomething() public {
        ConcreteState1 initialState = new ConcreteState1();
        Context c = new Context(initialState);
        c.doA();
    }

}
