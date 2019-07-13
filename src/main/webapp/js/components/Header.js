import formatMixin from '../mixins/FormatMixin.js';

export default {
    template: `
<header>
    <div id="leftHeader">
        <div id="logo">
            <a :href="link('home')">
                <img :src="siteImage('logo.png')" alt="Greater Goods Grocers"/>
            </a>
        </div>

        <div id="logoText">
            <a href="#"><span>Greater Goods Grocers</span></a>
        </div>
    </div>


    <div id="midHeader">
        <form id="searchForm" action="/category">
            <input id="searchBar" type="text">
            <input id="searchIcon" type="image" :src="siteImage('search-icon.png')"
                   alt="Search Icon">
        </form>
    </div>

    <div id="rightHeader">

        <div id="cartButton">
            <a :href="link('cart')">
                <img :src="siteImage('cart-icon.png')" alt="Cart Icon">
            </a>
            <div id="cartCount">{{cart.numberOfItems}}</div>
        </div>

        <div id="avatarArea"><a href="#">
            <img :src="siteImage('avatar.png')" alt="Cart Icon">
        </a></div>

        <div id="accountArea">
            <div id="welcomeMessage"><span>Welcome, Guest</span></div>
            <div id="signinLinks">Sign In | Register</div>
        </div>
    </div>
</header>`,
    props: {
        'cart': Object /*ShoppingCart*/
    },
    mixins: [formatMixin]
};
