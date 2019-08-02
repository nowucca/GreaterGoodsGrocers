import Header from '../components/Header.js'
import Footer from '../components/Footer.js';

import FormatMixin from '../mixins/FormatMixin.js'
import CartMixin from "../mixins/CartMixin.js";

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
            errors: []
        },

        methods: {

            performChecks: function () {
                let v = validator; // see https://github.com/validatorjs/validator.js
                let form = this.customerForm;
                let msgs = this.errorMessages;

                if (v.isEmpty(form.name)) {
                    this.errors.push({field: "name", msg: msgs.name.missing});
                } else if (!v.isLength(form.name, {min:1, max: 45})) {
                    this.errors.push({field: "name", msg: msgs.name.value});
                }

                if (v.isEmpty(form.address)) {
                    this.errors.push({field: "address", msg: msgs.address.missing});
                } else if (!v.isLength(form.address, {min:1, max: 45})) {
                    this.errors.push({field: "address", msg: msgs.address.value});
                }

                if (v.isEmpty(form.phone)) {
                    this.errors.push({field: "phone", msg: msgs.phone.missing});
                } else if (!v.isMobilePhone(form.phone, 'en-US', {strictMode: false})) {
                    this.errors.push({field: "phone", msg: msgs.phone.value});
                }

                if (v.isEmpty(form.email)) {
                    this.errors.push({field: "email", msg: msgs.email.missing});
                } else if (!v.isEmail(form.email, {allow_utf8_local_part: false})) {
                    this.errors.push({field: "email", msg: msgs.email.value});
                }

                if (v.isEmpty(form.ccNumber)) {
                    this.errors.push({field: "ccNumber", msg: msgs.ccNumber.missing});
                } else if (!v.isCreditCard(form.ccNumber)) {
                    this.errors.push({field: "ccNumber", msg: msgs.ccNumber.value});
                }
            },

            submitOrder: function(evt) {
                console.log("Submit Order method called")
                this.clearErrors();
                this.performChecks();

                if (this.errors.length === 0) {
                    this.errors.push({field: "form", msg: "Transactions have not been implemented yet."})
                }
            },

            resetOrder: function(evt) {
                console.log("Reset Order method called");
                this.clearErrors();
            },

            blurred: function(evt) {
                let elementId = evt.target.id;
                console.log("Blur method called on element "+elementId);
                this.clearErrors();
                this.performChecks();
            },

            clearErrors: function(fieldName = "") {
                this.errors = [];
            }

        }
    });
}