import Header from '../components/Header.js'
import Footer from '../components/Footer.js';

import FormatMixin from '../mixins/FormatMixin.js'
import CartMixin from "../mixins/CartMixin.js";
import {FieldError} from "../business/FieldError.js";
import {denseArray} from "../business/Utils.js";

export default function(topElement) {
    var checkoutPageVue = new Vue({
        el: topElement,
        mixins: [FormatMixin, CartMixin],
        components: {
            "grocery-header": Header,
            "grocery-footer": Footer
        },

        data: {
            customerForm: {
                name: "",
                address: "",
                phone: "",
                email: "",
                ccNumber: "",
            },

            errorMessages: {
                name: {
                    missing: "Name required.",
                    value: "Names should be between 1 and 45 characters long."
                },
                address: {
                    missing: "Address required.",
                    value: "Addresses should be between 1 and 45 characters long."
                },
                phone: {
                    missing: "A phone number is required.",
                    value: "Provide a valid US phone number (e.g. 408 555 1212)."
                },
                email: {
                    missing: "An email is required.",
                    value: "Provide a valid email address."
                },
                ccNumber: {
                    missing: "A credit card number is required.",
                    value: "Provide a valid credit card number."
                },

            },

            errors: [], /* sparse array [fieldName]->FieldError]; */

            submitSuccess: false,
        },

        computed: {

            hasAnyErrors: function() {
                return denseArray(this.errors).length > 0;
            },

            temporaryMessage: function() {
                return this.hasAnyErrors || this.submitSuccess !== true ? "": "Transactions have not been implemented yet.";
            }

        },

        methods: {

            hasFieldError: function(fieldName) {
                return this.errors.hasOwnProperty(fieldName);
            },

            getFieldErrorMessages: function(fieldName) {
                if (! this.hasFieldError(fieldName)) {
                    return [];
                }
                return this.errors[fieldName].getMessages();
            },

            addFieldErrorMessage(fieldName, errorMessage) {
                if (typeof this.errors[fieldName] !== "object") {
                    this.errors[fieldName] = new FieldError(fieldName);
                }
                this.errors[fieldName].add(errorMessage);
            },

            performChecks: function (fieldName = null) {
                let v = validator; // see https://github.com/validatorjs/validator.js
                let form = this.customerForm;
                let msgs = this.errorMessages;

                this.submitSuccess = false;

                if (!fieldName || fieldName === "name") {
                    if (v.isEmpty(form.name)) {
                        this.addFieldErrorMessage("name", msgs.name.missing);
                    } else if (!v.isLength(form.name, {min: 1, max: 45})) {
                        this.addFieldErrorMessage("name", msgs.name.value);
                    }
                }

                if (!fieldName || fieldName === "address") {
                    if (v.isEmpty(form.address)) {
                        this.addFieldErrorMessage("address", msgs.address.missing);
                    } else if (!v.isLength(form.address, {min: 1, max: 45})) {
                        this.addFieldErrorMessage("address", msgs.address.value);
                    }
                }

                if (!fieldName || fieldName === "phone") {
                    if (v.isEmpty(form.phone)) {
                        this.addFieldErrorMessage("phone", msgs.phone.missing);
                    } else if (!v.isMobilePhone(form.phone, 'en-US', {strictMode: false})) {
                        this.addFieldErrorMessage("phone", msgs.phone.value);
                    }
                }

                if (!fieldName || fieldName === "email") {
                    if (v.isEmpty(form.email)) {
                        this.addFieldErrorMessage("email", msgs.email.missing);
                    } else if (!v.isEmail(form.email, {allow_utf8_local_part: false})) {
                        this.addFieldErrorMessage("email", msgs.email.value);
                    }
                }

                if (!fieldName || fieldName === "ccNumber") {
                    if (v.isEmpty(form.ccNumber)) {
                        this.addFieldErrorMessage("ccNumber", msgs.ccNumber.missing);
                    } else if (!v.isCreditCard(form.ccNumber)) {
                        this.addFieldErrorMessage("ccNumber", msgs.ccNumber.value);
                    }
                }
            },

            submitOrder: function(evt) {
                console.log("Submit Order method called")
                this.clearErrors();
                this.performChecks();
                this.submitSuccess = true;
            },

            resetOrder: function(evt) {
                console.log("Reset Order method called");
                this.clearErrors();
            },

            blurred: function(evt) {
                let elementId = evt.target.id;
                console.log("Blur method called on element "+elementId);
                // console.log("Errors at start: ", this.errors);
                this.clearErrors(elementId);
                // console.log("Errors after clearing "+elementId+": ", this.errors);
                this.performChecks(elementId);
                //console.log("Errors after checks on "+elementId+": ", this.errors);
            },



            clearErrors: function(fieldName = null) {
                if (fieldName !== null) {
                    let others = denseArray(this.errors);
                    let newFieldErrors = [];
                    others = others.filter(fieldError=> fieldError.getFieldName() !== fieldName);
                    others.forEach(fieldError => {newFieldErrors[fieldError.getFieldName()] = fieldError});
                    this.errors = newFieldErrors;
                } else {
                    this.errors = [];
                }
            }

        }
    });
}