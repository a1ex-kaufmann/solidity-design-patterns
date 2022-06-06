// SPDX-License-Identifier: MIT
// solhint-disable no-empty-blocks
pragma solidity 0.8.10;

contract Invoker {

    ICommand _command;

    function setCommand(ICommand command) public {
        _command = command;
    }

    function executeCommand() public {
        _command.execute();
    }
}

interface ICommand {
    
    function execute() external;

}

contract Command1 is ICommand {

    Receiver _receiver;
    bytes32 _params;
    
    constructor(Receiver receiver, bytes32 params) {
        _receiver = receiver;
        _params = params;
    }

    function execute() external {
        _receiver.operation(_params);
    }
}

contract Command2 is ICommand {

    Receiver _receiver;
    bytes32 _params;
    
    constructor(Receiver receiver, bytes32 params) {
        _receiver = receiver;
        _params = params;
    }

    function execute() external {
        _receiver.operation(_params);
    }
}

contract Receiver {
    function operation(bytes32 params) public { }
}

contract Client {

    function someMethod() external {

        Receiver receiver = new Receiver();
        Invoker invoker = new Invoker();
        
        Command1 copy = new Command1(receiver, bytes32(0));
        invoker.setCommand(copy);

    }
}
