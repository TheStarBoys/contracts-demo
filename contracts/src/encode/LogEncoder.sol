// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Event encoding spec is here:
// https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#indexed-event-encoding
// https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#events
library LogEncoder {    
    function topic(address addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function topic(bool v) public pure returns(bytes32) {
        return bytes32(uint(v ? 1 : 0));
    }

    // the encoding of a bytes and string value is just the string contents without
    // any padding or length prefix.
    // the encoding of an array (both dynamically- and statically-sized) is
    // the concatenation of the encoding of its elements, always padded to
    // a multiple of 32 bytes (even bytes and string) and without any length prefix
    function topic(string calldata s) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(bytes(s)));
    }

    function topic(bytes calldata b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(b));
    }

    // bytesNN types are padded on the right

    function topic(bytes1 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes2 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes3 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes4 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes5 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes6 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes7 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes8 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes9 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes10 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes11 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes12 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes13 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes14 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes15 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes16 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes17 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes18 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes19 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes20 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes21 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes22 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes23 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes24 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes25 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes26 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes27 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes28 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes29 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes30 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes31 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function topic(bytes32 b) public pure returns (bytes32) {
        return bytes32(b);
    }


    // uintNN / intNN are padded on the left.

    function topic(uint8 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint16 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint24 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint32 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint40 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint48 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint56 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint64 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint72 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint80 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint88 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint96 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint104 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint112 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint120 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint128 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint136 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint144 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint152 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint160 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint168 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint176 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint184 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint192 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint200 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint208 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint216 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint224 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint232 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint240 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint248 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }

    function topic(uint256 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
    }



    function topic(int8 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int16 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int24 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int32 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int40 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int48 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int56 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int64 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int72 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int80 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int88 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int96 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int104 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int112 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int120 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int128 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int136 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int144 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int152 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int160 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int168 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int176 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int184 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int192 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int200 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int208 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int216 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int224 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int232 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int240 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int248 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }

    function topic(int256 v) public pure returns (bytes32) {
        return bytes32(uint256(int256(v)));
    }


    function data(bytes calldata v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(string calldata v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bool v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(address v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes1 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes2 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes3 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes4 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes5 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes6 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes7 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes8 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes9 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes10 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes11 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes12 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes13 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes14 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes15 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes16 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes17 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes18 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes19 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes20 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes21 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes22 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes23 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes24 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes25 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes26 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes27 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes28 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes29 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes30 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes31 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(bytes32 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint8 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint16 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint24 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint32 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint40 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint48 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint56 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint64 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint72 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint80 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint88 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint96 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint104 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint112 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint120 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint128 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint136 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint144 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint152 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint160 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint168 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint176 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint184 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint192 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint200 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint208 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint216 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint224 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint232 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint240 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint248 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint256 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int8 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int16 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int24 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int32 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int40 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int48 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int56 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int64 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int72 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int80 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int88 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int96 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int104 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int112 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int120 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int128 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int136 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int144 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int152 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int160 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int168 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int176 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int184 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int192 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int200 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int208 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int216 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int224 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int232 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int240 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int248 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int256 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

}
