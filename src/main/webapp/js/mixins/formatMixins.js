import { PriceFormatter, SiteConfig  } from '../libs/helper.js';

export default {
    methods: {
        siteUrl: function() {
            return SiteConfig.url + '/';
        },

        productImage: function(product) {
            var name = product.name.toLowerCase();
            name = name.replace(/\ /g , '-');
            return SiteConfig.productImages + '/' + name + '.jpg';
        },

        siteImage: function(fileName) {
            var name = fileName.toLowerCase();
            name = name.replace(/\ /g , '-');
            return SiteConfig.siteImages + '/' + fileName;
        },

        link: function(path, ...nvPairs) {
            var result = SiteConfig.url + '/' + path;
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
            return PriceFormatter.format(price);
        }
    }
};
