// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

abstract contract AbstractClass {

    function templateMethod() external {
        step1();
        step2();
        step3();
        step4();
    }

    function step1() public {
        // ...
    }
    function step2() public {
        // ...
    }

    function step3() public virtual;
    function step4() public virtual;

}

contract ConcreteClass1 is AbstractClass {

    function step3() public override {
        // ...
    }
    function step4() public override {
        // ...
    }

}

contract ConcreteClass2 is AbstractClass {

    function step3() public override {
        // ...
    }
    function step4() public override {
        // ...
    }

}

