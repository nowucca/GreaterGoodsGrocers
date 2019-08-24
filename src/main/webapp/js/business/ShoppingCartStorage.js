
import {ShoppingCartItem} from './ShoppingCartItem.js';
import {Product} from "./Product.js";
import {ShoppingCart} from './ShoppingCart.js';


import { denseArray } from './Utils.js';

const STORAGE_KEY = "cart";


class ShoppingCartStorage {

    constructor() {
    }

    /**
     * The provided cart is serialized (stored) into local storage
     * in the browser.
     *
     * This is done using a dense array for the items to avoid
     * storing null array entries.
     *
     * @param cart  The cart to store in local storage
     */
    static saveCart(cart) {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(cart));
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
            jsonCart.items.forEach(jsonItem => {
                let product = new Product(jsonItem.product);
                newCart.addItem(product, jsonItem.quantity);
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
        cart.clear();
        localStorage.removeItem(STORAGE_KEY);
    }
}

export { ShoppingCartStorage }
