// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IIterator {
    
    function getNext() external;

    function hasMore() external returns(bool);

}

contract ConcreteIterator is IIterator {

    ICollection _collection;
    bytes32 _iterationState;
    
    constructor(ICollection collection) {
        _collection = collection;
    }

    function getNext() external {}

    function hasMore() external returns(bool) {}
}

interface ICollection {
    
    function createIterator() external returns(IIterator);

}

contract ConcreteCollection is ICollection {

    function createIterator() external returns(IIterator) {
        return new ConcreteIterator(ConcreteCollection(address(this)));
    }

}
