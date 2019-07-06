import Header from './components/header.js'
import Footer from './components/footer.js';
import NavBar from './components/navbar.js'

import formatMixin from './mixins/formatMixins.js'
import categoryMixin from './mixins/categoryMixins.js'

export default function(topElement) {
    var categoryPageVue = new Vue({
        el: topElement,
        mixins: [formatMixin, categoryMixin],
        components: {
            "grocery-header": Header,
            "grocery-navbar": NavBar,
            "grocery-footer": Footer
        }
    });
}

