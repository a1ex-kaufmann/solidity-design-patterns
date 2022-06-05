// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface ISubscriber {

    function update(bytes32 context) external;

}

contract ConcreteSubscriber is ISubscriber {

    function update(bytes32 context) public {
        // ...
    }

}

contract Publisher {
    ISubscriber[] _subscribers;
    bytes32 _mainstate;

    function subscribe(ISubscriber s) public {
        _subscribers.push(s);
    }

    function unSubscribe(ISubscriber s) public {
        // _subscribers.pop(s);
    }

    function notifySubscribers() public {
        for (uint256 i = 0; i < _subscribers.length; i++) {
            _subscribers[i].update(_mainstate);
        }
    }

}

contract Client {

    Publisher _publisher;

    function doSomething() public {
        ConcreteSubscriber s = new ConcreteSubscriber();
        _publisher.subscribe(s);
    }

}
