// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract OurToken{

    error InsufficientBalance(uint256 available, uint256 required);

        string public name = "OurToken";
    uint256 public totalSupply = 100000000000000000000;
    uint8 public decimals = 18;

    mapping (address => uint256) private _balances;

    function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
}

function transfer(address recipient, uint256 amount) public returns (bool) {
    uint256 senderBalance = _balances[msg.sender];
    if(senderBalance >= amount){
        revert InsufficientBalance({
            available: senderBalance,
            required: amount
        });
    }
    _balances[msg.sender] = senderBalance - amount;
    _balances[recipient] += amount;

    return true;
}

}