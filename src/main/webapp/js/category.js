var app = new Vue({
    el: '.products-container',

    data: {
        message: 'Hello from Vue!',
        selectedCategoryName: "Dairy",
        products: null,
        categories: null

    },

    mounted: function() {
        this.loadCategories();

        this.handleRequestedCategoryIfAny();

        this.selectCategory(this.selectedCategoryName);

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
            fetch("http://localhost:8080/GreaterGoodsMvvm/api/product/category?name="+categoryName)
                .then(response => response.json())
                .then(data => {
                    vm.products = data;
                    vm.selectedCategoryName = categoryName;
                })
                .catch(reason => {
                    console.log("Error fetching product data", reason)
                });
        },

        loadCategories: function() {
            const vm = this;
            fetch("http://localhost:8080/GreaterGoodsMvvm/api/category/all")
                .then(response => response.json())
                .then(data => {
                    vm.categories = data;
                })
                .catch(reason => {
                    console.log("Error fetching category data", reason)
                });
        },

        productImageSrc: function(product) {
            var name = product.name.toLowerCase();
            name = name.replace(/\ /g , '-');
            return window.config.productImages + '/' + name + '.jpg';
        },

        formatPrice: function(price) {
            return priceFormatter.format(price);
        }
    }
})