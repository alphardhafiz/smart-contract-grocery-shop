// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
// time 12:49
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


}