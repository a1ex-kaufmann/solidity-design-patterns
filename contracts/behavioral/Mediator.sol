// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

contract ComponentA {
    IMediator m;

    function operationA() external {
        // ...
    }
}

contract ComponentB {
    IMediator m;

    function operationA() external {
        // ...
    }
}

contract ComponentC {
    IMediator m;

    function operationA() external {
        // ...
    }
}

contract ComponentD {
    IMediator m;

    function operationA() external {
        // ...
    }
}

interface IMediator {
    
    function notify() external;

}

contract ConcreteMediator is IMediator {

    ComponentA compA;
    ComponentB compB;
    ComponentC compC;
    ComponentD compD;

    function notify() external {
        if (msg.sender == address(compA)) {
            reactOnA();
        } else if (msg.sender == address(compB)) {
            reactOnB();
        } else if (msg.sender == address(compC)) {
            reactOnC();
        } else if (msg.sender == address(compD)) {
            reactOnD();
        }
    }

    function reactOnA() internal {
        // ...
    }
    function reactOnB() internal {
        // ...
    }
    function reactOnC() internal {
        // ...
    }
    function reactOnD() internal {
        // ...
    }
}
