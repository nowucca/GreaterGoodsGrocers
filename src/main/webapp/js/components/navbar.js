import formatMixin from '../mixins/FormatMixin.js';

export default {

    template: `
<nav id="headerNav">
    <ul>
        <template v-for="cat in categories">
            <li v-if="showSelection === true && selectedCategoryName === cat.name" class="active">
                <a :href="link('category','name',cat.name)">{{cat.name}}</a></li>
            <li v-else>
                <a :href="link('category','name',cat.name)">{{cat.name}}</a></li>
        </template>
    </ul>
</nav>`,

    props: {
        'selectedCategoryName': String,
        'categories': Array /* Category */,
        'showSelection': Boolean
    },

    mixins: [formatMixin]

};