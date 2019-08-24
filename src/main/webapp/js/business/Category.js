class Category {

    constructor(jsonObject = {}) {
    	this._categoryId = jsonObject.categoryId;
    	this._name = jsonObject.name;
    }

    get categoryId() {
        return this._categoryId;
    }

    get name() {
        return this._name;
    }

	set categoryId(value) {
		this._categoryId = value;
	}

	set name(value) {
		this._name = value;
	}

	toString() {
        return "Category[id=" + this._categoryId + "]";
    }

	toJSON() {
		return {
			"categoryId": this._categoryId,
			"name": this._name
		};
	}

}

export { Category }
