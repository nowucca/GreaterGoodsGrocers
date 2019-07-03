
var formatMixin = {
    methods: {
        siteUrl: function() {
            return window.config.url + '/';
        },

        productImage: function(product) {
            var name = product.name.toLowerCase();
            name = name.replace(/\ /g , '-');
            return window.config.productImages + '/' + name + '.jpg';
        },

        siteImage: function(fileName) {
            var name = fileName.toLowerCase();
            name = name.replace(/\ /g , '-');
            return window.config.siteImages + '/' + fileName;
        },

        link: function(path, ...nvPairs) {
            var result = window.config.url + '/' + path;
            for (var i = 0; i < nvPairs.length - 1; i+=2) {
                var name = nvPairs[i];
                var val = nvPairs[i + 1];
                if (i === 0) {
                    result += '?'
                } else {
                    result += '&'
                }
                result += encodeURIComponent(name) + '=' + encodeURIComponent(val);
            }
            return result;
        },

        formatPrice: function(price) {
            return priceFormatter.format(price);
        }
    }
};
