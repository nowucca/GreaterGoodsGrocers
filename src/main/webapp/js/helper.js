window.config = {
    "url": "http://localhost:8080/GreaterGoodsMvvm",
};

window.config["siteImages"] =  "images/site";
window.config["productImages"] =  "images/products";


// Functions to handle reading request parameters
// From: https://html-online.com/articles/get-url-parameters-javascript/

function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[decodeURIComponent(key)] = decodeURIComponent(value);
    });
    return vars;
}
function getUrlParam(parameter, defaultvalue){
    var urlparameter = defaultvalue;
    if(window.location.href.indexOf(parameter) > -1){
        urlparameter = getUrlVars()[parameter];
    }
    return urlparameter;
}

// From https://flaviocopes.com/how-to-format-number-as-currency-javascript/

const priceFormatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 2
});

var formatMixin = {
    methods: {
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
