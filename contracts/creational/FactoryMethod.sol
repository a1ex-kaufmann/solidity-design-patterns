// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

//
// PRODUCTS
//

interface Product {
    function doStuff() external;
}

contract ConcreteProductA is Product {
    function doStuff() external override {}
}

contract ConcreteProductB is Product {
    function doStuff() external override {}
}

//
// CREATORS
//

abstract contract Creator {
    function someOperation() external {
        // ...
    }

    function createProduct() external virtual returns(Product);
}

contract ConcreteCreatorA is Creator {
    function createProduct() external override returns(Product) {
        return new ConcreteProductA();
    }
}

contract ConcreteCreatorB is Creator {
    function createProduct() external override returns(Product) {
        return new ConcreteProductB();
    }
}
