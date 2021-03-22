pragma solidity =0.5.16;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/math/SafeMath.sol";

library Tool {
    using SafeMath for uint256;

    // nft address tokenId
    function parseDataBuy(bytes memory input, uint256 paramAddr, uint256 paramInt) internal pure returns(address a1, uint256 a2){
        uint256 addrLen = paramAddr;
        uint256 intLen = paramInt;
        uint256 startPos = 1;
        bytes memory _a1 = new bytes(addrLen);
        for(uint i = startPos; i < startPos + addrLen; i ++){
            _a1[i - startPos] = input[i];
        }
        a1 = _bytesToAddress(_a1);

        bytes memory _a2 = new bytes(intLen);
        for(uint i = startPos + addrLen; i < startPos + addrLen + intLen; i ++){
          _a2[i - startPos - addrLen] = input[i];
        }

        a2 = _toUint(_a2);
    }

    function _toUint(bytes memory input) internal pure returns (uint256){
        uint256 x;
        assembly {
            x := mload(add(input, add(0x20, 0)))
        }

        return x;
    }

    function _bytesToAddress(bytes memory bys) internal pure returns(address){
        address addr;
        assembly {
            addr := mload(add(bys, 20))
        }

        return addr;
    }
}
