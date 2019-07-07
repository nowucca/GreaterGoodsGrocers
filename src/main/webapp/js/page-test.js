import formatMixin from './mixins/formatMixins.js'
import categoryMixin from './mixins/categoryMixins.js';
import cartMixin from './mixins/cartMixins.js';

export default function (topElement) {
    var testPageVue = new Vue({
        el: topElement,

        mixins: [formatMixin, categoryMixin, cartMixin],

        data: {
            message: 'Hello from Vue!',
        },

        mounted: function() {
            console.log('Test mounted')
        },

    });
}