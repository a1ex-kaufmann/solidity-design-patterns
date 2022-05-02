// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

//
// PRODUCTS
//

interface IProduct {
    function doStuff() external;
}

contract ConcreteProductA is IProduct {
    function doStuff() external override {}
}

contract ConcreteProductB is IProduct {
    function doStuff() external override {}
}

//
// CREATORS
//

abstract contract Creator {
    function someOperation() external {
        // ...
    }

    function createProduct() external virtual returns(IProduct);
}

contract ConcreteCreatorA is Creator {
    function createProduct() external override returns(IProduct) {
        return new ConcreteProductA();
    }
}

contract ConcreteCreatorB is Creator {
    function createProduct() external override returns(IProduct) {
        return new ConcreteProductB();
    }
}
