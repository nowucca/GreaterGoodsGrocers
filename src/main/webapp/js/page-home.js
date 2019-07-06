import Header from "./components/header.js"
import Footer from "./components/footer.js";
import NavBar from "./components/navbar.js"

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
            specialProducts: null
        },

        mounted: function () {
            this.loadSpecialProducts();
        },

        methods: {
            loadSpecialProducts: function () {
                const vm = this;
                fetch(window.config.url + "/api/product/specials")
                    .then(response => response.json())
                    .then(data => {
                        vm.specialProducts = data;
                    })
                    .catch(reason => {
                        console.log("Error fetching special product data", reason)
                    });
            }
        }
    });
}