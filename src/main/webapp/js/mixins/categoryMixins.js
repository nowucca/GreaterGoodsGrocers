import { getUrlParam, SiteConfig } from '../libs/helper.js';
import { Product } from '../libs/Product.js';
import { Category } from '../libs/Category.js';

export default {

    data: {
        selectedCategoryName: "Dairy",
        products: [],
        categories: [],
        showSelection: true
    },

    mounted: function() {
        this.loadCategories();

        this.handleRequestedCategoryIfAny();

        if (this.showSelection === true) {
            this.selectCategory(this.selectedCategoryName);
        }

    },

    methods: {
        handleRequestedCategoryIfAny: function() {
            var requestedCategoryName = getUrlParam('name', '');
            if (requestedCategoryName !== '') {
                this.selectedCategoryName = requestedCategoryName;
            }
        },

        selectCategory: function(categoryName) {
            const vm = this;
            fetch(`${SiteConfig.url}/api/product/category?name=${categoryName}`)
                .then(response => response.json())
                .then(jsonProducts => {
                    vm.products.length = 0;
                    for (let p in jsonProducts) {
                        if (jsonProducts.hasOwnProperty(p)) {
                            vm.products.push(new Product(jsonProducts[p]));
                        }
                    }
                    vm.selectedCategoryName = categoryName;
                })
                .catch(reason => {
                    console.log("Error fetching product data", reason)
                });
        },

        loadCategories: function() {
            const vm = this;

            fetch(`${SiteConfig.url}/api/category/all`)
                .then(response => response.json())
                .then(jsonCategories => {
                    vm.categories.length = 0;
                    for (let c in jsonCategories) {
                        if (jsonCategories.hasOwnProperty(c)) {
                            vm.categories.push(new Category(jsonCategories[c]));
                        }
                    }
                })
                .catch(reason => {
                    console.log("Error fetching category data", reason)
                });
        }


    }

};
