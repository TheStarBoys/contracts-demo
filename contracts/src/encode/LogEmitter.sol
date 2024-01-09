// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/console2.sol";

import "./LogEncoder.sol";

contract LogEmitter {
    using LogEncoder for *;

    event LogCall(bytes4 indexed selector, bytes indexed dataTopic, bytes data) anonymous; // anonymous `LogCall` for general log encoding.

    function log(bytes memory data) public {
        _beforeLog();

        assembly {
            log0(add(data, 0x20), mload(data))
        }
    }

    function log(bytes32 topic1, bytes memory data) public {
        _beforeLog();

        assembly {
            log1(add(data, 0x20), mload(data), topic1)
        }
    }

    function log(bytes32 topic1) public {
        _beforeLog();

        assembly {
            log1(0x0, 0x0, topic1)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes memory data) public {
        _beforeLog();

        assembly {
            log2(add(data, 0x20), mload(data), topic1, topic2)
        }
    }

    function log(bytes32 topic1, bytes32 topic2) public {
        _beforeLog();

        assembly {
            log2(0x0, 0x0, topic1, topic2)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes memory data) public
    {
        _beforeLog();

        assembly {
            log3(add(data, 0x20), mload(data), topic1, topic2, topic3)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3) public
    {
        _beforeLog();

        assembly {
            log3(0x0, 0x0, topic1, topic2, topic3)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes32 topic4, bytes memory data) public {
        _beforeLog();

        assembly {
            log4(add(data, 0x20), mload(data), topic1, topic2, topic3, topic4)
        }
    }

    function log(bytes32 topic1, bytes32 topic2, bytes32 topic3, bytes32 topic4) public {
        _beforeLog();

        assembly {
            log4(0x0, 0x0, topic1, topic2, topic3, topic4)
        }
    }

    // `_beforeLog` hook chould be used for validating authorization.
    function _beforeLog() internal virtual {}

    modifier logCall() {
        _logCall();
        _;
    }

    function _logCall() internal {
        // Not equal to:
        // emit LogCall(bytes4(msg.data), msg.data, msg.data);
        // But we could make use of the event definition to easily use log filter.

        // Because we expect to decode function params directly from msg.data instead from `abi.encode(msg.data)`

        // For Example:
        // `emit LogCall(bytes4(msg.data), msg.data, msg.data)` === `log(bytes4(msg.data).topic(), msg.data.topic(), msg.data.data())`;

        log(bytes4(msg.data).topic(), msg.data.topic(), msg.data);
    }
}