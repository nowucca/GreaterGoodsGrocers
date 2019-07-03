var app = new Vue({
    el: 'main',

    mixins: [formatMixin, categoryMixin],

    data: {
        message: 'Hello from Vue!',
    }
})