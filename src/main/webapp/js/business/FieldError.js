class FieldError {

    constructor(fieldName, errorMessages = []) {
        this._fieldName = fieldName;
        this._errorMessages = errorMessages; /* Array of String, multiple messages per field allowed */
    }

    add(errorMessage) {
        this._errorMessages.push(errorMessage);
        return this;
    }

    get fieldName() {
        return this._fieldName;
    }

    get messages() {
        return Object.freeze(this._errorMessages);
    }

    toString() {
        return "FieldError[name=" + this.fieldName + " messageCount="+this._errorMessages.length+"]";
    }

    toJSON() {
    	return {
			"fieldName": this._fieldName,
			"errorMessages": this._errorMessages
		}
	}
}

export { FieldError }
