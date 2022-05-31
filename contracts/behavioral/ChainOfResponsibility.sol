// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IHandler {
    
    function setNext(IHandler h) external;
    function handle(bytes32 request) external;
}

contract BaseHandler is IHandler {

    IHandler next;
    
    function setNext(IHandler h) public {
        next = h;
    }

    function handle(bytes32 request) public virtual {
        if (address(next) != address(0)) {
            next.handle(request);
        }
    }
}

contract ConcreteHandler is BaseHandler {

    function handle(bytes32 request) public override {
        // ...

        super.handle(request);
    }
}

contract Client {

    function someMethod() external {

        ConcreteHandler h1 = new ConcreteHandler();
        ConcreteHandler h2 = new ConcreteHandler();
        ConcreteHandler h3 = new ConcreteHandler();

        h1.setNext(h2);
        h2.setNext(h3);

        h1.handle(bytes32(0));
        
    }
}
