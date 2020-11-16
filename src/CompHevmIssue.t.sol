pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./CompHevmIssue.sol";

interface Hevm {
    function warp(uint256) external;

    function store(
        address,
        bytes32,
        bytes32
    ) external;
}

contract CompHevmIssueTest is DSTest {
    CompHevmIssue issue;
    Hevm public hevm;
    IWETH public weth;

    function setUp() public {
        issue = new CompHevmIssue();

        hevm = Hevm(0x7109709ECfa91a80626fF3989D68f67F5b1DD12D);

        weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);

        hevm.store(
            address(weth),
            keccak256(abi.encode(address(issue), uint256(3))), // Mint us 1000 WETH
            bytes32(uint256(1000 ether))
        );
    }

    function test_supply() public {
        issue.supplyEthToCompound();
    }
}
