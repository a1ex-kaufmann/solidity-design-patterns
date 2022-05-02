// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

//
// PRODUCTS
//

abstract contract ProductA {
    // ...
}

abstract contract ProductB {
    // ...
}

contract ConcreteProductA1 is ProductA {
    // ...
}

contract ConcreteProductB1 is ProductB {
    // ...
}

contract ConcreteProductA2 is ProductA {
    // ...
}

contract ConcreteProductB2 is ProductB {
    // ...
}

//
// FACTORIES
//

abstract contract AbstractFactory {
    function createProductA() external virtual returns(ProductA);

    function createProductB() external virtual returns(ProductB);
}

contract ConcreteFactory1 is AbstractFactory {
    function createProductA() external override virtual returns(ProductA) {
        return new ConcreteProductA1();
    }

    function createProductB() external override virtual returns(ProductB) {
        return new ConcreteProductB1();
    }
}

contract ConcreteFactory2 is AbstractFactory {
    function createProductA() external override virtual returns(ProductA) {
        return new ConcreteProductA2();
    }

    function createProductB() external override virtual returns(ProductB) {
        return new ConcreteProductB2();
    }
}

contract Client {
    AbstractFactory factory;

    constructor(AbstractFactory f) {
        factory = f;
    }

    function someOperation() external virtual {
        ProductA pa = factory.createProductA();
        pa;  // ...
    }
}

