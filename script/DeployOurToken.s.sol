//SPDX-Identifier-License: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return ourToken;
    }
}
