// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IImplementation {
    function method1() external;
    function method2() external;
    function method3() external;
}

contract Implementation1 is IImplementation {

    function method1() external {}
    function method2() external {}
    function method3() external {}
}

contract Implementation2 is IImplementation {

    function method1() external {}
    function method2() external {}
    function method3() external {}
}

contract Abstraction {

    IImplementation i;

    constructor(IImplementation _i) {
        i = _i;
    }
    
    function feature1() external {
        i.method1();
    }

    function feature2() external {
        i.method2();
        i.method3();
    }
}

contract Client {

    Abstraction abstraction;
    function someMethod() external {

        abstraction.feature1();
        abstraction.feature2();
        
    }
}

