// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    struct Contact {
        uint id;
        string firstName;
        string lastName;
        uint[] phoneNumbers;
    }

    mapping(uint => Contact) private contacts;
    uint private nextId = 1;

    error ContactNotFound(uint id);

    constructor(address initialOwner) Ownable(initialOwner) {}

    function addContact(string memory _firstName, string memory _lastName, uint[] memory _phoneNumbers) external onlyOwner {
        contacts[nextId] = Contact(nextId, _firstName, _lastName, _phoneNumbers);
        nextId++;
    }

    function deleteContact(uint _id) external onlyOwner {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        delete contacts[_id];
    }

    function getContact(uint _id) external view returns (Contact memory) {
        if (contacts[_id].id == 0) revert ContactNotFound(_id);
        return contacts[_id];
    }

    function getAllContacts() external view returns (Contact[] memory) {
        Contact[] memory allContacts = new Contact[](nextId - 1);
        uint index = 0;
        for (uint i = 1; i < nextId; i++) {
            if (contacts[i].id != 0) {
                allContacts[index] = contacts[i];
                index++;
            }
        }
        return allContacts;
    }
}

contract AddressBookFactory {
    function deploy() external returns (AddressBook) {
        AddressBook newAddressBook = new AddressBook(msg.sender);
        return newAddressBook;
    }
}
