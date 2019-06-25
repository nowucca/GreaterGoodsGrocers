
package business;

import business.category.CategoryDao;
import business.category.CategoryDaoJdbc;
import business.product.ProductDao;
import business.product.ProductDaoJdbc;

public class ApplicationContext {

    private CategoryDao categoryDao;
    private ProductDao productDao;

    private static ApplicationContext INSTANCE = new ApplicationContext();

    public static ApplicationContext getInstance() {
        return INSTANCE;
    }

    private ApplicationContext() {
        categoryDao = new CategoryDaoJdbc();
        productDao = new ProductDaoJdbc();
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public ProductDao getProductDao() {
        return productDao;
    }
}
