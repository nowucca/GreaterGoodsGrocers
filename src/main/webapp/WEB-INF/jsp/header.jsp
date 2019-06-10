<header>

    <div id="leftHeader">
        <div id="logo">
            <a href="index.jsp">
                <img src="${initParam.siteImages}logo.png" alt="Greater Goods Grocers"/>
            </a>
        </div>

        <div id="logoText">
            <a href="#"><span>Greater Goods Grocers</span></a>
        </div>
    </div>


    <div id="midHeader">
        <form id="searchForm" action="category.jsp">
            <input id="searchBar" type="text">
            <input id="searchIcon" type="image" src="${initParam.siteImages}search-icon.png"
                   alt="Search Icon">
        </form>
    </div>

    <div id="rightHeader">

        <div id="cartButton">
            <a href="cart.jsp">
                <img src="${initParam.siteImages}cart-icon.png" alt="Cart Icon">
            </a>
            <div id="cartCount">0</div>
        </div>

        <div id="avatarArea"><a href="#">
            <img src="${initParam.siteImages}avatar.png" alt="Cart Icon">
        </a></div>

        <div id="accountArea">
            <div id="welcomeMessage"><span>Welcome, Guest</span></div>
            <div id="signinLinks">Sign In | Register</div>
        </div>
    </div>


</header>

<nav id="headerNav">
    <ul>
        <li class="active"><a href="category/fresh-produce">Fresh Produce</a></li>
        <li><a href="category/meat">Meat</a></li>
        <li><a href="category/dairy">Dairy</a></li>
        <li><a href="category/frozen-foods">Frozen Foods</a></li>
        <li><a href="category/household">Household</a></li>
        <li><a href="category/health-and-beauty">Health and Beauty</a></li>
    </ul>
</nav>