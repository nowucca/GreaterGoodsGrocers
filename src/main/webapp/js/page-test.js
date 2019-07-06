
import formatMixin from './mixins/formatMixins.js'
import categoryMixin from './mixins/categoryMixins.js';
import { SiteConfig } from './libs/helper.js';

export default function (topElement) {
    var testPageVue = new Vue({
        el: topElement,

        mixins: [formatMixin, categoryMixin],

        data: {
            message: 'Hello from Vue!',
        },

    });
}