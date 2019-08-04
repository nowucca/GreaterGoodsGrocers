class FieldError {

    constructor(fieldName, errorMessages = []) {
        this.fieldName = fieldName;
        this.errorMessages = []; /* Array of String, multiple messages per field allowed */
        this._type = "FieldError";
    }

    add(errorMessage) {
        this.errorMessages.push(errorMessage);
        return this;
    }

    getFieldName() {
        return this.fieldName;
    }

    getMessages() {
        return Object.freeze(this.errorMessages);
    }

    toString() {
        return "FieldError[name=" + this.fieldName + " messageCount="+this.errorMessages.length+"]";
    }

}

export { FieldError }