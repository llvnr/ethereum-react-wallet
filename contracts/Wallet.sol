//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Wallet {
    mapping(address => uint) Wallets; // Lié l'adresse des utilisateurs aux montants qu'ils ont sur leurs comptes.

    function withdrawMoney(address payable _to, uint _amount) external { // Retirer la monnaie.
        require(_amount <= Wallets[msg.sender], "Not enought funds");
        Wallets[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function getBalance() external view returns(uint) { // Obtenir le solde de l'utilisateur.
        return Wallets[msg.sender];
    }

    receive() external payable { // Permet de déposer de l'argent sur le compte.
        Wallets[msg.sender] += msg.value;
    }

    fallback() external payable {

    }

}
