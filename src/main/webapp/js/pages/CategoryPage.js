import Header from '../components/header.js'
import Footer from '../components/footer.js';
import NavBar from '../components/navbar.js'

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

