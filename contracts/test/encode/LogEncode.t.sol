// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import {Vm} from "forge-std/Vm.sol";

import "../../src/encode/LogEncode.sol";

contract LogEncodeTest is Test {
    LogEncode logEncode;

    event LogToBeEncoded(address indexed sender, string indexed value, uint256 value1);
    event LogCall(bytes4 indexed selector, bytes indexed dataTopic, bytes data) anonymous; // anonymous `LogCall` for general log encoding.

    function setUp() public {
        logEncode = new LogEncode();
    }

    function testFuzz_Encode(string memory v0, uint v1) public {
        vm.recordLogs();

        vm.expectEmit(true, true, true, true);
        emit LogToBeEncoded(address(this), v0, v1);

        logEncode.logToBeEncoded0(v0, v1);

        // This is only for debuging.
        // Vm.Log[] memory logs = vm.getRecordedLogs();
        // for (uint256 i = 0; i < logs.length; i++) {
        //     console2.log("log ", i);
        //     console2.logBytes32(logs[i].topics[0]);
        //     console2.logBytes32(logs[i].topics[1]);
        //     console2.logBytes32(logs[i].topics[2]);
        //     console2.logBytes(logs[i].data);
        // }

        vm.expectEmit(true, true, true, true);
        emit LogToBeEncoded(address(this), v0, v1);

        logEncode.logToBeEncoded1(v0, v1);
    }

    function testFuzz_LogCall(bytes memory a, uint b) public {
        bytes memory data = abi.encodeWithSelector(logEncode.logCallTest.selector, a, b);

        vm.recordLogs();

        // A general event like:
        emit LogCall(logEncode.logCallTest.selector, data, data);

        logEncode.logCallTest(a, b);

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i], "invalid topic");
        }

        assertEq(logs[0].data, logs[1].data, "invalid data");

        bytes memory decodedData = abi.decode(logs[1].data, (bytes));
        
        // Example:
        // 0x176be90b
        // 0000000000000000000000000000000000000000000000000000000000000040
        // 0000000000000000000000000000000000000000000000000000000000202202
        // 0000000000000000000000000000000000000000000000000000000000000003
        // 1234560000000000000000000000000000000000000000000000000000000000

        bytes4 decodedSelector = bytes4(decodedData);

        decodedData = _removeSelectorFromBytes(decodedData);

        (bytes memory decodedA, uint decodedB) = abi.decode(decodedData, (bytes, uint));
        assertEq(decodedSelector, logEncode.logCallTest.selector, "invalid selector");
        assertEq(decodedA, a, "invalid a");
        assertEq(decodedB, b, "invalid b");
    }

    function _removeSelectorFromBytes(bytes memory b) internal returns(bytes memory res) {
        res = new bytes(b.length - 4);
        for (uint i; i < res.length; i++) {
            res[i] = b[i+4];
        }
    }
}