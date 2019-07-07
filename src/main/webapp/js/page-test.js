import formatMixin from './mixins/formatMixins.js'
import categoryMixin from './mixins/categoryMixins.js';
import {ShoppingCart} from "./libs/ShoppingCart.js";

export default function (topElement) {
    var testPageVue = new Vue({
        el: topElement,

        mixins: [formatMixin, categoryMixin],

        data: {
            message: 'Hello from Vue!',
            cart: new ShoppingCart()
        },

        mounted: function() {
            console.log('Test mounted')
        },

    });
}