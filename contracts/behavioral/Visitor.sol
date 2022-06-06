// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IVisitor {

    function visit(ElementA e,bool) external;
    function visit(ElementB e) external;

}

interface IElement {

    function accept(IVisitor v) external;

}

contract ElementA is IElement {

    function accept(IVisitor v) external {
        v.visit(this,false);
    }

    function featureA() external {
        // ...
    }

}

contract ElementB is IElement {

    function accept(IVisitor v) external {
        v.visit(this);
    }

    function featureB() external {
        // ...
    }

}

contract ConcreteVisitor1 is IVisitor {

    function visit(ElementA e,bool) external {
        // ...
    }

    function visit(ElementB e) external {
        // ...
    }
}

contract Client {

    function someMethod() public {
        ElementA e = new ElementA();

        e.accept(new ConcreteVisitor1());

    }

}
