// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/console2.sol";

import "./LogEncoder.sol";

contract LogEmitter {
    using LogEncoder for *;

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

    function log(bytes32 topic1) public {
        assembly {
            log1(0x0, 0x0, topic1)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes memory data) public {
        assembly {
            log2(add(data, 0x20), mload(data), topic1, topic2)
        }
    }

    function log(bytes32 topic1, bytes32 topic2) public {
        assembly {
            log2(0x0, 0x0, topic1, topic2)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes memory data) public
    {
        assembly {
            log3(add(data, 0x20), mload(data), topic1, topic2, topic3)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3) public
    {
        assembly {
            log3(0x0, 0x0, topic1, topic2, topic3)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes32 topic4, bytes memory data) public {
        assembly {
            log4(add(data, 0x20), mload(data), topic1, topic2, topic3, topic4)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes32 topic4) public {
        assembly {
            log4(0x0, 0x0, topic1, topic2, topic3, topic4)
        }
    }

    modifier logCall() {
        _logCall();
        _;
    }

    function _logCall() internal {
        console2.logString("_logCall");
        console2.logBytes(msg.data);
        log(bytes4(msg.data).topic(), msg.data.topic(), msg.data.data());
    }
}