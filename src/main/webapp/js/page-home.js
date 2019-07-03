var app = new Vue({
    el: 'main',

    mixins: [formatMixin, categoryMixin],

    data: {
        specialProducts: null
    },

    mounted: function() {
        this.loadSpecialProducts();
    },

    methods: {
        loadSpecialProducts: function() {
            const vm = this;
            fetch(window.config.url+"/api/product/specials")
                .then(response => response.json())
                .then(data => {
                    vm.specialProducts = data;
                })
                .catch(reason => {
                    console.log("Error fetching special product data", reason)
                });
        }
    }
})