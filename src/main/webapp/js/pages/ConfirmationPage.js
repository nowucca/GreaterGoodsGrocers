import Header from '../components/Header.js'
import Footer from '../components/Footer.js';
import NavBar from '../components/NavBar.js'

import FormatMixin from '../mixins/FormatMixin.js'
import CategoryMixin from '../mixins/CategoryMixin.js'
import CartMixin from "../mixins/CartMixin.js";

export default function(topElement) {
    var categoryPageVue = new Vue({
        el: topElement,
        mixins: [FormatMixin, CartMixin],
        components: {
            "grocery-header": Header,
            "grocery-footer": Footer
        },

		mounted: function() {
        	this.orderDetails = JSON.parse(sessionStorage.getItem("orderDetail"));
		},

		data: {
        	orderDetails: null
		}
    });
}

