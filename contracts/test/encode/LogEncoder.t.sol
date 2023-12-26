// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";

import "../../src/encode/LogEmitter.sol";
import "../../src/encode/LogEncoder.sol";

contract LogEncoderTest is Test {
    using LogEncoder for *;

    LogEmitter emitter;

    function setUp() public {
        emitter = new LogEmitter();
    }

    // event LogToBeEncoded0(address indexed t, uint256 v);
    event EncodeLog0_uint256 (uint256 v) anonymous;
    event EncodeLog1_uint256(uint256 v);
    event EncodeLog2_uint256(uint256 indexed t, uint256 v);

    function test_EncodeLog0_0(uint256 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint256(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_0(uint256 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint256(v);

        emitter.log(EncodeLog1_uint256.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_0(uint256 t, uint256 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint256(t, v);

        emitter.log(EncodeLog2_uint256.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }
}