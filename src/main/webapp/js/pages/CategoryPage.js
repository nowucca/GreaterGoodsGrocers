import Header from '../components/Header.js'
import Footer from '../components/Footer.js';
import NavBar from '../components/NavBar.js'

import FormatMixin from '../mixins/FormatMixin.js'
import CategoryMixin from '../mixins/CategoryMixin.js'
import CartMixin from "../mixins/CartMixin.js";

export default function(topElement) {
    var categoryPageVue = new Vue({
        el: topElement,
        mixins: [FormatMixin, CategoryMixin, CartMixin],
        components: {
            "grocery-header": Header,
            "grocery-navbar": NavBar,
            "grocery-footer": Footer
        }
    });
}

