// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

interface IAdapter {
    function method() external;
}

contract Adapter is IAdapter {

    Service service;

    constructor(Service _service) {
        service = _service;
    }

    function method() override external {
        // ...
        service.serviceMethod();
        // ...
    }
}

contract Service {
    
    function serviceMethod() external {
        // ...
    }
}

contract Client {

    IAdapter adapter;
    function someMethod() external {

        adapter.method();
        
    }
}
