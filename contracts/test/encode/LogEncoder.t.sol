
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

    
    event EncodeLog0_bytes (bytes v) anonymous;
    event EncodeLog1_bytes(bytes v);
    event EncodeLog2_bytes(bytes indexed t, bytes v);
    event EncodeLog2WithoutData_bytes(bytes indexed t);

    function test_EncodeLog0_bytes(bytes calldata v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes(bytes calldata v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes(v);

        emitter.log(EncodeLog1_bytes.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes(bytes calldata t, bytes calldata v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes(t, v);

        emitter.log(EncodeLog2_bytes.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes(bytes calldata t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes(t);

        emitter.log(EncodeLog2WithoutData_bytes.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_string (string v) anonymous;
    event EncodeLog1_string(string v);
    event EncodeLog2_string(string indexed t, string v);
    event EncodeLog2WithoutData_string(string indexed t);

    function test_EncodeLog0_string(string calldata v) public {
        vm.recordLogs();

        emit EncodeLog0_string(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_string(string calldata v) public {
        vm.recordLogs();

        emit EncodeLog1_string(v);

        emitter.log(EncodeLog1_string.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_string(string calldata t, string calldata v) public {
        vm.recordLogs();

        emit EncodeLog2_string(t, v);

        emitter.log(EncodeLog2_string.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_string(string calldata t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_string(t);

        emitter.log(EncodeLog2WithoutData_string.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bool (bool v) anonymous;
    event EncodeLog1_bool(bool v);
    event EncodeLog2_bool(bool indexed t, bool v);
    event EncodeLog2WithoutData_bool(bool indexed t);

    function test_EncodeLog0_bool(bool v) public {
        vm.recordLogs();

        emit EncodeLog0_bool(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bool(bool v) public {
        vm.recordLogs();

        emit EncodeLog1_bool(v);

        emitter.log(EncodeLog1_bool.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bool(bool t, bool v) public {
        vm.recordLogs();

        emit EncodeLog2_bool(t, v);

        emitter.log(EncodeLog2_bool.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bool(bool t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bool(t);

        emitter.log(EncodeLog2WithoutData_bool.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_address (address v) anonymous;
    event EncodeLog1_address(address v);
    event EncodeLog2_address(address indexed t, address v);
    event EncodeLog2WithoutData_address(address indexed t);

    function test_EncodeLog0_address(address v) public {
        vm.recordLogs();

        emit EncodeLog0_address(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_address(address v) public {
        vm.recordLogs();

        emit EncodeLog1_address(v);

        emitter.log(EncodeLog1_address.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_address(address t, address v) public {
        vm.recordLogs();

        emit EncodeLog2_address(t, v);

        emitter.log(EncodeLog2_address.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_address(address t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_address(t);

        emitter.log(EncodeLog2WithoutData_address.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes1 (bytes1 v) anonymous;
    event EncodeLog1_bytes1(bytes1 v);
    event EncodeLog2_bytes1(bytes1 indexed t, bytes1 v);
    event EncodeLog2WithoutData_bytes1(bytes1 indexed t);

    function test_EncodeLog0_bytes1(bytes1 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes1(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes1(bytes1 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes1(v);

        emitter.log(EncodeLog1_bytes1.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes1(bytes1 t, bytes1 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes1(t, v);

        emitter.log(EncodeLog2_bytes1.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes1(bytes1 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes1(t);

        emitter.log(EncodeLog2WithoutData_bytes1.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes2 (bytes2 v) anonymous;
    event EncodeLog1_bytes2(bytes2 v);
    event EncodeLog2_bytes2(bytes2 indexed t, bytes2 v);
    event EncodeLog2WithoutData_bytes2(bytes2 indexed t);

    function test_EncodeLog0_bytes2(bytes2 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes2(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes2(bytes2 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes2(v);

        emitter.log(EncodeLog1_bytes2.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes2(bytes2 t, bytes2 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes2(t, v);

        emitter.log(EncodeLog2_bytes2.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes2(bytes2 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes2(t);

        emitter.log(EncodeLog2WithoutData_bytes2.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes3 (bytes3 v) anonymous;
    event EncodeLog1_bytes3(bytes3 v);
    event EncodeLog2_bytes3(bytes3 indexed t, bytes3 v);
    event EncodeLog2WithoutData_bytes3(bytes3 indexed t);

    function test_EncodeLog0_bytes3(bytes3 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes3(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes3(bytes3 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes3(v);

        emitter.log(EncodeLog1_bytes3.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes3(bytes3 t, bytes3 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes3(t, v);

        emitter.log(EncodeLog2_bytes3.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes3(bytes3 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes3(t);

        emitter.log(EncodeLog2WithoutData_bytes3.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes4 (bytes4 v) anonymous;
    event EncodeLog1_bytes4(bytes4 v);
    event EncodeLog2_bytes4(bytes4 indexed t, bytes4 v);
    event EncodeLog2WithoutData_bytes4(bytes4 indexed t);

    function test_EncodeLog0_bytes4(bytes4 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes4(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes4(bytes4 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes4(v);

        emitter.log(EncodeLog1_bytes4.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes4(bytes4 t, bytes4 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes4(t, v);

        emitter.log(EncodeLog2_bytes4.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes4(bytes4 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes4(t);

        emitter.log(EncodeLog2WithoutData_bytes4.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes5 (bytes5 v) anonymous;
    event EncodeLog1_bytes5(bytes5 v);
    event EncodeLog2_bytes5(bytes5 indexed t, bytes5 v);
    event EncodeLog2WithoutData_bytes5(bytes5 indexed t);

    function test_EncodeLog0_bytes5(bytes5 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes5(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes5(bytes5 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes5(v);

        emitter.log(EncodeLog1_bytes5.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes5(bytes5 t, bytes5 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes5(t, v);

        emitter.log(EncodeLog2_bytes5.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes5(bytes5 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes5(t);

        emitter.log(EncodeLog2WithoutData_bytes5.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes6 (bytes6 v) anonymous;
    event EncodeLog1_bytes6(bytes6 v);
    event EncodeLog2_bytes6(bytes6 indexed t, bytes6 v);
    event EncodeLog2WithoutData_bytes6(bytes6 indexed t);

    function test_EncodeLog0_bytes6(bytes6 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes6(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes6(bytes6 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes6(v);

        emitter.log(EncodeLog1_bytes6.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes6(bytes6 t, bytes6 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes6(t, v);

        emitter.log(EncodeLog2_bytes6.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes6(bytes6 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes6(t);

        emitter.log(EncodeLog2WithoutData_bytes6.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes7 (bytes7 v) anonymous;
    event EncodeLog1_bytes7(bytes7 v);
    event EncodeLog2_bytes7(bytes7 indexed t, bytes7 v);
    event EncodeLog2WithoutData_bytes7(bytes7 indexed t);

    function test_EncodeLog0_bytes7(bytes7 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes7(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes7(bytes7 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes7(v);

        emitter.log(EncodeLog1_bytes7.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes7(bytes7 t, bytes7 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes7(t, v);

        emitter.log(EncodeLog2_bytes7.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes7(bytes7 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes7(t);

        emitter.log(EncodeLog2WithoutData_bytes7.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes8 (bytes8 v) anonymous;
    event EncodeLog1_bytes8(bytes8 v);
    event EncodeLog2_bytes8(bytes8 indexed t, bytes8 v);
    event EncodeLog2WithoutData_bytes8(bytes8 indexed t);

    function test_EncodeLog0_bytes8(bytes8 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes8(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes8(bytes8 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes8(v);

        emitter.log(EncodeLog1_bytes8.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes8(bytes8 t, bytes8 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes8(t, v);

        emitter.log(EncodeLog2_bytes8.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes8(bytes8 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes8(t);

        emitter.log(EncodeLog2WithoutData_bytes8.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes9 (bytes9 v) anonymous;
    event EncodeLog1_bytes9(bytes9 v);
    event EncodeLog2_bytes9(bytes9 indexed t, bytes9 v);
    event EncodeLog2WithoutData_bytes9(bytes9 indexed t);

    function test_EncodeLog0_bytes9(bytes9 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes9(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes9(bytes9 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes9(v);

        emitter.log(EncodeLog1_bytes9.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes9(bytes9 t, bytes9 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes9(t, v);

        emitter.log(EncodeLog2_bytes9.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes9(bytes9 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes9(t);

        emitter.log(EncodeLog2WithoutData_bytes9.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes10 (bytes10 v) anonymous;
    event EncodeLog1_bytes10(bytes10 v);
    event EncodeLog2_bytes10(bytes10 indexed t, bytes10 v);
    event EncodeLog2WithoutData_bytes10(bytes10 indexed t);

    function test_EncodeLog0_bytes10(bytes10 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes10(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes10(bytes10 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes10(v);

        emitter.log(EncodeLog1_bytes10.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes10(bytes10 t, bytes10 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes10(t, v);

        emitter.log(EncodeLog2_bytes10.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes10(bytes10 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes10(t);

        emitter.log(EncodeLog2WithoutData_bytes10.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes11 (bytes11 v) anonymous;
    event EncodeLog1_bytes11(bytes11 v);
    event EncodeLog2_bytes11(bytes11 indexed t, bytes11 v);
    event EncodeLog2WithoutData_bytes11(bytes11 indexed t);

    function test_EncodeLog0_bytes11(bytes11 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes11(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes11(bytes11 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes11(v);

        emitter.log(EncodeLog1_bytes11.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes11(bytes11 t, bytes11 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes11(t, v);

        emitter.log(EncodeLog2_bytes11.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes11(bytes11 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes11(t);

        emitter.log(EncodeLog2WithoutData_bytes11.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes12 (bytes12 v) anonymous;
    event EncodeLog1_bytes12(bytes12 v);
    event EncodeLog2_bytes12(bytes12 indexed t, bytes12 v);
    event EncodeLog2WithoutData_bytes12(bytes12 indexed t);

    function test_EncodeLog0_bytes12(bytes12 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes12(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes12(bytes12 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes12(v);

        emitter.log(EncodeLog1_bytes12.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes12(bytes12 t, bytes12 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes12(t, v);

        emitter.log(EncodeLog2_bytes12.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes12(bytes12 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes12(t);

        emitter.log(EncodeLog2WithoutData_bytes12.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes13 (bytes13 v) anonymous;
    event EncodeLog1_bytes13(bytes13 v);
    event EncodeLog2_bytes13(bytes13 indexed t, bytes13 v);
    event EncodeLog2WithoutData_bytes13(bytes13 indexed t);

    function test_EncodeLog0_bytes13(bytes13 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes13(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes13(bytes13 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes13(v);

        emitter.log(EncodeLog1_bytes13.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes13(bytes13 t, bytes13 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes13(t, v);

        emitter.log(EncodeLog2_bytes13.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes13(bytes13 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes13(t);

        emitter.log(EncodeLog2WithoutData_bytes13.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes14 (bytes14 v) anonymous;
    event EncodeLog1_bytes14(bytes14 v);
    event EncodeLog2_bytes14(bytes14 indexed t, bytes14 v);
    event EncodeLog2WithoutData_bytes14(bytes14 indexed t);

    function test_EncodeLog0_bytes14(bytes14 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes14(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes14(bytes14 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes14(v);

        emitter.log(EncodeLog1_bytes14.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes14(bytes14 t, bytes14 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes14(t, v);

        emitter.log(EncodeLog2_bytes14.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes14(bytes14 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes14(t);

        emitter.log(EncodeLog2WithoutData_bytes14.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes15 (bytes15 v) anonymous;
    event EncodeLog1_bytes15(bytes15 v);
    event EncodeLog2_bytes15(bytes15 indexed t, bytes15 v);
    event EncodeLog2WithoutData_bytes15(bytes15 indexed t);

    function test_EncodeLog0_bytes15(bytes15 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes15(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes15(bytes15 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes15(v);

        emitter.log(EncodeLog1_bytes15.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes15(bytes15 t, bytes15 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes15(t, v);

        emitter.log(EncodeLog2_bytes15.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes15(bytes15 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes15(t);

        emitter.log(EncodeLog2WithoutData_bytes15.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes16 (bytes16 v) anonymous;
    event EncodeLog1_bytes16(bytes16 v);
    event EncodeLog2_bytes16(bytes16 indexed t, bytes16 v);
    event EncodeLog2WithoutData_bytes16(bytes16 indexed t);

    function test_EncodeLog0_bytes16(bytes16 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes16(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes16(bytes16 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes16(v);

        emitter.log(EncodeLog1_bytes16.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes16(bytes16 t, bytes16 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes16(t, v);

        emitter.log(EncodeLog2_bytes16.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes16(bytes16 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes16(t);

        emitter.log(EncodeLog2WithoutData_bytes16.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes17 (bytes17 v) anonymous;
    event EncodeLog1_bytes17(bytes17 v);
    event EncodeLog2_bytes17(bytes17 indexed t, bytes17 v);
    event EncodeLog2WithoutData_bytes17(bytes17 indexed t);

    function test_EncodeLog0_bytes17(bytes17 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes17(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes17(bytes17 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes17(v);

        emitter.log(EncodeLog1_bytes17.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes17(bytes17 t, bytes17 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes17(t, v);

        emitter.log(EncodeLog2_bytes17.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes17(bytes17 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes17(t);

        emitter.log(EncodeLog2WithoutData_bytes17.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes18 (bytes18 v) anonymous;
    event EncodeLog1_bytes18(bytes18 v);
    event EncodeLog2_bytes18(bytes18 indexed t, bytes18 v);
    event EncodeLog2WithoutData_bytes18(bytes18 indexed t);

    function test_EncodeLog0_bytes18(bytes18 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes18(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes18(bytes18 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes18(v);

        emitter.log(EncodeLog1_bytes18.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes18(bytes18 t, bytes18 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes18(t, v);

        emitter.log(EncodeLog2_bytes18.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes18(bytes18 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes18(t);

        emitter.log(EncodeLog2WithoutData_bytes18.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes19 (bytes19 v) anonymous;
    event EncodeLog1_bytes19(bytes19 v);
    event EncodeLog2_bytes19(bytes19 indexed t, bytes19 v);
    event EncodeLog2WithoutData_bytes19(bytes19 indexed t);

    function test_EncodeLog0_bytes19(bytes19 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes19(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes19(bytes19 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes19(v);

        emitter.log(EncodeLog1_bytes19.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes19(bytes19 t, bytes19 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes19(t, v);

        emitter.log(EncodeLog2_bytes19.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes19(bytes19 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes19(t);

        emitter.log(EncodeLog2WithoutData_bytes19.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes20 (bytes20 v) anonymous;
    event EncodeLog1_bytes20(bytes20 v);
    event EncodeLog2_bytes20(bytes20 indexed t, bytes20 v);
    event EncodeLog2WithoutData_bytes20(bytes20 indexed t);

    function test_EncodeLog0_bytes20(bytes20 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes20(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes20(bytes20 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes20(v);

        emitter.log(EncodeLog1_bytes20.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes20(bytes20 t, bytes20 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes20(t, v);

        emitter.log(EncodeLog2_bytes20.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes20(bytes20 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes20(t);

        emitter.log(EncodeLog2WithoutData_bytes20.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes21 (bytes21 v) anonymous;
    event EncodeLog1_bytes21(bytes21 v);
    event EncodeLog2_bytes21(bytes21 indexed t, bytes21 v);
    event EncodeLog2WithoutData_bytes21(bytes21 indexed t);

    function test_EncodeLog0_bytes21(bytes21 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes21(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes21(bytes21 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes21(v);

        emitter.log(EncodeLog1_bytes21.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes21(bytes21 t, bytes21 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes21(t, v);

        emitter.log(EncodeLog2_bytes21.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes21(bytes21 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes21(t);

        emitter.log(EncodeLog2WithoutData_bytes21.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes22 (bytes22 v) anonymous;
    event EncodeLog1_bytes22(bytes22 v);
    event EncodeLog2_bytes22(bytes22 indexed t, bytes22 v);
    event EncodeLog2WithoutData_bytes22(bytes22 indexed t);

    function test_EncodeLog0_bytes22(bytes22 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes22(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes22(bytes22 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes22(v);

        emitter.log(EncodeLog1_bytes22.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes22(bytes22 t, bytes22 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes22(t, v);

        emitter.log(EncodeLog2_bytes22.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes22(bytes22 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes22(t);

        emitter.log(EncodeLog2WithoutData_bytes22.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes23 (bytes23 v) anonymous;
    event EncodeLog1_bytes23(bytes23 v);
    event EncodeLog2_bytes23(bytes23 indexed t, bytes23 v);
    event EncodeLog2WithoutData_bytes23(bytes23 indexed t);

    function test_EncodeLog0_bytes23(bytes23 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes23(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes23(bytes23 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes23(v);

        emitter.log(EncodeLog1_bytes23.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes23(bytes23 t, bytes23 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes23(t, v);

        emitter.log(EncodeLog2_bytes23.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes23(bytes23 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes23(t);

        emitter.log(EncodeLog2WithoutData_bytes23.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes24 (bytes24 v) anonymous;
    event EncodeLog1_bytes24(bytes24 v);
    event EncodeLog2_bytes24(bytes24 indexed t, bytes24 v);
    event EncodeLog2WithoutData_bytes24(bytes24 indexed t);

    function test_EncodeLog0_bytes24(bytes24 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes24(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes24(bytes24 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes24(v);

        emitter.log(EncodeLog1_bytes24.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes24(bytes24 t, bytes24 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes24(t, v);

        emitter.log(EncodeLog2_bytes24.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes24(bytes24 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes24(t);

        emitter.log(EncodeLog2WithoutData_bytes24.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes25 (bytes25 v) anonymous;
    event EncodeLog1_bytes25(bytes25 v);
    event EncodeLog2_bytes25(bytes25 indexed t, bytes25 v);
    event EncodeLog2WithoutData_bytes25(bytes25 indexed t);

    function test_EncodeLog0_bytes25(bytes25 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes25(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes25(bytes25 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes25(v);

        emitter.log(EncodeLog1_bytes25.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes25(bytes25 t, bytes25 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes25(t, v);

        emitter.log(EncodeLog2_bytes25.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes25(bytes25 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes25(t);

        emitter.log(EncodeLog2WithoutData_bytes25.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes26 (bytes26 v) anonymous;
    event EncodeLog1_bytes26(bytes26 v);
    event EncodeLog2_bytes26(bytes26 indexed t, bytes26 v);
    event EncodeLog2WithoutData_bytes26(bytes26 indexed t);

    function test_EncodeLog0_bytes26(bytes26 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes26(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes26(bytes26 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes26(v);

        emitter.log(EncodeLog1_bytes26.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes26(bytes26 t, bytes26 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes26(t, v);

        emitter.log(EncodeLog2_bytes26.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes26(bytes26 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes26(t);

        emitter.log(EncodeLog2WithoutData_bytes26.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes27 (bytes27 v) anonymous;
    event EncodeLog1_bytes27(bytes27 v);
    event EncodeLog2_bytes27(bytes27 indexed t, bytes27 v);
    event EncodeLog2WithoutData_bytes27(bytes27 indexed t);

    function test_EncodeLog0_bytes27(bytes27 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes27(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes27(bytes27 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes27(v);

        emitter.log(EncodeLog1_bytes27.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes27(bytes27 t, bytes27 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes27(t, v);

        emitter.log(EncodeLog2_bytes27.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes27(bytes27 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes27(t);

        emitter.log(EncodeLog2WithoutData_bytes27.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes28 (bytes28 v) anonymous;
    event EncodeLog1_bytes28(bytes28 v);
    event EncodeLog2_bytes28(bytes28 indexed t, bytes28 v);
    event EncodeLog2WithoutData_bytes28(bytes28 indexed t);

    function test_EncodeLog0_bytes28(bytes28 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes28(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes28(bytes28 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes28(v);

        emitter.log(EncodeLog1_bytes28.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes28(bytes28 t, bytes28 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes28(t, v);

        emitter.log(EncodeLog2_bytes28.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes28(bytes28 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes28(t);

        emitter.log(EncodeLog2WithoutData_bytes28.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes29 (bytes29 v) anonymous;
    event EncodeLog1_bytes29(bytes29 v);
    event EncodeLog2_bytes29(bytes29 indexed t, bytes29 v);
    event EncodeLog2WithoutData_bytes29(bytes29 indexed t);

    function test_EncodeLog0_bytes29(bytes29 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes29(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes29(bytes29 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes29(v);

        emitter.log(EncodeLog1_bytes29.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes29(bytes29 t, bytes29 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes29(t, v);

        emitter.log(EncodeLog2_bytes29.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes29(bytes29 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes29(t);

        emitter.log(EncodeLog2WithoutData_bytes29.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes30 (bytes30 v) anonymous;
    event EncodeLog1_bytes30(bytes30 v);
    event EncodeLog2_bytes30(bytes30 indexed t, bytes30 v);
    event EncodeLog2WithoutData_bytes30(bytes30 indexed t);

    function test_EncodeLog0_bytes30(bytes30 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes30(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes30(bytes30 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes30(v);

        emitter.log(EncodeLog1_bytes30.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes30(bytes30 t, bytes30 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes30(t, v);

        emitter.log(EncodeLog2_bytes30.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes30(bytes30 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes30(t);

        emitter.log(EncodeLog2WithoutData_bytes30.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes31 (bytes31 v) anonymous;
    event EncodeLog1_bytes31(bytes31 v);
    event EncodeLog2_bytes31(bytes31 indexed t, bytes31 v);
    event EncodeLog2WithoutData_bytes31(bytes31 indexed t);

    function test_EncodeLog0_bytes31(bytes31 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes31(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes31(bytes31 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes31(v);

        emitter.log(EncodeLog1_bytes31.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes31(bytes31 t, bytes31 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes31(t, v);

        emitter.log(EncodeLog2_bytes31.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes31(bytes31 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes31(t);

        emitter.log(EncodeLog2WithoutData_bytes31.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_bytes32 (bytes32 v) anonymous;
    event EncodeLog1_bytes32(bytes32 v);
    event EncodeLog2_bytes32(bytes32 indexed t, bytes32 v);
    event EncodeLog2WithoutData_bytes32(bytes32 indexed t);

    function test_EncodeLog0_bytes32(bytes32 v) public {
        vm.recordLogs();

        emit EncodeLog0_bytes32(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_bytes32(bytes32 v) public {
        vm.recordLogs();

        emit EncodeLog1_bytes32(v);

        emitter.log(EncodeLog1_bytes32.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_bytes32(bytes32 t, bytes32 v) public {
        vm.recordLogs();

        emit EncodeLog2_bytes32(t, v);

        emitter.log(EncodeLog2_bytes32.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_bytes32(bytes32 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_bytes32(t);

        emitter.log(EncodeLog2WithoutData_bytes32.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint8 (uint8 v) anonymous;
    event EncodeLog1_uint8(uint8 v);
    event EncodeLog2_uint8(uint8 indexed t, uint8 v);
    event EncodeLog2WithoutData_uint8(uint8 indexed t);

    function test_EncodeLog0_uint8(uint8 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint8(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint8(uint8 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint8(v);

        emitter.log(EncodeLog1_uint8.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint8(uint8 t, uint8 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint8(t, v);

        emitter.log(EncodeLog2_uint8.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint8(uint8 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint8(t);

        emitter.log(EncodeLog2WithoutData_uint8.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint16 (uint16 v) anonymous;
    event EncodeLog1_uint16(uint16 v);
    event EncodeLog2_uint16(uint16 indexed t, uint16 v);
    event EncodeLog2WithoutData_uint16(uint16 indexed t);

    function test_EncodeLog0_uint16(uint16 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint16(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint16(uint16 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint16(v);

        emitter.log(EncodeLog1_uint16.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint16(uint16 t, uint16 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint16(t, v);

        emitter.log(EncodeLog2_uint16.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint16(uint16 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint16(t);

        emitter.log(EncodeLog2WithoutData_uint16.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint24 (uint24 v) anonymous;
    event EncodeLog1_uint24(uint24 v);
    event EncodeLog2_uint24(uint24 indexed t, uint24 v);
    event EncodeLog2WithoutData_uint24(uint24 indexed t);

    function test_EncodeLog0_uint24(uint24 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint24(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint24(uint24 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint24(v);

        emitter.log(EncodeLog1_uint24.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint24(uint24 t, uint24 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint24(t, v);

        emitter.log(EncodeLog2_uint24.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint24(uint24 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint24(t);

        emitter.log(EncodeLog2WithoutData_uint24.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint32 (uint32 v) anonymous;
    event EncodeLog1_uint32(uint32 v);
    event EncodeLog2_uint32(uint32 indexed t, uint32 v);
    event EncodeLog2WithoutData_uint32(uint32 indexed t);

    function test_EncodeLog0_uint32(uint32 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint32(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint32(uint32 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint32(v);

        emitter.log(EncodeLog1_uint32.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint32(uint32 t, uint32 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint32(t, v);

        emitter.log(EncodeLog2_uint32.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint32(uint32 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint32(t);

        emitter.log(EncodeLog2WithoutData_uint32.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint40 (uint40 v) anonymous;
    event EncodeLog1_uint40(uint40 v);
    event EncodeLog2_uint40(uint40 indexed t, uint40 v);
    event EncodeLog2WithoutData_uint40(uint40 indexed t);

    function test_EncodeLog0_uint40(uint40 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint40(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint40(uint40 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint40(v);

        emitter.log(EncodeLog1_uint40.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint40(uint40 t, uint40 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint40(t, v);

        emitter.log(EncodeLog2_uint40.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint40(uint40 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint40(t);

        emitter.log(EncodeLog2WithoutData_uint40.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint48 (uint48 v) anonymous;
    event EncodeLog1_uint48(uint48 v);
    event EncodeLog2_uint48(uint48 indexed t, uint48 v);
    event EncodeLog2WithoutData_uint48(uint48 indexed t);

    function test_EncodeLog0_uint48(uint48 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint48(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint48(uint48 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint48(v);

        emitter.log(EncodeLog1_uint48.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint48(uint48 t, uint48 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint48(t, v);

        emitter.log(EncodeLog2_uint48.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint48(uint48 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint48(t);

        emitter.log(EncodeLog2WithoutData_uint48.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint56 (uint56 v) anonymous;
    event EncodeLog1_uint56(uint56 v);
    event EncodeLog2_uint56(uint56 indexed t, uint56 v);
    event EncodeLog2WithoutData_uint56(uint56 indexed t);

    function test_EncodeLog0_uint56(uint56 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint56(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint56(uint56 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint56(v);

        emitter.log(EncodeLog1_uint56.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint56(uint56 t, uint56 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint56(t, v);

        emitter.log(EncodeLog2_uint56.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint56(uint56 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint56(t);

        emitter.log(EncodeLog2WithoutData_uint56.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint64 (uint64 v) anonymous;
    event EncodeLog1_uint64(uint64 v);
    event EncodeLog2_uint64(uint64 indexed t, uint64 v);
    event EncodeLog2WithoutData_uint64(uint64 indexed t);

    function test_EncodeLog0_uint64(uint64 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint64(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint64(uint64 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint64(v);

        emitter.log(EncodeLog1_uint64.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint64(uint64 t, uint64 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint64(t, v);

        emitter.log(EncodeLog2_uint64.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint64(uint64 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint64(t);

        emitter.log(EncodeLog2WithoutData_uint64.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint72 (uint72 v) anonymous;
    event EncodeLog1_uint72(uint72 v);
    event EncodeLog2_uint72(uint72 indexed t, uint72 v);
    event EncodeLog2WithoutData_uint72(uint72 indexed t);

    function test_EncodeLog0_uint72(uint72 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint72(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint72(uint72 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint72(v);

        emitter.log(EncodeLog1_uint72.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint72(uint72 t, uint72 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint72(t, v);

        emitter.log(EncodeLog2_uint72.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint72(uint72 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint72(t);

        emitter.log(EncodeLog2WithoutData_uint72.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint80 (uint80 v) anonymous;
    event EncodeLog1_uint80(uint80 v);
    event EncodeLog2_uint80(uint80 indexed t, uint80 v);
    event EncodeLog2WithoutData_uint80(uint80 indexed t);

    function test_EncodeLog0_uint80(uint80 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint80(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint80(uint80 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint80(v);

        emitter.log(EncodeLog1_uint80.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint80(uint80 t, uint80 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint80(t, v);

        emitter.log(EncodeLog2_uint80.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint80(uint80 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint80(t);

        emitter.log(EncodeLog2WithoutData_uint80.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint88 (uint88 v) anonymous;
    event EncodeLog1_uint88(uint88 v);
    event EncodeLog2_uint88(uint88 indexed t, uint88 v);
    event EncodeLog2WithoutData_uint88(uint88 indexed t);

    function test_EncodeLog0_uint88(uint88 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint88(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint88(uint88 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint88(v);

        emitter.log(EncodeLog1_uint88.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint88(uint88 t, uint88 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint88(t, v);

        emitter.log(EncodeLog2_uint88.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint88(uint88 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint88(t);

        emitter.log(EncodeLog2WithoutData_uint88.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint96 (uint96 v) anonymous;
    event EncodeLog1_uint96(uint96 v);
    event EncodeLog2_uint96(uint96 indexed t, uint96 v);
    event EncodeLog2WithoutData_uint96(uint96 indexed t);

    function test_EncodeLog0_uint96(uint96 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint96(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint96(uint96 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint96(v);

        emitter.log(EncodeLog1_uint96.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint96(uint96 t, uint96 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint96(t, v);

        emitter.log(EncodeLog2_uint96.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint96(uint96 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint96(t);

        emitter.log(EncodeLog2WithoutData_uint96.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint104 (uint104 v) anonymous;
    event EncodeLog1_uint104(uint104 v);
    event EncodeLog2_uint104(uint104 indexed t, uint104 v);
    event EncodeLog2WithoutData_uint104(uint104 indexed t);

    function test_EncodeLog0_uint104(uint104 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint104(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint104(uint104 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint104(v);

        emitter.log(EncodeLog1_uint104.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint104(uint104 t, uint104 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint104(t, v);

        emitter.log(EncodeLog2_uint104.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint104(uint104 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint104(t);

        emitter.log(EncodeLog2WithoutData_uint104.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint112 (uint112 v) anonymous;
    event EncodeLog1_uint112(uint112 v);
    event EncodeLog2_uint112(uint112 indexed t, uint112 v);
    event EncodeLog2WithoutData_uint112(uint112 indexed t);

    function test_EncodeLog0_uint112(uint112 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint112(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint112(uint112 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint112(v);

        emitter.log(EncodeLog1_uint112.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint112(uint112 t, uint112 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint112(t, v);

        emitter.log(EncodeLog2_uint112.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint112(uint112 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint112(t);

        emitter.log(EncodeLog2WithoutData_uint112.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint120 (uint120 v) anonymous;
    event EncodeLog1_uint120(uint120 v);
    event EncodeLog2_uint120(uint120 indexed t, uint120 v);
    event EncodeLog2WithoutData_uint120(uint120 indexed t);

    function test_EncodeLog0_uint120(uint120 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint120(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint120(uint120 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint120(v);

        emitter.log(EncodeLog1_uint120.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint120(uint120 t, uint120 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint120(t, v);

        emitter.log(EncodeLog2_uint120.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint120(uint120 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint120(t);

        emitter.log(EncodeLog2WithoutData_uint120.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint128 (uint128 v) anonymous;
    event EncodeLog1_uint128(uint128 v);
    event EncodeLog2_uint128(uint128 indexed t, uint128 v);
    event EncodeLog2WithoutData_uint128(uint128 indexed t);

    function test_EncodeLog0_uint128(uint128 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint128(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint128(uint128 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint128(v);

        emitter.log(EncodeLog1_uint128.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint128(uint128 t, uint128 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint128(t, v);

        emitter.log(EncodeLog2_uint128.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint128(uint128 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint128(t);

        emitter.log(EncodeLog2WithoutData_uint128.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint136 (uint136 v) anonymous;
    event EncodeLog1_uint136(uint136 v);
    event EncodeLog2_uint136(uint136 indexed t, uint136 v);
    event EncodeLog2WithoutData_uint136(uint136 indexed t);

    function test_EncodeLog0_uint136(uint136 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint136(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint136(uint136 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint136(v);

        emitter.log(EncodeLog1_uint136.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint136(uint136 t, uint136 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint136(t, v);

        emitter.log(EncodeLog2_uint136.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint136(uint136 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint136(t);

        emitter.log(EncodeLog2WithoutData_uint136.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint144 (uint144 v) anonymous;
    event EncodeLog1_uint144(uint144 v);
    event EncodeLog2_uint144(uint144 indexed t, uint144 v);
    event EncodeLog2WithoutData_uint144(uint144 indexed t);

    function test_EncodeLog0_uint144(uint144 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint144(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint144(uint144 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint144(v);

        emitter.log(EncodeLog1_uint144.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint144(uint144 t, uint144 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint144(t, v);

        emitter.log(EncodeLog2_uint144.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint144(uint144 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint144(t);

        emitter.log(EncodeLog2WithoutData_uint144.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint152 (uint152 v) anonymous;
    event EncodeLog1_uint152(uint152 v);
    event EncodeLog2_uint152(uint152 indexed t, uint152 v);
    event EncodeLog2WithoutData_uint152(uint152 indexed t);

    function test_EncodeLog0_uint152(uint152 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint152(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint152(uint152 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint152(v);

        emitter.log(EncodeLog1_uint152.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint152(uint152 t, uint152 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint152(t, v);

        emitter.log(EncodeLog2_uint152.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint152(uint152 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint152(t);

        emitter.log(EncodeLog2WithoutData_uint152.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint160 (uint160 v) anonymous;
    event EncodeLog1_uint160(uint160 v);
    event EncodeLog2_uint160(uint160 indexed t, uint160 v);
    event EncodeLog2WithoutData_uint160(uint160 indexed t);

    function test_EncodeLog0_uint160(uint160 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint160(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint160(uint160 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint160(v);

        emitter.log(EncodeLog1_uint160.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint160(uint160 t, uint160 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint160(t, v);

        emitter.log(EncodeLog2_uint160.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint160(uint160 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint160(t);

        emitter.log(EncodeLog2WithoutData_uint160.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint168 (uint168 v) anonymous;
    event EncodeLog1_uint168(uint168 v);
    event EncodeLog2_uint168(uint168 indexed t, uint168 v);
    event EncodeLog2WithoutData_uint168(uint168 indexed t);

    function test_EncodeLog0_uint168(uint168 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint168(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint168(uint168 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint168(v);

        emitter.log(EncodeLog1_uint168.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint168(uint168 t, uint168 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint168(t, v);

        emitter.log(EncodeLog2_uint168.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint168(uint168 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint168(t);

        emitter.log(EncodeLog2WithoutData_uint168.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint176 (uint176 v) anonymous;
    event EncodeLog1_uint176(uint176 v);
    event EncodeLog2_uint176(uint176 indexed t, uint176 v);
    event EncodeLog2WithoutData_uint176(uint176 indexed t);

    function test_EncodeLog0_uint176(uint176 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint176(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint176(uint176 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint176(v);

        emitter.log(EncodeLog1_uint176.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint176(uint176 t, uint176 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint176(t, v);

        emitter.log(EncodeLog2_uint176.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint176(uint176 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint176(t);

        emitter.log(EncodeLog2WithoutData_uint176.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint184 (uint184 v) anonymous;
    event EncodeLog1_uint184(uint184 v);
    event EncodeLog2_uint184(uint184 indexed t, uint184 v);
    event EncodeLog2WithoutData_uint184(uint184 indexed t);

    function test_EncodeLog0_uint184(uint184 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint184(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint184(uint184 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint184(v);

        emitter.log(EncodeLog1_uint184.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint184(uint184 t, uint184 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint184(t, v);

        emitter.log(EncodeLog2_uint184.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint184(uint184 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint184(t);

        emitter.log(EncodeLog2WithoutData_uint184.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint192 (uint192 v) anonymous;
    event EncodeLog1_uint192(uint192 v);
    event EncodeLog2_uint192(uint192 indexed t, uint192 v);
    event EncodeLog2WithoutData_uint192(uint192 indexed t);

    function test_EncodeLog0_uint192(uint192 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint192(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint192(uint192 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint192(v);

        emitter.log(EncodeLog1_uint192.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint192(uint192 t, uint192 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint192(t, v);

        emitter.log(EncodeLog2_uint192.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint192(uint192 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint192(t);

        emitter.log(EncodeLog2WithoutData_uint192.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint200 (uint200 v) anonymous;
    event EncodeLog1_uint200(uint200 v);
    event EncodeLog2_uint200(uint200 indexed t, uint200 v);
    event EncodeLog2WithoutData_uint200(uint200 indexed t);

    function test_EncodeLog0_uint200(uint200 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint200(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint200(uint200 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint200(v);

        emitter.log(EncodeLog1_uint200.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint200(uint200 t, uint200 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint200(t, v);

        emitter.log(EncodeLog2_uint200.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint200(uint200 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint200(t);

        emitter.log(EncodeLog2WithoutData_uint200.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint208 (uint208 v) anonymous;
    event EncodeLog1_uint208(uint208 v);
    event EncodeLog2_uint208(uint208 indexed t, uint208 v);
    event EncodeLog2WithoutData_uint208(uint208 indexed t);

    function test_EncodeLog0_uint208(uint208 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint208(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint208(uint208 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint208(v);

        emitter.log(EncodeLog1_uint208.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint208(uint208 t, uint208 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint208(t, v);

        emitter.log(EncodeLog2_uint208.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint208(uint208 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint208(t);

        emitter.log(EncodeLog2WithoutData_uint208.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint216 (uint216 v) anonymous;
    event EncodeLog1_uint216(uint216 v);
    event EncodeLog2_uint216(uint216 indexed t, uint216 v);
    event EncodeLog2WithoutData_uint216(uint216 indexed t);

    function test_EncodeLog0_uint216(uint216 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint216(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint216(uint216 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint216(v);

        emitter.log(EncodeLog1_uint216.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint216(uint216 t, uint216 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint216(t, v);

        emitter.log(EncodeLog2_uint216.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint216(uint216 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint216(t);

        emitter.log(EncodeLog2WithoutData_uint216.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint224 (uint224 v) anonymous;
    event EncodeLog1_uint224(uint224 v);
    event EncodeLog2_uint224(uint224 indexed t, uint224 v);
    event EncodeLog2WithoutData_uint224(uint224 indexed t);

    function test_EncodeLog0_uint224(uint224 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint224(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint224(uint224 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint224(v);

        emitter.log(EncodeLog1_uint224.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint224(uint224 t, uint224 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint224(t, v);

        emitter.log(EncodeLog2_uint224.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint224(uint224 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint224(t);

        emitter.log(EncodeLog2WithoutData_uint224.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint232 (uint232 v) anonymous;
    event EncodeLog1_uint232(uint232 v);
    event EncodeLog2_uint232(uint232 indexed t, uint232 v);
    event EncodeLog2WithoutData_uint232(uint232 indexed t);

    function test_EncodeLog0_uint232(uint232 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint232(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint232(uint232 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint232(v);

        emitter.log(EncodeLog1_uint232.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint232(uint232 t, uint232 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint232(t, v);

        emitter.log(EncodeLog2_uint232.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint232(uint232 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint232(t);

        emitter.log(EncodeLog2WithoutData_uint232.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint240 (uint240 v) anonymous;
    event EncodeLog1_uint240(uint240 v);
    event EncodeLog2_uint240(uint240 indexed t, uint240 v);
    event EncodeLog2WithoutData_uint240(uint240 indexed t);

    function test_EncodeLog0_uint240(uint240 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint240(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint240(uint240 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint240(v);

        emitter.log(EncodeLog1_uint240.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint240(uint240 t, uint240 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint240(t, v);

        emitter.log(EncodeLog2_uint240.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint240(uint240 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint240(t);

        emitter.log(EncodeLog2WithoutData_uint240.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint248 (uint248 v) anonymous;
    event EncodeLog1_uint248(uint248 v);
    event EncodeLog2_uint248(uint248 indexed t, uint248 v);
    event EncodeLog2WithoutData_uint248(uint248 indexed t);

    function test_EncodeLog0_uint248(uint248 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint248(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint248(uint248 v) public {
        vm.recordLogs();

        emit EncodeLog1_uint248(v);

        emitter.log(EncodeLog1_uint248.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_uint248(uint248 t, uint248 v) public {
        vm.recordLogs();

        emit EncodeLog2_uint248(t, v);

        emitter.log(EncodeLog2_uint248.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_uint248(uint248 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint248(t);

        emitter.log(EncodeLog2WithoutData_uint248.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_uint256 (uint256 v) anonymous;
    event EncodeLog1_uint256(uint256 v);
    event EncodeLog2_uint256(uint256 indexed t, uint256 v);
    event EncodeLog2WithoutData_uint256(uint256 indexed t);

    function test_EncodeLog0_uint256(uint256 v) public {
        vm.recordLogs();

        emit EncodeLog0_uint256(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_uint256(uint256 v) public {
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

    function test_EncodeLog2_uint256(uint256 t, uint256 v) public {
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

    function test_EncodeLog2WithoutData_uint256(uint256 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_uint256(t);

        emitter.log(EncodeLog2WithoutData_uint256.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int8 (int8 v) anonymous;
    event EncodeLog1_int8(int8 v);
    event EncodeLog2_int8(int8 indexed t, int8 v);
    event EncodeLog2WithoutData_int8(int8 indexed t);

    function test_EncodeLog0_int8(int8 v) public {
        vm.recordLogs();

        emit EncodeLog0_int8(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int8(int8 v) public {
        vm.recordLogs();

        emit EncodeLog1_int8(v);

        emitter.log(EncodeLog1_int8.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int8(int8 t, int8 v) public {
        vm.recordLogs();

        emit EncodeLog2_int8(t, v);

        emitter.log(EncodeLog2_int8.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int8(int8 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int8(t);

        emitter.log(EncodeLog2WithoutData_int8.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int16 (int16 v) anonymous;
    event EncodeLog1_int16(int16 v);
    event EncodeLog2_int16(int16 indexed t, int16 v);
    event EncodeLog2WithoutData_int16(int16 indexed t);

    function test_EncodeLog0_int16(int16 v) public {
        vm.recordLogs();

        emit EncodeLog0_int16(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int16(int16 v) public {
        vm.recordLogs();

        emit EncodeLog1_int16(v);

        emitter.log(EncodeLog1_int16.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int16(int16 t, int16 v) public {
        vm.recordLogs();

        emit EncodeLog2_int16(t, v);

        emitter.log(EncodeLog2_int16.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int16(int16 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int16(t);

        emitter.log(EncodeLog2WithoutData_int16.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int24 (int24 v) anonymous;
    event EncodeLog1_int24(int24 v);
    event EncodeLog2_int24(int24 indexed t, int24 v);
    event EncodeLog2WithoutData_int24(int24 indexed t);

    function test_EncodeLog0_int24(int24 v) public {
        vm.recordLogs();

        emit EncodeLog0_int24(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int24(int24 v) public {
        vm.recordLogs();

        emit EncodeLog1_int24(v);

        emitter.log(EncodeLog1_int24.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int24(int24 t, int24 v) public {
        vm.recordLogs();

        emit EncodeLog2_int24(t, v);

        emitter.log(EncodeLog2_int24.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int24(int24 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int24(t);

        emitter.log(EncodeLog2WithoutData_int24.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int32 (int32 v) anonymous;
    event EncodeLog1_int32(int32 v);
    event EncodeLog2_int32(int32 indexed t, int32 v);
    event EncodeLog2WithoutData_int32(int32 indexed t);

    function test_EncodeLog0_int32(int32 v) public {
        vm.recordLogs();

        emit EncodeLog0_int32(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int32(int32 v) public {
        vm.recordLogs();

        emit EncodeLog1_int32(v);

        emitter.log(EncodeLog1_int32.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int32(int32 t, int32 v) public {
        vm.recordLogs();

        emit EncodeLog2_int32(t, v);

        emitter.log(EncodeLog2_int32.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int32(int32 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int32(t);

        emitter.log(EncodeLog2WithoutData_int32.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int40 (int40 v) anonymous;
    event EncodeLog1_int40(int40 v);
    event EncodeLog2_int40(int40 indexed t, int40 v);
    event EncodeLog2WithoutData_int40(int40 indexed t);

    function test_EncodeLog0_int40(int40 v) public {
        vm.recordLogs();

        emit EncodeLog0_int40(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int40(int40 v) public {
        vm.recordLogs();

        emit EncodeLog1_int40(v);

        emitter.log(EncodeLog1_int40.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int40(int40 t, int40 v) public {
        vm.recordLogs();

        emit EncodeLog2_int40(t, v);

        emitter.log(EncodeLog2_int40.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int40(int40 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int40(t);

        emitter.log(EncodeLog2WithoutData_int40.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int48 (int48 v) anonymous;
    event EncodeLog1_int48(int48 v);
    event EncodeLog2_int48(int48 indexed t, int48 v);
    event EncodeLog2WithoutData_int48(int48 indexed t);

    function test_EncodeLog0_int48(int48 v) public {
        vm.recordLogs();

        emit EncodeLog0_int48(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int48(int48 v) public {
        vm.recordLogs();

        emit EncodeLog1_int48(v);

        emitter.log(EncodeLog1_int48.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int48(int48 t, int48 v) public {
        vm.recordLogs();

        emit EncodeLog2_int48(t, v);

        emitter.log(EncodeLog2_int48.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int48(int48 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int48(t);

        emitter.log(EncodeLog2WithoutData_int48.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int56 (int56 v) anonymous;
    event EncodeLog1_int56(int56 v);
    event EncodeLog2_int56(int56 indexed t, int56 v);
    event EncodeLog2WithoutData_int56(int56 indexed t);

    function test_EncodeLog0_int56(int56 v) public {
        vm.recordLogs();

        emit EncodeLog0_int56(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int56(int56 v) public {
        vm.recordLogs();

        emit EncodeLog1_int56(v);

        emitter.log(EncodeLog1_int56.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int56(int56 t, int56 v) public {
        vm.recordLogs();

        emit EncodeLog2_int56(t, v);

        emitter.log(EncodeLog2_int56.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int56(int56 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int56(t);

        emitter.log(EncodeLog2WithoutData_int56.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int64 (int64 v) anonymous;
    event EncodeLog1_int64(int64 v);
    event EncodeLog2_int64(int64 indexed t, int64 v);
    event EncodeLog2WithoutData_int64(int64 indexed t);

    function test_EncodeLog0_int64(int64 v) public {
        vm.recordLogs();

        emit EncodeLog0_int64(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int64(int64 v) public {
        vm.recordLogs();

        emit EncodeLog1_int64(v);

        emitter.log(EncodeLog1_int64.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int64(int64 t, int64 v) public {
        vm.recordLogs();

        emit EncodeLog2_int64(t, v);

        emitter.log(EncodeLog2_int64.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int64(int64 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int64(t);

        emitter.log(EncodeLog2WithoutData_int64.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int72 (int72 v) anonymous;
    event EncodeLog1_int72(int72 v);
    event EncodeLog2_int72(int72 indexed t, int72 v);
    event EncodeLog2WithoutData_int72(int72 indexed t);

    function test_EncodeLog0_int72(int72 v) public {
        vm.recordLogs();

        emit EncodeLog0_int72(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int72(int72 v) public {
        vm.recordLogs();

        emit EncodeLog1_int72(v);

        emitter.log(EncodeLog1_int72.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int72(int72 t, int72 v) public {
        vm.recordLogs();

        emit EncodeLog2_int72(t, v);

        emitter.log(EncodeLog2_int72.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int72(int72 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int72(t);

        emitter.log(EncodeLog2WithoutData_int72.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int80 (int80 v) anonymous;
    event EncodeLog1_int80(int80 v);
    event EncodeLog2_int80(int80 indexed t, int80 v);
    event EncodeLog2WithoutData_int80(int80 indexed t);

    function test_EncodeLog0_int80(int80 v) public {
        vm.recordLogs();

        emit EncodeLog0_int80(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int80(int80 v) public {
        vm.recordLogs();

        emit EncodeLog1_int80(v);

        emitter.log(EncodeLog1_int80.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int80(int80 t, int80 v) public {
        vm.recordLogs();

        emit EncodeLog2_int80(t, v);

        emitter.log(EncodeLog2_int80.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int80(int80 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int80(t);

        emitter.log(EncodeLog2WithoutData_int80.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int88 (int88 v) anonymous;
    event EncodeLog1_int88(int88 v);
    event EncodeLog2_int88(int88 indexed t, int88 v);
    event EncodeLog2WithoutData_int88(int88 indexed t);

    function test_EncodeLog0_int88(int88 v) public {
        vm.recordLogs();

        emit EncodeLog0_int88(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int88(int88 v) public {
        vm.recordLogs();

        emit EncodeLog1_int88(v);

        emitter.log(EncodeLog1_int88.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int88(int88 t, int88 v) public {
        vm.recordLogs();

        emit EncodeLog2_int88(t, v);

        emitter.log(EncodeLog2_int88.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int88(int88 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int88(t);

        emitter.log(EncodeLog2WithoutData_int88.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int96 (int96 v) anonymous;
    event EncodeLog1_int96(int96 v);
    event EncodeLog2_int96(int96 indexed t, int96 v);
    event EncodeLog2WithoutData_int96(int96 indexed t);

    function test_EncodeLog0_int96(int96 v) public {
        vm.recordLogs();

        emit EncodeLog0_int96(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int96(int96 v) public {
        vm.recordLogs();

        emit EncodeLog1_int96(v);

        emitter.log(EncodeLog1_int96.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int96(int96 t, int96 v) public {
        vm.recordLogs();

        emit EncodeLog2_int96(t, v);

        emitter.log(EncodeLog2_int96.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int96(int96 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int96(t);

        emitter.log(EncodeLog2WithoutData_int96.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int104 (int104 v) anonymous;
    event EncodeLog1_int104(int104 v);
    event EncodeLog2_int104(int104 indexed t, int104 v);
    event EncodeLog2WithoutData_int104(int104 indexed t);

    function test_EncodeLog0_int104(int104 v) public {
        vm.recordLogs();

        emit EncodeLog0_int104(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int104(int104 v) public {
        vm.recordLogs();

        emit EncodeLog1_int104(v);

        emitter.log(EncodeLog1_int104.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int104(int104 t, int104 v) public {
        vm.recordLogs();

        emit EncodeLog2_int104(t, v);

        emitter.log(EncodeLog2_int104.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int104(int104 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int104(t);

        emitter.log(EncodeLog2WithoutData_int104.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int112 (int112 v) anonymous;
    event EncodeLog1_int112(int112 v);
    event EncodeLog2_int112(int112 indexed t, int112 v);
    event EncodeLog2WithoutData_int112(int112 indexed t);

    function test_EncodeLog0_int112(int112 v) public {
        vm.recordLogs();

        emit EncodeLog0_int112(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int112(int112 v) public {
        vm.recordLogs();

        emit EncodeLog1_int112(v);

        emitter.log(EncodeLog1_int112.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int112(int112 t, int112 v) public {
        vm.recordLogs();

        emit EncodeLog2_int112(t, v);

        emitter.log(EncodeLog2_int112.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int112(int112 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int112(t);

        emitter.log(EncodeLog2WithoutData_int112.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int120 (int120 v) anonymous;
    event EncodeLog1_int120(int120 v);
    event EncodeLog2_int120(int120 indexed t, int120 v);
    event EncodeLog2WithoutData_int120(int120 indexed t);

    function test_EncodeLog0_int120(int120 v) public {
        vm.recordLogs();

        emit EncodeLog0_int120(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int120(int120 v) public {
        vm.recordLogs();

        emit EncodeLog1_int120(v);

        emitter.log(EncodeLog1_int120.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int120(int120 t, int120 v) public {
        vm.recordLogs();

        emit EncodeLog2_int120(t, v);

        emitter.log(EncodeLog2_int120.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int120(int120 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int120(t);

        emitter.log(EncodeLog2WithoutData_int120.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int128 (int128 v) anonymous;
    event EncodeLog1_int128(int128 v);
    event EncodeLog2_int128(int128 indexed t, int128 v);
    event EncodeLog2WithoutData_int128(int128 indexed t);

    function test_EncodeLog0_int128(int128 v) public {
        vm.recordLogs();

        emit EncodeLog0_int128(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int128(int128 v) public {
        vm.recordLogs();

        emit EncodeLog1_int128(v);

        emitter.log(EncodeLog1_int128.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int128(int128 t, int128 v) public {
        vm.recordLogs();

        emit EncodeLog2_int128(t, v);

        emitter.log(EncodeLog2_int128.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int128(int128 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int128(t);

        emitter.log(EncodeLog2WithoutData_int128.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int136 (int136 v) anonymous;
    event EncodeLog1_int136(int136 v);
    event EncodeLog2_int136(int136 indexed t, int136 v);
    event EncodeLog2WithoutData_int136(int136 indexed t);

    function test_EncodeLog0_int136(int136 v) public {
        vm.recordLogs();

        emit EncodeLog0_int136(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int136(int136 v) public {
        vm.recordLogs();

        emit EncodeLog1_int136(v);

        emitter.log(EncodeLog1_int136.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int136(int136 t, int136 v) public {
        vm.recordLogs();

        emit EncodeLog2_int136(t, v);

        emitter.log(EncodeLog2_int136.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int136(int136 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int136(t);

        emitter.log(EncodeLog2WithoutData_int136.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int144 (int144 v) anonymous;
    event EncodeLog1_int144(int144 v);
    event EncodeLog2_int144(int144 indexed t, int144 v);
    event EncodeLog2WithoutData_int144(int144 indexed t);

    function test_EncodeLog0_int144(int144 v) public {
        vm.recordLogs();

        emit EncodeLog0_int144(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int144(int144 v) public {
        vm.recordLogs();

        emit EncodeLog1_int144(v);

        emitter.log(EncodeLog1_int144.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int144(int144 t, int144 v) public {
        vm.recordLogs();

        emit EncodeLog2_int144(t, v);

        emitter.log(EncodeLog2_int144.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int144(int144 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int144(t);

        emitter.log(EncodeLog2WithoutData_int144.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int152 (int152 v) anonymous;
    event EncodeLog1_int152(int152 v);
    event EncodeLog2_int152(int152 indexed t, int152 v);
    event EncodeLog2WithoutData_int152(int152 indexed t);

    function test_EncodeLog0_int152(int152 v) public {
        vm.recordLogs();

        emit EncodeLog0_int152(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int152(int152 v) public {
        vm.recordLogs();

        emit EncodeLog1_int152(v);

        emitter.log(EncodeLog1_int152.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int152(int152 t, int152 v) public {
        vm.recordLogs();

        emit EncodeLog2_int152(t, v);

        emitter.log(EncodeLog2_int152.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int152(int152 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int152(t);

        emitter.log(EncodeLog2WithoutData_int152.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int160 (int160 v) anonymous;
    event EncodeLog1_int160(int160 v);
    event EncodeLog2_int160(int160 indexed t, int160 v);
    event EncodeLog2WithoutData_int160(int160 indexed t);

    function test_EncodeLog0_int160(int160 v) public {
        vm.recordLogs();

        emit EncodeLog0_int160(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int160(int160 v) public {
        vm.recordLogs();

        emit EncodeLog1_int160(v);

        emitter.log(EncodeLog1_int160.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int160(int160 t, int160 v) public {
        vm.recordLogs();

        emit EncodeLog2_int160(t, v);

        emitter.log(EncodeLog2_int160.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int160(int160 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int160(t);

        emitter.log(EncodeLog2WithoutData_int160.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int168 (int168 v) anonymous;
    event EncodeLog1_int168(int168 v);
    event EncodeLog2_int168(int168 indexed t, int168 v);
    event EncodeLog2WithoutData_int168(int168 indexed t);

    function test_EncodeLog0_int168(int168 v) public {
        vm.recordLogs();

        emit EncodeLog0_int168(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int168(int168 v) public {
        vm.recordLogs();

        emit EncodeLog1_int168(v);

        emitter.log(EncodeLog1_int168.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int168(int168 t, int168 v) public {
        vm.recordLogs();

        emit EncodeLog2_int168(t, v);

        emitter.log(EncodeLog2_int168.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int168(int168 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int168(t);

        emitter.log(EncodeLog2WithoutData_int168.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int176 (int176 v) anonymous;
    event EncodeLog1_int176(int176 v);
    event EncodeLog2_int176(int176 indexed t, int176 v);
    event EncodeLog2WithoutData_int176(int176 indexed t);

    function test_EncodeLog0_int176(int176 v) public {
        vm.recordLogs();

        emit EncodeLog0_int176(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int176(int176 v) public {
        vm.recordLogs();

        emit EncodeLog1_int176(v);

        emitter.log(EncodeLog1_int176.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int176(int176 t, int176 v) public {
        vm.recordLogs();

        emit EncodeLog2_int176(t, v);

        emitter.log(EncodeLog2_int176.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int176(int176 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int176(t);

        emitter.log(EncodeLog2WithoutData_int176.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int184 (int184 v) anonymous;
    event EncodeLog1_int184(int184 v);
    event EncodeLog2_int184(int184 indexed t, int184 v);
    event EncodeLog2WithoutData_int184(int184 indexed t);

    function test_EncodeLog0_int184(int184 v) public {
        vm.recordLogs();

        emit EncodeLog0_int184(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int184(int184 v) public {
        vm.recordLogs();

        emit EncodeLog1_int184(v);

        emitter.log(EncodeLog1_int184.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int184(int184 t, int184 v) public {
        vm.recordLogs();

        emit EncodeLog2_int184(t, v);

        emitter.log(EncodeLog2_int184.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int184(int184 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int184(t);

        emitter.log(EncodeLog2WithoutData_int184.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int192 (int192 v) anonymous;
    event EncodeLog1_int192(int192 v);
    event EncodeLog2_int192(int192 indexed t, int192 v);
    event EncodeLog2WithoutData_int192(int192 indexed t);

    function test_EncodeLog0_int192(int192 v) public {
        vm.recordLogs();

        emit EncodeLog0_int192(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int192(int192 v) public {
        vm.recordLogs();

        emit EncodeLog1_int192(v);

        emitter.log(EncodeLog1_int192.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int192(int192 t, int192 v) public {
        vm.recordLogs();

        emit EncodeLog2_int192(t, v);

        emitter.log(EncodeLog2_int192.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int192(int192 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int192(t);

        emitter.log(EncodeLog2WithoutData_int192.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int200 (int200 v) anonymous;
    event EncodeLog1_int200(int200 v);
    event EncodeLog2_int200(int200 indexed t, int200 v);
    event EncodeLog2WithoutData_int200(int200 indexed t);

    function test_EncodeLog0_int200(int200 v) public {
        vm.recordLogs();

        emit EncodeLog0_int200(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int200(int200 v) public {
        vm.recordLogs();

        emit EncodeLog1_int200(v);

        emitter.log(EncodeLog1_int200.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int200(int200 t, int200 v) public {
        vm.recordLogs();

        emit EncodeLog2_int200(t, v);

        emitter.log(EncodeLog2_int200.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int200(int200 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int200(t);

        emitter.log(EncodeLog2WithoutData_int200.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int208 (int208 v) anonymous;
    event EncodeLog1_int208(int208 v);
    event EncodeLog2_int208(int208 indexed t, int208 v);
    event EncodeLog2WithoutData_int208(int208 indexed t);

    function test_EncodeLog0_int208(int208 v) public {
        vm.recordLogs();

        emit EncodeLog0_int208(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int208(int208 v) public {
        vm.recordLogs();

        emit EncodeLog1_int208(v);

        emitter.log(EncodeLog1_int208.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int208(int208 t, int208 v) public {
        vm.recordLogs();

        emit EncodeLog2_int208(t, v);

        emitter.log(EncodeLog2_int208.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int208(int208 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int208(t);

        emitter.log(EncodeLog2WithoutData_int208.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int216 (int216 v) anonymous;
    event EncodeLog1_int216(int216 v);
    event EncodeLog2_int216(int216 indexed t, int216 v);
    event EncodeLog2WithoutData_int216(int216 indexed t);

    function test_EncodeLog0_int216(int216 v) public {
        vm.recordLogs();

        emit EncodeLog0_int216(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int216(int216 v) public {
        vm.recordLogs();

        emit EncodeLog1_int216(v);

        emitter.log(EncodeLog1_int216.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int216(int216 t, int216 v) public {
        vm.recordLogs();

        emit EncodeLog2_int216(t, v);

        emitter.log(EncodeLog2_int216.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int216(int216 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int216(t);

        emitter.log(EncodeLog2WithoutData_int216.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int224 (int224 v) anonymous;
    event EncodeLog1_int224(int224 v);
    event EncodeLog2_int224(int224 indexed t, int224 v);
    event EncodeLog2WithoutData_int224(int224 indexed t);

    function test_EncodeLog0_int224(int224 v) public {
        vm.recordLogs();

        emit EncodeLog0_int224(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int224(int224 v) public {
        vm.recordLogs();

        emit EncodeLog1_int224(v);

        emitter.log(EncodeLog1_int224.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int224(int224 t, int224 v) public {
        vm.recordLogs();

        emit EncodeLog2_int224(t, v);

        emitter.log(EncodeLog2_int224.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int224(int224 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int224(t);

        emitter.log(EncodeLog2WithoutData_int224.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int232 (int232 v) anonymous;
    event EncodeLog1_int232(int232 v);
    event EncodeLog2_int232(int232 indexed t, int232 v);
    event EncodeLog2WithoutData_int232(int232 indexed t);

    function test_EncodeLog0_int232(int232 v) public {
        vm.recordLogs();

        emit EncodeLog0_int232(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int232(int232 v) public {
        vm.recordLogs();

        emit EncodeLog1_int232(v);

        emitter.log(EncodeLog1_int232.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int232(int232 t, int232 v) public {
        vm.recordLogs();

        emit EncodeLog2_int232(t, v);

        emitter.log(EncodeLog2_int232.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int232(int232 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int232(t);

        emitter.log(EncodeLog2WithoutData_int232.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int240 (int240 v) anonymous;
    event EncodeLog1_int240(int240 v);
    event EncodeLog2_int240(int240 indexed t, int240 v);
    event EncodeLog2WithoutData_int240(int240 indexed t);

    function test_EncodeLog0_int240(int240 v) public {
        vm.recordLogs();

        emit EncodeLog0_int240(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int240(int240 v) public {
        vm.recordLogs();

        emit EncodeLog1_int240(v);

        emitter.log(EncodeLog1_int240.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int240(int240 t, int240 v) public {
        vm.recordLogs();

        emit EncodeLog2_int240(t, v);

        emitter.log(EncodeLog2_int240.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int240(int240 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int240(t);

        emitter.log(EncodeLog2WithoutData_int240.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int248 (int248 v) anonymous;
    event EncodeLog1_int248(int248 v);
    event EncodeLog2_int248(int248 indexed t, int248 v);
    event EncodeLog2WithoutData_int248(int248 indexed t);

    function test_EncodeLog0_int248(int248 v) public {
        vm.recordLogs();

        emit EncodeLog0_int248(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int248(int248 v) public {
        vm.recordLogs();

        emit EncodeLog1_int248(v);

        emitter.log(EncodeLog1_int248.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int248(int248 t, int248 v) public {
        vm.recordLogs();

        emit EncodeLog2_int248(t, v);

        emitter.log(EncodeLog2_int248.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int248(int248 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int248(t);

        emitter.log(EncodeLog2WithoutData_int248.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    event EncodeLog0_int256 (int256 v) anonymous;
    event EncodeLog1_int256(int256 v);
    event EncodeLog2_int256(int256 indexed t, int256 v);
    event EncodeLog2WithoutData_int256(int256 indexed t);

    function test_EncodeLog0_int256(int256 v) public {
        vm.recordLogs();

        emit EncodeLog0_int256(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog1_int256(int256 v) public {
        vm.recordLogs();

        emit EncodeLog1_int256(v);

        emitter.log(EncodeLog1_int256.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2_int256(int256 t, int256 v) public {
        vm.recordLogs();

        emit EncodeLog2_int256(t, v);

        emitter.log(EncodeLog2_int256.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

    function test_EncodeLog2WithoutData_int256(int256 t) public {
        vm.recordLogs();

        emit EncodeLog2WithoutData_int256(t);

        emitter.log(EncodeLog2WithoutData_int256.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }

        assertEq(logs[0].data, logs[1].data);
    }

}
