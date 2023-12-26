// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ErrorEncode {
    error ErrorToBeEncoded(uint256 a, string b, uint256[] c);

    uint256 a;
    string b;
    uint256[] c;

    function initialize(uint256 _a, string memory _b, uint256[] memory _c) public {
        a = _a;
        b = _b;
        c = _c;
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