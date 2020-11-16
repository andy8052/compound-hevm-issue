pragma solidity ^0.6.7;

import "ds-test/test.sol";

import "./CompHevmIssue.sol";

contract CompHevmIssueTest is DSTest {
    CompHevmIssue issue;

    function setUp() public {
        issue = new CompHevmIssue();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
