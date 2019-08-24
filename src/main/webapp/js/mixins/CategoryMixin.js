import { getUrlParam, SiteConfig } from '../business/Utils.js';
import { Product } from '../business/Product.js';
import { Category } from '../business/Category.js';

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
            let requestedCategoryName = sessionStorage.getItem("selectedCategoryName");
            if (requestedCategoryName !== null) {
                this.selectedCategoryName = requestedCategoryName;
            }

            requestedCategoryName = getUrlParam('name', '');
            if (requestedCategoryName !== '') {
                this.selectedCategoryName = requestedCategoryName;
            }
        },

        selectCategory: function(categoryName) {
            const vm = this;
            fetch(`${SiteConfig.url}/api/products/category?name=${categoryName}`)
                .then(response => response.json())
                .then(jsonProducts => {
                    vm.products.length = 0;
                    for (let p in jsonProducts) {
                        if (jsonProducts.hasOwnProperty(p)) {
                            vm.products.push(new Product(jsonProducts[p]));
                        }
                    }
                    vm.selectedCategoryName = categoryName;
                    sessionStorage.setItem("selectedCategoryName", categoryName);
                })
				.catch(reason => {
                    console.log("Error fetching product data", reason)
                });
        },

        loadCategories: function() {
            const vm = this;

            fetch(`${SiteConfig.url}/api/categories`)
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
