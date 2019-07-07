export const SiteConfig = {
    "url": "http://localhost:8080/GreaterGoodsSession",
    "siteImages": "images/site",
    "productImages": "images/products"
};

// Functions to handle reading request parameters
// https://usefulangle.com/post/78/javascript-get-url-parameters
export function getUrlParam(parameter, defaultvalue){
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
export const PriceFormatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 2
});

export function toInt(x, defaultInt) {
    var parsed = parseInt(x, 10);
    if (isNaN(parsed)) { return 0; }
    return parsed;
}