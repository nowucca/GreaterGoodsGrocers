class Order {

	constructor(jsonObject = {}) {
		this._orderId = jsonObject.orderId;
		this._amount = jsonObject.amount;
		this._dateCreated = new Date(jsonObject.dateCreated);
		this._confirmationNumber = jsonObject.confirmationNumber;
		this._customerId = jsonObject.customerId;
	}


	get orderId() {
		return this._orderId;
	}

	get amount() {
		return this._amount;
	}

	get dateCreated() {
		return this._dateCreated;
	}

	get confirmationNumber() {
		return this._confirmationNumber;
	}

	get customerId() {
		return this._customerId;
	}

	toJSON() {
		return {
			"orderId": this._orderId,
			"productId": this._amount,
			"dateCreated": this._dateCreated.getTime(),
			"confirmationNumber": this._confirmationNumber,
			"customerId": this._customerId
		}
	}
}


