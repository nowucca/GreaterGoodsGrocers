Vue.component('ggg-navbar', {
    props: ['selectedcategoryname', 'categories', 'selectedstatus'],
    mixins: [formatMixin],
    template: `
<nav id="headerNav">
    <ul>
        <template v-for="cat in categories">
            <li v-if="selectedstatus === true && selectedcategoryname === cat.name" class="active">
                <a :href="link('category','name',cat.name)">{{cat.name}}</a></li>
            <li v-else>
                <a :href="link('category','name',cat.name)">{{cat.name}}</a></li>
        </template>
    </ul>
</nav>`
});