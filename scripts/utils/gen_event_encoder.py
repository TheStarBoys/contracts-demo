# Please run the script on the root of the project.
import sys

gen_contract_or_tests = int(sys.argv[1]) # 0 for contract, 1 for tests

if gen_contract_or_tests not in [0, 1]:
    print(f'not supporting {gen_contract_or_tests}, 0 for contract, 1 for tests')
    exit()


type_start = 32 if gen_contract_or_tests == 0 else 1
using_for = []

types = ["bytes", "string", "bool", "address"]

# We dont need to generate so much functions when using `using for LogEncoder for *`
bytes_funcs = ["bytes" + str(n) for n in range(type_start, 33)]
# bytes_funcs = ["bytes" + str(n) for n in range(32, 33)]

types += bytes_funcs

bytes_funcs = map(lambda v: '''
    function topic({} b) internal pure returns (bytes32) {{
        return bytes32(b);
    }}
'''.format(v), bytes_funcs)

bytes_funcs = ''.join(bytes_funcs)
# print(bytes_funcs)

uint_funcs = ["uint" + str(8*step) for step in range(type_start, 33)]
# uint_funcs = ["uint" + str(8*step) for step in range(32, 33)]

types += uint_funcs

uint_funcs = map(lambda v: '''
    function topic({} v) internal pure returns (bytes32) {{
        return bytes32(uint256(v));
    }}
'''.format(v), uint_funcs)

uint_funcs = ''.join(uint_funcs)

int_funcs = ["int" + str(8*step) for step in range(type_start, 33)]
# int_funcs = ["int" + str(8*step) for step in range(32, 33)]

types += int_funcs
arguments_types = [v + " calldata" if 'bytes' == v or 'string' == v else v for v in types]

int_funcs = map(lambda v: '''
    function topic({} v) internal pure returns (bytes32) {{
        return bytes32(uint256(int256(v)));
    }}
'''.format(v), int_funcs)

int_funcs = ''.join(int_funcs)

# print(int_funcs)
using_for += types
using_for = '\n'.join(['using LogEncoder for {} global;'.format(v) for v in using_for])
# print(using_for)

data_funcs = map(lambda v: '''
    function data({} v) internal pure returns (bytes memory) {{
        return abi.encode(v);
    }}
'''.format(v + " calldata" if 'bytes' == v or 'string' == v else v), types)
data_funcs = ''.join(data_funcs)

contract_str = '''// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Event encoding spec is here:
// https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#indexed-event-encoding
// https://docs.soliditylang.org/en/v0.8.23/abi-spec.html#events
library LogEncoder {{    
    function topic(address addr) internal pure returns (bytes32) {{
        return bytes32(uint256(uint160(addr)));
    }}

    function topic(bool v) internal pure returns(bytes32) {{
        return bytes32(uint(v ? 1 : 0));
    }}

    // the encoding of a bytes and string value is just the string contents without
    // any padding or length prefix.
    // the encoding of an array (both dynamically- and statically-sized) is
    // the concatenation of the encoding of its elements, always padded to
    // a multiple of 32 bytes (even bytes and string) and without any length prefix
    function topic(string memory s) internal pure returns (bytes32) {{
        return keccak256(abi.encodePacked(bytes(s)));
    }}

    function topic(bytes memory b) internal pure returns (bytes32) {{
        return keccak256(abi.encodePacked(b));
    }}

    // bytesNN types are padded on the right
{}

    // uintNN / intNN are padded on the left.
{}

{}
{}
}}
'''.format(bytes_funcs, uint_funcs, int_funcs, data_funcs)

# print(contract_str)

import os

if gen_contract_or_tests == 0:
    # print(os.path.abspath("contracts/src/encode/LogEncoder.sol"))
    with open(os.path.abspath("contracts/src/encode/LogEncoder.sol"), "w") as f:
        f.write(contract_str)

test_funcs = map(lambda v: f"""
    event EncodeLog0_{v[0]} ({v[0]} v) anonymous;
    event EncodeLog1_{v[0]}({v[0]} v);
    event EncodeLog2_{v[0]}({v[0]} indexed t, {v[0]} v);
    event EncodeLog2WithoutData_{v[0]}({v[0]} indexed t);

    function test_EncodeLog0_{v[0]}({v[1]} v) public {{
        vm.recordLogs();

        emit EncodeLog0_{v[0]}(v);

        emitter.log( v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        assertEq(logs[0].data, logs[1].data);
    }}

    function test_EncodeLog1_{v[0]}({v[1]} v) public {{
        vm.recordLogs();

        emit EncodeLog1_{v[0]}(v);

        emitter.log(EncodeLog1_{v[0]}.selector, v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {{
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }}

        assertEq(logs[0].data, logs[1].data);
    }}

    function test_EncodeLog2_{v[0]}({v[1]} t, {v[1]} v) public {{
        vm.recordLogs();

        emit EncodeLog2_{v[0]}(t, v);

        emitter.log(EncodeLog2_{v[0]}.selector, t.topic(), v.data());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {{
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }}

        assertEq(logs[0].data, logs[1].data);
    }}

    function test_EncodeLog2WithoutData_{v[0]}({v[1]} t) public {{
        vm.recordLogs();

        emit EncodeLog2WithoutData_{v[0]}(t);

        emitter.log(EncodeLog2WithoutData_{v[0]}.selector, t.topic());

        Vm.Log[] memory logs = vm.getRecordedLogs();
        assertEq(logs.length, 2);
        for (uint i; i < logs[0].topics.length; i++) {{
            assertEq(logs[0].topics[i], logs[1].topics[i]);
        }}

        assertEq(logs[0].data, logs[1].data);
    }}
""", [(types[i], arguments_types[i]) for i in range(len(types))])

test_funcs = ''.join(test_funcs)

# print(test_funcs)

test_contract = f"""
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import {{Vm}} from "forge-std/Vm.sol";

import "../../src/encode/LogEmitter.sol";
import "../../src/encode/LogEncoder.sol";

contract LogEncoderTest is Test {{
    using LogEncoder for *;

    LogEmitter emitter;

    function setUp() public {{
        emitter = new LogEmitter();
    }}

    {test_funcs}
}}
"""

if gen_contract_or_tests == 1:
    with open(os.path.abspath("contracts/test/encode/LogEncoder.t.sol"), "w") as f:
        f.write(test_contract)