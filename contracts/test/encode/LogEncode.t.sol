// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import {Vm} from "forge-std/Vm.sol";

import "../../src/encode/LogEncode.sol";

contract LogEncodeTest is Test {
    LogEncode logEncode;

    event LogToBeEncoded(address indexed sender, string indexed value, uint256 value1);

    function setUp() public {
        logEncode = new LogEncode();
    }

    function test_Encode(string memory v0, uint v1) public {
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
}