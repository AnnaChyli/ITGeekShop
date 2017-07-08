/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

import ecommerce.domain.Product;
import org.junit.Test;

/**
 *
 * @author Ganna
 */
public class ProductRepositoryTest {
    
    public ProductRepositoryTest() {
    }
    
    
    /**
     * Test of addProduct method, of class ProductRepository.
     */
    @Test
    public void testAddProduct() {
        //System.out.println("addProduct");
        Product product = new Product();
        ProductRepository instance = new ProductRepository();
        instance.addProduct(product);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

//    /**
//     * Test of find method, of class ProductRepository.
//     */
//    @Test
//    public void testFind_3args_1() {
//        System.out.println("find");
//        int pageNum = 0;
//        int size = 0;
//        UUID userId = null;
//        ProductRepository instance = new ProductRepository();
//        ArrayList<Product> expResult = null;
//        ArrayList<Product> result = instance.find(pageNum, size, userId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of find method, of class ProductRepository.
//     */
//    @Test
//    public void testFind_3args_2() {
//        System.out.println("find");
//        int pageNum = 0;
//        int size = 0;
//        String category = "";
//        ProductRepository instance = new ProductRepository();
//        ArrayList<Product> expResult = null;
//        ArrayList<Product> result = instance.find(pageNum, size, category);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of find method, of class ProductRepository.
//     */
//    @Test
//    public void testFind_int_int() {
//        System.out.println("find");
//        int pageNum = 0;
//        int size = 0;
//        ProductRepository instance = new ProductRepository();
//        ArrayList<Product> expResult = null;
//        ArrayList<Product> result = instance.find(pageNum, size);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of find method, of class ProductRepository.
//     */
//    @Test
//    public void testFind_UUID() {
//        System.out.println("find");
//        UUID productId = null;
//        ProductRepository instance = new ProductRepository();
//        Product expResult = null;
//        Product result = instance.find(productId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of getProductListFor method, of class ProductRepository.
//     */
//    @Test
//    public void testGetProductListFor() {
//        System.out.println("getProductListFor");
//        UUID sellerId = null;
//        ProductRepository instance = new ProductRepository();
//        ArrayList<Product> expResult = null;
//        ArrayList<Product> result = instance.getProductListFor(sellerId);
//        assertEquals(expResult, result);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//
//    /**
//     * Test of updateProduct method, of class ProductRepository.
//     */
//    @Test
//    public void testUpdateProduct() {
//        System.out.println("updateProduct");
//        Product product = null;
//        ProductRepository instance = new ProductRepository();
//        instance.updateProduct(product);
//        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
//    }
//    
}
