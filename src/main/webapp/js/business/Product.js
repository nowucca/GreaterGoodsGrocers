
class Product {

    constructor(jsonObject = {}) {
        Object.assign(this, jsonObject);
        this._type = "Product";
    }

    // private long productId;
    // private String name;
    // private int price;
    // private Date lastUpdate;

    getProductId() {
        return this.productId;
    }

    getName() {
        return this.name;
    }

    getPrice() {
        return this.price;
    }

    getDescription() {
        return this.description;
    }

    getPoints() {
        return this.points;
    }

    getLastUpdate() {
        return this.lastUpdate;
    }

    toString() {
        return "Product[product_id=" + this.productId + "]";
    }

}

export { Product }