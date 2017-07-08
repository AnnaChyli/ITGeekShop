package ecommerce.domain;

import ecommerce.common.PagedList;
import java.util.ArrayList;
import java.util.UUID;

/**
 *
 * @author Ganna
 */
public interface IProductRepository {

    void updateProductQuantity(String productId, int quantity);
    
    boolean isProductAvailable(String shopItemId, int quantity);

    String addProduct(Product product);

    //By seller
    ArrayList<Product> find(int pageNum, int size, UUID userId);

    //By category
    PagedList<Product> find(int pageNum, int size, String category);

    //By category
    ArrayList<Product> find(int pageNum, int size);

    //By Id
    Product find(String productId);

    ArrayList<Product> getProductListFor(String sellerId);

    void updateProduct(Product product);

}
