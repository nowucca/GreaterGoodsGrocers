import Header from './components/header.js'
import Footer from './components/footer.js';
import NavBar from './components/navbar.js'

import formatMixin from './mixins/formatMixins.js'
import categoryMixin from './mixins/categoryMixins.js';
import { SiteConfig } from './libs/helper.js';
import {Product} from "./libs/Product.js";

export default function (topElement) {
    var homePageVue = new Vue({
        el: topElement,

        mixins: [formatMixin, categoryMixin],

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