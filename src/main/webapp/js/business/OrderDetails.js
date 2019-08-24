class OrderDetails {

	constructor(jsonObject = {}) {
		this._order = jsonObject.order;
		this._customer = jsonObject.customer;
		this._lineItems = jsonObject.lineItems;
		this._products = jsonObject.products;
	}


	get order() {
		return this._order;
	}

	get customer() {
		return this._customer;
	}

	get lineItems() {
		return this._lineItems;
	}

	get products() {
		return this._products;
	}

	toJSON() {
		return {
			order: this._order,
			customer: this._customer,
			lineItems: this._lineItems,
			products: this._products
		}
	}

}
