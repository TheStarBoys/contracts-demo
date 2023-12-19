// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract LogEncode {
    // Event encoding spec is here:
    // https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#indexed-event-encoding
    // https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#events
    event LogToBeEncode(address indexed sender, string indexed value, uint256 value1);

    function logToBeEncode0(string memory _value, uint256 _value1) public {
        emit LogToBeEncode(msg.sender, _value, _value1);
    }

    function logToBeEncode1(string memory _value, uint256 _value1) public {
        log(keccak256("LogToBeEncode(address,string,uint256)"), encode2Bytes32(msg.sender), encode2Bytes32(_value), abi.encode(_value1));
    }

    function encode2Bytes32(address addr) public pure returns (bytes32) {
        return bytes32(uint256(uint160(addr)));
    }

    function encode2Bytes32(uint256 v) public pure returns (bytes32) {
        return bytes32(v);
    }

    function encode2Bytes32(string memory s) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(bytes(s)));
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