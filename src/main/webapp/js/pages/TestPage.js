import FormatMixin from '../mixins/FormatMixin.js'
import CategoryMixin from '../mixins/CategoryMixin.js';
import CartMixin from '../mixins/CartMixin.js';

export default function (topElement) {
    var testPageVue = new Vue({
        el: topElement,

        mixins: [FormatMixin, CategoryMixin, CartMixin],

        data: {
            message: 'Hello from Vue!',
        },

        mounted: function() {
            console.log('Test mounted')
        },

    });
}