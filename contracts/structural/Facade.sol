// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

contract SubsystemClass1 {
}

contract SubsystemClass2 {
}

contract AdditionalFacade {
}


contract Facade {

    SubsystemClass1 subsystemClass1;
    SubsystemClass2 subsystemClass2;
    AdditionalFacade additionalFacade;

    function subsystemOperation() external {
        // ...
    }
}

contract Client {

    Facade facade;
    function someMethod() external {

        facade.subsystemOperation();
        
    }
}
