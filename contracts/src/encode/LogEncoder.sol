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

    function topic(bytes32 b) public pure returns (bytes32) {
        return bytes32(b);
    }


    // uintNN / intNN are padded on the left.

    function topic(uint256 v) public pure returns (bytes32) {
        return bytes32(uint256(v));
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

    function data(bytes32 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(uint256 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

    function data(int256 v) public pure returns (bytes memory) {
        return abi.encode(v);
    }

}
