// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./LogEmitter.sol";
import "./LogEncoder.sol";

contract LogEncode is LogEmitter {
    using LogEncoder for *;

    string LogToBeEncodedSig = "LogToBeEncoded(address,string,uint256)";
    event LogToBeEncoded(address indexed sender, string indexed value, uint256 value1);

    function logToBeEncoded0(string memory _value, uint256 _value1) public {
        emit LogToBeEncoded(msg.sender, _value, _value1);
    }

    function logToBeEncoded1(string memory _value, uint256 _value1) public {
        // A number of ways to encode:
        
        // log(keccak256("LogToBeEncoded(address,string,uint256)"), msg.sender.topic(), _value.topic(), abi.encode(_value1));
        // log(string("LogToBeEncoded(address,string,uint256)").topic(), msg.sender.topic(), _value.topic(), abi.encode(_value1));
        // log(LogToBeEncodedSig.topic(), msg.sender.topic(), _value.topic(), abi.encode(_value1));
        log(LogToBeEncoded.selector, msg.sender.topic(), _value.topic(), _value1.data());
    }

    function _beforeLog() internal override {}

    function logCallTest(bytes memory a, uint b) public logCall {}
}