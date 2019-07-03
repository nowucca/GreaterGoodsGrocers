window.config = {
    "url": "http://localhost:8080/GreaterGoodsMvvm",
    "siteImages": "images/site",
    "productImages": "images/products"
};

// Functions to handle reading request parameters
// https://usefulangle.com/post/78/javascript-get-url-parameters
function getUrlParam(parameter, defaultvalue){
    var url = new URL(window.location.href);
    var query_string = url.search;
    var search_params = new URLSearchParams(query_string);

    var urlparameter = search_params.get(parameter);
    if (!urlparameter) {
        urlparameter = defaultvalue;
    }
    return urlparameter;
}

// From https://flaviocopes.com/how-to-format-number-as-currency-javascript/
const priceFormatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 2
});
