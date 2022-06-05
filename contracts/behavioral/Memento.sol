// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IMemento {

}

contract ConcreteMemento is IMemento {

    bytes32 _state;

    constructor(bytes32 state) {
        _state = state;
    }

    function getState() public view returns(bytes32) {
        // ...
    }
}

contract Originator {
    bytes32 _state;

    function save() public returns(IMemento) {
        return new ConcreteMemento(_state);
    }

    function restore(IMemento memento) public {
        ConcreteMemento m = ConcreteMemento(address(memento));
        _state = m.getState();
    }

}

contract CareTaker {
    Originator _originator;
    IMemento[] _history;

    function doSomething() public {
        IMemento m = _originator.save();
        _history.push(m);
    }

    function undo() public {
        IMemento m = _history[_history.length - 1];
        _history.pop();
        _originator.restore(m);
    }

}
