class Customer {

	constructor(jsonObject = {}) {
		this._customerId = jsonObject.customerId;
		this._address = jsonObject.address;
		this._customerName = jsonObject.customerName;
		this._phone = jsonObject.phone;
		this._email = jsonObject.email;
		this._last4 = jsonObject.last4;
	}


	get customerId() {
		return this._customerId;
	}

	set customerId(value) {
		this._customerId = value;
	}

	get address() {
		return this._address;
	}

	set address(value) {
		this._address = value;
	}

	get customerName() {
		return this._customerName;
	}

	set customerName(value) {
		this._customerName = value;
	}

	get phone() {
		return this._phone;
	}

	set phone(value) {
		this._phone = value;
	}

	get email() {
		return this._email;
	}

	set email(value) {
		this._email = value;
	}

	get last4() {
		return this._last4;
	}

	set last4(value) {
		this._last4 = value;
	}

	toJSON() {
		return {
			"customerId": this._customerId,
			"address": this._address,
			"customerName": this._customerName,
			"phone": this._phone,
			"email": this._email,
			"last4": this._last4
		}
	}
}
