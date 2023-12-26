// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract LogEmitter {
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