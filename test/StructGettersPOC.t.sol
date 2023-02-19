// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@forge-std/Test.sol";
import "src/StructGettersPOC.sol";

contract StructGettersPOCTest is Test {
    StructGettersPOC private _structGettersPOC;

    function setUp() public {
        _structGettersPOC = new StructGettersPOC();
    }

    function testIndividualGetters() public {
        vm.record();
        uint256 initialGasCost_ = gasleft();
        _structGettersPOC.getA();
        _structGettersPOC.getB();
        _structGettersPOC.getC();
        console.log("Gas cost for getters individually", initialGasCost_ - gasleft());
        (bytes32[] memory reads_, bytes32[] memory writes_) = vm.accesses(address(_structGettersPOC));
        for (uint256 i_ = 0; i_ < reads_.length; i_++) {
            console.log("Read", vm.toString(reads_[i_]));
        }
    }

    function testSingleGetter() public {
        vm.record();
        uint256 initialGasCost_ = gasleft();
        _structGettersPOC.getInfo();
        console.log("Gas cost for a single getter", initialGasCost_ - gasleft());
        (bytes32[] memory reads_, bytes32[] memory writes_) = vm.accesses(address(_structGettersPOC));
        for (uint256 i_ = 0; i_ < reads_.length; i_++) {
            console.log("Read", vm.toString(reads_[i_]));
        }
    }
}
