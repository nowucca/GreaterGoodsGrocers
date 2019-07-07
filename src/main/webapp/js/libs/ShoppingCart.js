/*

An associative array of ShoppingCartItem, where the key is the product identifier.

 */

import {ShoppingCartItem} from './ShoppingCartItem.js';

import {toInt, SiteConfig, shrunkenAssociativeArray } from './helper.js';

class ShoppingCart {

    constructor() {
        this.items = [];   /* Array of Shopping Cart Item */
        this.numberOfItems = 0;
        this.total = 0;
        this._type = "ShoppingCart";
    }

    /**
     * Adds a <code>ShoppingCartItem</code> to the <code>ShoppingCart</code>'s
     * <code>items</code> list. If item of the specified <code>product</code>
     * already exists in shopping cart list, the quantity of that item is
     * incremented, and the original price remains unchanged.
     *
     * @see ShoppingCartItem
     */
    addItem(product /*: Product */) {

        let isNewItem = true;

        for (var scProductId in this.items) {

            if (toInt(scProductId) === product.getProductId()) {
                isNewItem = false;
                this.items[scProductId].increment();
            }
        }

        if (isNewItem === true) {
            let scItem = new ShoppingCartItem(product);
            this.items[scItem.getProductId()] = scItem;
        }
        this.numberOfItems = this.getNumberOfItems();
    }


    /**
     * Updates the <code>ShoppingCartItem</code> of the specified
     * <code>product</code> to the specified quantity. If '<code>0</code>'
     * is the given quantity, the <code>ShoppingCartItem</code> is removed
     * from the <code>ShoppingCart</code>'s <code>items</code> list.
     *
     * @param product the product for which to update quantity
     * @param quantity the number which the <code>ShoppingCartItem</code> is updated to
     * @see ShoppingCartItem
     */
    update(product /*: Product*/ , quantity) {

        if (quantity < 0 || quantity > 99) return;


        for (var scProductId in this.items) {

            let scItem = this.items[scProductId];

            if (toInt(scProductId) === product.getProductId()) {

                if (quantity !== 0) {
                    // set item quantity to new value
                    scItem.setQuantity(quantity);
                } else {
                    // if quantity equals 0, save item and break
                    this.items.splice(scProductId, 1);
                }
            }
        }
        this.numberOfItems = this.getNumberOfItems();
    }



    /**
     * Returns the list of <code>ShoppingCartItems</code>.
     *
     * @return the <code>items</code> list
     * @see ShoppingCartItem
     */
    getItems() {
        return shrunkenAssociativeArray(this.items);
    }

    /**
     * Returns the sum of quantities for all items maintained in shopping cart
     * <code>items</code> list.
     *
     * @return the number of items in shopping cart
     * @see ShoppingCartItem
     */
    getNumberOfItems() {

        var numberOfItems = 0;

        for (var scProductId in this.items) {
            let scItem = this.items[scProductId];
            numberOfItems += scItem.getQuantity();
        }
        return numberOfItems;
    }

    /**
     * Returns the sum of the product price multiplied by the quantity for all
     * items in shopping cart list. This is the total cost excluding the surcharge.
     *
     * @return the cost of all items times their quantities
     * @see ShoppingCartItem
     */
    getSubtotal() {

        let amount = 0;

        for (var scProductId in this.items) {
            let scItem = this.items[scProductId];
            amount += scItem.getQuantity() * scItem.getPrice();
        }

        return amount;
    }

    /**
     * Calculates the total cost of the order. This method adds the subtotal to
     * the designated surcharge and sets the <code>total</code> instance variable
     * with the result.
     *
     * @param surcharge the designated surcharge for all orders
     * @see ShoppingCartItem
     */
    calculateTotal(surcharge) {
        var amount;
        amount = this.getSubtotal();
        amount += SiteConfig.surcharge;
        this.total = amount;
    }

    /**
     * Returns the total cost of the order for the given
     * <code>ShoppingCart</code> instance.
     *
     * @return the cost of all items times their quantities plus surcharge
     */
    getTotal() {
        this.calculateTotal(500)
        return this.total;
    }



}

export { ShoppingCart }