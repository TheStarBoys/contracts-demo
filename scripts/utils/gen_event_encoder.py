# Please run the script on the root of the project.
using_for = []

types = ["bytes", "string", "bool", "address"]

bytes_funcs = ["bytes" + str(n) for n in range(1, 33)]
types += bytes_funcs

bytes_funcs = map(lambda v: '''
    function topic({} b) public pure returns (bytes32) {{
        return bytes32(b);
    }}
'''.format(v), bytes_funcs)

bytes_funcs = ''.join(bytes_funcs)
# print(bytes_funcs)

uint_funcs = ["uint" + str(8*step) for step in range(1, 33)]
types += uint_funcs

uint_funcs = map(lambda v: '''
    function topic({} v) public pure returns (bytes32) {{
        return bytes32(uint256(v));
    }}
'''.format(v), uint_funcs)

uint_funcs = ''.join(uint_funcs)

int_funcs = ["int" + str(8*step) for step in range(1, 33)]
types += int_funcs

int_funcs = map(lambda v: '''
    function topic({} v) public pure returns (bytes32) {{
        return bytes32(uint256(int256(v)));
    }}
'''.format(v), int_funcs)

int_funcs = ''.join(int_funcs)

# print(int_funcs)
using_for += types
using_for = '\n'.join(['using LogEncoder for {} global;'.format(v) for v in using_for])
# print(using_for)

data_funcs = map(lambda v: '''
    function data({} v) public pure returns (bytes memory) {{
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
    function topic(address addr) public pure returns (bytes32) {{
        return bytes32(uint256(uint160(addr)));
    }}

    function topic(bool v) public pure returns(bytes32) {{
        return bytes32(uint(v ? 1 : 0));
    }}

    // the encoding of a bytes and string value is just the string contents without
    // any padding or length prefix.
    // the encoding of an array (both dynamically- and statically-sized) is
    // the concatenation of the encoding of its elements, always padded to
    // a multiple of 32 bytes (even bytes and string) and without any length prefix
    function topic(string calldata s) public pure returns (bytes32) {{
        return keccak256(abi.encodePacked(bytes(s)));
    }}

    function topic(bytes calldata b) public pure returns (bytes32) {{
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
print(os.path.abspath("contracts/src/encode/LogEncoder.sol"))
with open(os.path.abspath("contracts/src/encode/LogEncoder.sol"), "w") as f:
    f.write(contract_str)