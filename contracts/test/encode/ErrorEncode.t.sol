// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import {Vm} from "forge-std/Vm.sol";

import "../../src/encode/ErrorEncode.sol";

contract ErrorEncodeTest is Test {
    error ErrorToBeEncoded(uint256 a, string b, uint256[] c);

    ErrorEncode errEncode;

    function setUp() public {
        errEncode = new ErrorEncode();
    }

    function testFuzz_Encode(uint256 _a, string memory _b, uint256[] memory _c) public {
        errEncode.initialize(_a, _b, _c);
        vm.expectRevert(errEncode.encodeError());
        errEncode.triggerError();

        vm.expectRevert(errEncode.encodeError());
        errEncode.triggerErrorByEncoding();
    }
}