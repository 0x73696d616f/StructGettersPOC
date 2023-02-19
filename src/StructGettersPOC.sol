// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StructGettersPOC {
    struct Info {
        uint256 a;
        uint256 b;
        uint256 c;
    }

    mapping (uint256 => Info) public infos;

    constructor() {
        infos[0] = Info(1, 2, 3);
    }

    function getA() public view returns (uint256) {
        return infos[0].a;
    }

    function getB() public view returns (uint256) {
        return infos[0].b;
    }

    function getC() public view returns (uint256) {
        return infos[0].c;
    }

    function getInfo() public view returns (Info memory) {
        return infos[0];
    }
}
