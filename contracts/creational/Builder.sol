// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

//
// PRODUCTS
//

contract IProduct {
    // ...
}

contract Product1 is IProduct {
    // ...
}

contract Product2 is IProduct {
    // ...
}

//
// Builders
//

interface IBuilder {
    function reset() external returns(IProduct);

    function buildStepA() external;

    function buildStepB() external;

    function buildStepZ() external;

    function getResult() external view returns(IProduct);
}

contract ConcreteBuilder1 is IBuilder {

    Product1 product;

    function reset() external virtual returns(IProduct) {
        Product1 newProduct = new Product1();
        product = newProduct;
        return newProduct;
    }

    function buildStepA() external virtual {
        // ...
    }

    function buildStepB() external virtual {
        // ...
    }

    function buildStepZ() external virtual {
        // ...
    }

    function getResult() external view virtual returns(IProduct) {
        return product;
    }
}

contract ConcreteBuilder2 is IBuilder {

    Product2 product;

    function reset() external virtual returns(IProduct) {
        Product2 newProduct = new Product2();
        product = newProduct;
        return newProduct;
    }

    function buildStepA() external virtual {
        // ...
    }

    function buildStepB() external virtual {
        // ...
    }

    function buildStepZ() external virtual {
        // ...
    }

    function getResult() external view virtual returns(IProduct) {
        return product;
    }
}

//
// Director
//

contract Director {

    enum ProductType {SIMPLE, HARD}

    IBuilder builder;

    constructor(IBuilder _builder) {
        builder = _builder;
    }

    function changeBuilder(IBuilder _builder) external virtual {
        builder = _builder;
    }

    function make(ProductType _productType) external virtual {
        if (_productType == ProductType.SIMPLE) {
            builder.buildStepA();
        } else {
            builder.buildStepB();
            builder.buildStepZ();
        }
    }
}

//
// Client
//

contract Client {

    function someFunc() external virtual {
        ConcreteBuilder1 b = new ConcreteBuilder1();
        Director d = new Director(b);
        d.make(Director.ProductType.SIMPLE);
        IProduct p = b.getResult();
        p;
    }

}