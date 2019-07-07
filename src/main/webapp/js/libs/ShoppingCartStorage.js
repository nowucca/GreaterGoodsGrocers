
import {ShoppingCartItem} from './ShoppingCartItem.js';
import {Product} from "./Product.js";
import {ShoppingCart} from './ShoppingCart.js';


import { shrunkenAssociativeArray } from './helper.js';

const STORAGE_KEY = "cart";


class ShoppingCartStorage {

    constructor() {
        this._type = "ShoppingCartStorage";
    }

    /**
     * The provided cart is serialized (stored) into local storage
     * in the browser.
     *
     * This is done using a shrunken array for the items to avoid
     * storing null array entries.
     *
     * @param cart  The cart to store in local storage
     */
    static saveCart(cart) {
        var tempItems = shrunkenAssociativeArray(cart.items);
        localStorage.setItem(STORAGE_KEY, JSON.stringify(
            { "numberOfItems": cart.numberOfItems,
                    "total": cart.getTotal(),
                    "items": tempItems}
            )
        )
    }


    /**
     * This loads and returns the cart stored in local storage.
     * If no cart is in local storage, a new empty shopping cart is returned.
     *
     * @returns {ShoppingCart}
     */
    static loadCart() {
        let newCart = new ShoppingCart();
        if (localStorage.getItem(STORAGE_KEY)) {
            let jsonCart = JSON.parse(localStorage.getItem(STORAGE_KEY));
            newCart.numberOfItems = jsonCart.numberOfItems;
            newCart.total = jsonCart.total;
            newCart.items = [];
            jsonCart.items.forEach(item => {
                let product = new Product(item.product);
                let scItem = new ShoppingCartItem(product);
                scItem.setQuantity(item.quantity);
                newCart.items[product.getProductId()] = scItem;
            });
        }
        return newCart;
    }

    /**
     * Empties the shopping cart. All items are removed from the shopping cart
     * <code>items</code> list, <code>numberOfItems</code> and
     * <code>total</code> are reset to '<code>0</code>'.
     *
     * @see ShoppingCartItem
     */
    static clearCart(cart) {
        cart.items.length = 0;
        cart.numberOfItems = 0;
        cart.total = 0;
        localStorage.setItem(STORAGE_KEY, undefined);
    }


}

export { ShoppingCartStorage }