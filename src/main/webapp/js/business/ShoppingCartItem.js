import { Product } from "./Product.js";


class ShoppingCartItem {

    // Product product;
    // short quantity;

    constructor(product) {
        this.product = product;
        this.quantity = 1;
        this._type="ShoppingCartItem";
    }

    getProductId() { return this.product.getProductId(); }
    getPrice() { return this.product.getPrice(); }
    getQuantity() { return this.quantity; }
    getTotal() { return this.quantity * this.getPrice(); }
    getProduct() { return this.product; }

    increment() { this.quantity++; }
    decrement() {
        if (this.quantity > 0) {
            this.quantity--;
        }
    }
    setQuantity(quantity) {
        this.quantity = quantity;
    }

}

export  { ShoppingCartItem }