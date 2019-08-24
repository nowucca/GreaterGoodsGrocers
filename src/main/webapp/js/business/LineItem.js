class LineItem {

    constructor(jsonObject = {}) {
    	this._productId = jsonObject.productId;
    	this._orderId = jsonObject.orderId;
    	this._quantity = jsonObject.quantity;
    }

    get productId() {
	    return this._productId;
    }

    get orderId() {
		return this._orderId;
	}

    get quantity() { return this._quantity; }

	toJSON() {
		return {
			"orderId": this._orderId,
			"productId": this._productId,
			"quantity": this._quantity
		}
	}

}

export { LineItem }
