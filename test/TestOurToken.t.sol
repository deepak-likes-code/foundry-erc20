//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract TestOurToken is Test {
    OurToken public ourToken;
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 STARTING_BALANCE = 100 ether;

    function setUp() external {
        DeployOurToken deployOurToken = new DeployOurToken();
        ourToken = deployOurToken.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        console.log("bob balance: %s", ourToken.balanceOf(bob));

        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE);
    }
}
