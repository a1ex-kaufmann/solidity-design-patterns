// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;


contract Proxy {

    Service realService;

    constructor(Service _realService) {
        realService = _realService;
    }

    function checkAccess() public returns(bool) {
        // ...
    }

    function operation() external {
        if (checkAccess()) {
            realService.operation();
        }
    }
}

interface IService {
    
    function operation() external;
}

contract Service is IService {
    
    function operation() external {
        // ...
    }
}

contract Client {

    IService service;
    function someMethod() external {

        service.operation();
        
    }
}
