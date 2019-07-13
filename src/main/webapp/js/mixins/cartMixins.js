import {ShoppingCartStorage} from "../libs/ShoppingCartStorage.js";
import {ShoppingCart} from "../libs/ShoppingCart.js";

export default {

    data: {
        cart: new ShoppingCart()
    },

    computed: {
        getCartTotal: function() {
            return this.cart.getTotal();
        },
        getCartSubtotal: function() {
            return this.cart.getSubtotal();
        }
    },

    mounted: function() {
        this.cart = ShoppingCartStorage.loadCart();
    },

    methods: {

        addToCart: function(product) {
            this.cart.addItem(product);
            ShoppingCartStorage.saveCart(this.cart);
        },

        updateCart: function(product, quantity) {
            this.cart.update(product, quantity);
            ShoppingCartStorage.saveCart(this.cart);
        },

        clearCart: function () {
            ShoppingCartStorage.clearCart(this.cart);
        }

    },

};
