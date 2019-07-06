import Footer from "./components/footer.js";


export default function(topElement) {
    var categoryPageVue = new Vue({
        el: topElement,
        mixins: [formatMixin, categoryMixin],
        components: {
            "grocery-footer": Footer
        }
    });
}

