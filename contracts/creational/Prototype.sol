// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

//
// PROTOTYPE
//

interface IPrototype {
    function clone() external returns(IPrototype);
    function getField1() external view returns(uint256);
    function getField2() external view returns(uint256);
}

contract ConcretePrototype is IPrototype {

    uint256 private field1;
    uint256 private field2;

    function clone() external override returns(IPrototype) {
        // ConcretePrototype newPrototype = new ConcretePrototype();
        // newPrototype.initializeClone(this);
        // return newPrototype;
    }

    function getField1() external view override returns(uint256) {
        return field1;
    }
    function getField2() external view override returns(uint256) {
        return field2;
    }

    function initialize() external {
        // ...
    }

    function initializeClone(ConcretePrototype prototype) external {
        field1 = prototype.getField1();
        field2 = prototype.getField2();
    }
}


//
// Client
//

contract Client {

    function someFunc() external virtual {
        // ConcretePrototype p = new ConcretePrototype();
        // p.initialize();

        // IPrototype cp = p.clone();
    }

}
