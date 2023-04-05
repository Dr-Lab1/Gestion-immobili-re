// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import './isOwner.sol';

contract immo is isOwner{

    uint cptr;

    enum typeBien {Maison, Appartement, Voiture, Telephone}

    struct bien {
        uint id;
        string name;
        uint price;
        typeBien _typeBien;
    }

    mapping (address => bien []) Avoirs;

    function addBiens (address _proprietaire, string memory _name, uint _price, typeBien _typeBien) public _isOwner {
        require (_price > 1000, 'Le prix ne peut etre moins de 1000 wei');
        require (uint(_typeBien) >= 0, 'Le _type varie entre 0 et 3');
        require (uint(_typeBien) <= 3, 'Le _type varie entre 0 et 3');

        Avoirs [_proprietaire].push(bien(cptr, _name, _price, _typeBien));

        cptr;
    }

    function getBiens (address _proprietaire) public view _isOwner returns (bien [] memory) {
        return Avoirs [_proprietaire];
    }

    function getNbreBiens (address _proprietaire) public view _isOwner returns (uint) {
        return Avoirs [_proprietaire].length;
    }

    function getMesBiens () public view returns (bien [] memory) {
        return Avoirs [msg.sender];
    }

}