// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "forge-std/console2.sol";

import "../../src/utils/MemArray.sol";

contract MemArrayTest is Test {
    using MemArray for uint256[];

    function test_Array_PushPop() public {
        uint256[] memory arr;

        arr = arr.push(1);
        _print(arr);

        arr = arr.push(2);
        _print(arr);

        arr = arr.push(3);
        arr = arr.push(4);
        // [1, 2, 3, 4]
        _print(arr);

        arr.pop();
        _print(arr);

        arr = arr.removeFirst();
        _print(arr);
        // [2, 3]
        assertEq(arr.length, 2);
        assertEq(arr[0], 2);
        assertEq(arr[1], 3);
    }

    function test_Array_Remove() public {
        uint256[] memory arr;

        arr = arr.push(1);
        _print(arr);

        arr = arr.push(2);
        _print(arr);

        arr = arr.push(3);
        arr = arr.push(4);
        // [1, 2, 3, 4]
        _print(arr);

        arr.remove(1);
        // [1, 4, 3]
        _print(arr);
        assertEq(arr[0], 1);
        assertEq(arr[1], 4);
        assertEq(arr[2], 3);
    }

    function test_Array_Slice() public {
        uint256[] memory arr;

        arr = arr.push(1);
        _print(arr);

        arr = arr.push(2);
        _print(arr);

        arr = arr.push(3);
        arr = arr.push(4);
        arr = arr.push(5);
        // [1, 2, 3, 4, 5]
        _print(arr);

        arr = arr.slice(2, 4);
        _print(arr);
    }

    function _print(uint256[] memory arr) internal view {
        string memory s = "[";
        for (uint i; i < arr.length; i++) {
            s = string.concat(s, vm.toString(arr[i]));
            if (i != arr.length-1) {
                s = string.concat(s, ", ");
            }
        }

        s = string.concat(s, "]");

        console.logString(s);
    }
}