import Header from '../components/Header.js'
import Footer from '../components/Footer.js';

import FormatMixin from '../mixins/FormatMixin.js'
import CartMixin from "../mixins/CartMixin.js";

export default function(topElement) {
    var checkoutPageVue = new Vue({
        el: topElement,
        mixins: [FormatMixin, CartMixin],
        components: {
            "grocery-header": Header,
            "grocery-footer": Footer
        }
    });
}

