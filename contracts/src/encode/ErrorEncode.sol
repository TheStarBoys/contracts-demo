// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ErrorEncode {
    error ErrorToBeEncoded(uint256 a, string b, uint256[] c);

    uint256 a;
    string b;
    uint256[] c;

    constructor() {
        a = 123456789;
        b = "Hello, World";
        c.push(1);
        c.push(666666);
    }
    
    function triggerError() public view {
        revert ErrorToBeEncoded(a, b, c);
    }

    function encodeError() public view returns(bytes memory) {
        return abi.encodeWithSignature("ErrorToBeEncoded(uint256,string,uint256[])", a, b, c);
    }

    function triggerErrorByEncoding() public view {
        revert(string(encodeError()));
    }
}