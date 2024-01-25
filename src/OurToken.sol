// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
    error InsufficientBalance(uint256 available, uint256 required);

    string public _name = "OurToken";
    string public _symbol = "OT";

    uint256 public _totalSupply = 100000000000000000000;

    mapping(address => uint256) private _balances;

    constructor(uint256 initialSupply) ERC20(_name, _symbol) {
        _mint(msg.sender, initialSupply);
    }
}
