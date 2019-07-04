var categoryMixin = {

    data: {
        selectedCategoryName: "Dairy",
        products: null,
        categories: null,
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
            fetch(window.config.url+"/api/product/category?name="+categoryName)
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
            fetch(window.config.url + "/api/category/all")
                .then(response => response.json())
                .then(data => {
                    vm.categories = data;
                })
                .catch(reason => {
                    console.log("Error fetching category data", reason)
                });
        }


    }

};
