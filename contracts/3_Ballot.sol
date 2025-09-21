// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
// time 22:11
contract GroceryShop {
    address public owner;
    uint256 public purchaseId; // id counter

    struct Grocery{
        string name;
        uint256 numberOfItems;
    }

    enum GroceryType {
        Milk,
        Bread,
        Egg
    }

    struct PurchaceDetail {
        address buyer;
        GroceryType itemType;
        uint256 numberOfItemsBought;
    }

    mapping(GroceryType => Grocery) public groceryItem;
    mapping(uint256 => PurchaceDetail) public purchaseReceipt;

    constructor() {
        groceryItem[GroceryType.Bread] = Grocery("Roti", 10);
        groceryItem[GroceryType.Milk] = Grocery("Susu", 10);
        groceryItem[GroceryType.Egg] = Grocery("Telur", 10);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call function.");
        _;
    }

    modifier numberChecking(uint256 number) {
        require(number > 0, "Must be at least 1");
        _;
    }

    function add(GroceryType _groceryType, uint _numberAdded) public onlyOwner numberChecking(_numberAdded) {
        groceryItem[_groceryType].numberOfItems += _numberAdded;
    }
}