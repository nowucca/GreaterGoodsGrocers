class Category {


    // private long categoryId;
    // private String name;
    constructor(jsonObject = {}) {
        Object.assign(this, jsonObject);
        this._type = "Category";
    }


    getCategoryId() {
        return this.categoryId;
    }

    getName() {
        return this.name;
    }

    toString() {
        return "Category[id=" + this.categoryId + "]";
    }

}

export { Category }