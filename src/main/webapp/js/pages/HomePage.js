import Header from '../components/Header.js'
import Footer from '../components/Footer.js';
import NavBar from '../components/NavBar.js'

import FormatMixin from '../mixins/FormatMixin.js'
import CategoryMixin from '../mixins/CategoryMixin.js';
import CartMixin from "../mixins/CartMixin.js";

import { SiteConfig } from '../business/Utils.js';
import {Product} from "../business/Product.js";

export default function (topElement) {
    var homePageVue = new Vue({
        el: topElement,

        mixins: [FormatMixin, CategoryMixin, CartMixin],

        components: {
            "grocery-header": Header,
            "grocery-navbar": NavBar,
            "grocery-footer": Footer
        },

        data: {
            specialProducts: []
        },

        mounted: function () {
            this.loadSpecialProducts();
        },

        methods: {
            loadSpecialProducts: function () {
                const vm = this;
                fetch(`${SiteConfig.url}/api/product/specials`)
                    .then(response => response.json())
                    .then(jsonProducts => {
                        vm.specialProducts.length = 0;
                        for (let p in jsonProducts) {
                            if (jsonProducts.hasOwnProperty(p)) {
                                vm.specialProducts.push(new Product(jsonProducts[p]));
                            }
                        }
                    })
                    .catch(reason => {
                        console.log("Error fetching special product data", reason)
                    });
            }
        }
    });
}