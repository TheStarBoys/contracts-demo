// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract LogEncode {
    // Event encoding spec is here:
    // https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#indexed-event-encoding
    // https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#events
    event LogToBeEncoded(address indexed sender, string indexed value, uint256 value1);

    function logToBeEncoded0(string memory _value, uint256 _value1) public {
        emit LogToBeEncoded(msg.sender, _value, _value1);
    }

    function logToBeEncoded1(string memory _value, uint256 _value1) public {
        log(keccak256("LogToBeEncoded(address,string,uint256)"), encode2Topic(msg.sender), encode2Topic(_value), abi.encode(_value1));
    }

    // uintNN / intNN are padded on the left.
    function encode2Topic(address addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    // bytesNN types are padded on the right
    function encode2Topic(bytes8 b) public pure returns (bytes32) {
        return bytes32(b);
    }

    function encode2Topic(uint256 v) public pure returns (bytes32) {
        return bytes32(v);
    }

    // the encoding of a bytes and string value is just the string contents without
    // any padding or length prefix.
    // the encoding of an array (both dynamically- and statically-sized) is
    // the concatenation of the encoding of its elements, always padded to
    // a multiple of 32 bytes (even bytes and string) and without any length prefix
    function encode2Topic(string memory s) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(bytes(s)));
    }

    function encode2Topic(bytes memory b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(b));
    }

    function log(bytes memory data) public {
        assembly {
            log0(add(data, 0x20), mload(data))
        }
    }

    function log(bytes32 topic1, bytes memory data) public {
        assembly {
            log1(add(data, 0x20), mload(data), topic1)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes memory data) public {
        assembly {
            log2(add(data, 0x20), mload(data), topic1, topic2)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes memory data) public
    {
        assembly {
            log3(add(data, 0x20), mload(data), topic1, topic2, topic3)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes32 topic4, bytes memory data) public {
        assembly {
            log4(add(data, 0x20), mload(data), topic1, topic2, topic3, topic4)
        }
    }
}