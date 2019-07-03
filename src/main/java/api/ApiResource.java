package api;

import business.ApplicationContext;
import business.category.Category;
import business.category.CategoryDao;
import business.product.Product;
import business.product.ProductDao;
import org.checkerframework.common.reflection.qual.GetClass;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import java.util.Collection;
import java.util.List;

@ApplicationPath("/")
@Path("/")
public class ApiResource {

    private final ProductDao productDao = ApplicationContext.getInstance().getProductDao();
    private final CategoryDao categoryDao = ApplicationContext.getInstance().getCategoryDao();


    @GET
    @Path("category/all")
    @Produces(javax.ws.rs.core.MediaType.APPLICATION_JSON)
    public Collection<Category> categories(@Context HttpServletRequest httpRequest) {
        try {
            return categoryDao.findAll();
        } catch (Exception e) {
            throw new ApiException("categories lookup failed", e);
        }
    }

    @GET
    @Path("product/category")
    @Produces(javax.ws.rs.core.MediaType.APPLICATION_JSON)
    public List<Product> productsByCategoryName(@QueryParam("name") @DefaultValue("Dairy") String categoryName,
                                                @Context HttpServletRequest httpRequest) {
        try {
            Category category = categoryDao.findAll().stream()
                    .filter((c) -> c.getName().equals(categoryName))
                    .findFirst().orElse(null);

            if (category == null) {
                throw new ApiException.NotFound(String.format("No such category: %s", categoryName));
            }

            return productDao.findByCategoryId(category.getCategoryId());
        } catch (ApiException e) {
            throw e;
        } catch (Exception e) {
            throw new ApiException("products lookup via categoryName failed", e);
        }
    }

    @GET
    @Path("product/specials")
    @Produces(javax.ws.rs.core.MediaType.APPLICATION_JSON)
    public List<Product> specialProducts(@Context HttpServletRequest request) {
        try {
            return productDao.findSpecials();
        } catch (ApiException e) {
            throw e;
        } catch (Exception e) {
            throw new ApiException("products lookup via categoryName failed", e);
        }
    }

}
