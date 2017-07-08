/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProductRepositoryTests;

import ecommerce.common.PagedList;
import ecommerce.database.ProductRepository;
import ecommerce.domain.Product;
import java.util.UUID;
import org.junit.Ignore;
import org.junit.Test;

/**
 *
 * @author Ganna
 */
public class ProductRepositoryTest {
    @Test
    @Ignore
    public  void testAddProduct(){
    
    ProductRepository rep = new ProductRepository();
    Product product = new Product();
    product.setName("test product");
    product.setId(UUID.randomUUID().toString());
    rep.addProduct(product);    
    }
    
    @Test
    @Ignore
    public  void testFindProductByProductId(){
    
    ProductRepository rep = new ProductRepository();
    Product product = new Product();

    product = rep.find("24e5c4b0-2ac7-474e-ae8c-b74a86295406");    
       
    System.out.println(product.getId());
    
        String name = product.getName();
    }
    
     @Test
    //@Ignore
    public  void testFindPagedListByCategory(){
    
    ProductRepository rep = new ProductRepository();
    

    PagedList<Product> products = rep.find(1, 3, "jhfjhjhjkv");
       
    for(Product product : products.getList()){
        System.out.println(product.getCategory() + product.getName());
    }
    System.out.println("Total " + products.getTotal());
    }
    
    
}