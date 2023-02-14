// Tract ID Smart Contract

// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.0;

contract TractID {

    // Declare variables to store information about the Tract ID
    string public lac; // Land Area Code - identifies the state and county where the land is located
    string public sfx; // SFX - identifies the type of land (e.g., trust land, fee land, or restricted land)
    string public plant; // Principal Meridian and Base Line - used to establish a geographic location
    uint public section; // Section - identifies the specific location of the land within a particular area
    uint public township; // Township - identifies the specific location of the land within a particular area
    uint public range; // Range - identifies the specific location of the land within a particular area
    address public owner; // The address of the current owner of the Tract ID

    // Event to track changes to the owner of the Tract ID
    event OwnershipChanged(address indexed previousOwner, address indexed newOwner);

    // Constructor function to set the initial values of the Tract ID
    constructor(string memory _lac, string memory _sfx, string memory _plant, uint _section, uint _township, uint _range, address _owner) {
        lac = _lac;
        sfx = _sfx;
        plant = _plant;
        section = _section;
        township = _township;
        range = _range;
        owner = _owner;
    }

    // Modifier to ensure that only the current owner of the Tract ID can make changes to it
    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can make changes to the Tract ID");
        _;
    }

    // Function to transfer ownership of the Tract ID to a new owner
    function transferOwnership(address newOwner) public onlyOwner {
        address previousOwner = owner;
        owner = newOwner;
        emit OwnershipChanged(previousOwner, newOwner);
    }
}
