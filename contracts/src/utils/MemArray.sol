// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

library MemArray {
    function setLength(uint256[] memory arr, uint256 newLength) internal pure returns(uint256[] memory) {
        assembly {
            let length := mload(arr)
            mstore(arr, newLength)
        }

        return arr;
    }
    
    function push(uint256[] memory arr, uint256 element) internal pure returns(uint256[] memory) {
        uint oldLen = arr.length;
        assembly {
            let length := mload(arr)
            mstore(arr, add(length, 1))
        }

        arr[arr.length-1] = element;
        assert(oldLen + 1 == arr.length);
        assert(arr[arr.length-1] == element);

        return arr;
    }

    function pop(uint256[] memory arr) internal pure returns(uint256 v, bool success) {
        if (arr.length == 0)
            return (0, false);
        
        v = arr[arr.length-1];

        assembly {
            let length := mload(arr)
            mstore(arr, sub(length, 1))
        }
    }

    function removeFirst(uint256[] memory arr) internal pure returns(uint256[] memory) {
        assembly {
            let length := mload(arr)
            arr := add(arr, 0x20)
            mstore(arr, sub(length, 1))
        }
        return arr;
    }

    function remove(uint256[] memory arr, uint256 index) internal pure returns(uint256[] memory) {
        arr[index] = arr[arr.length-1];
        pop(arr);
        return arr;
    }

    function equal(uint256[] memory arr, uint256[] memory arr1) internal pure returns(bool) {
        if (arr.length != arr1.length) return false;

        for (uint i; i < arr.length; i++) {
            if (arr[i] != arr1[i]) {
                return false;
            }
        }

        return true;
    }

    function slice(uint256[] memory arr, uint256 start, uint256 end) internal pure returns(uint256[] memory) {
        require(start <= end, "invalid start or end");
        require(end <= arr.length, "out of range");

        uint256 length = end - start;

        assembly {
            let pos := add(arr, mul(start, 0x20))
            mstore(pos, length)
            arr := pos
        }

        return arr;
    }
}