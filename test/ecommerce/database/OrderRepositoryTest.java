/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

import ecommerce.domain.Order;
import java.util.ArrayList;
import static org.junit.Assert.assertEquals;
import org.junit.Ignore;
import org.junit.Test;

/**
 *
 * @author Ganna
 */
public class OrderRepositoryTest {
    
    public OrderRepositoryTest() {
    }
    
    
    /**
     * Test of getCollectionName method, of class OrderRepository.
     */
    @Ignore
    @Test
    public void testGetCollectionName() {
        System.out.println("getCollectionName");
        OrderRepository instance = new OrderRepository();
        String expResult = "";
        String result = instance.getCollectionName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getClassName method, of class OrderRepository.
     */
    @Ignore
    @Test
    public void testGetClassName() {
        System.out.println("getClassName");
        OrderRepository instance = new OrderRepository();
        Class<Order> expResult = null;
        Class<Order> result = instance.getClassName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of addOrder method, of class OrderRepository.
     */
    @Ignore
    @Test    
    public void testAddOrder() {
        System.out.println("addOrder");
        Order order = null;
        OrderRepository instance = new OrderRepository();
        instance.addOrder(order);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of getOrdersBySeller method, of class OrderRepository.
     */
    @Test
    public void testGetOrdersBySeller() {
        System.out.println("getOrdersBySeller");
        String sellerId = "9a79cdc7-b946-4a0d-91ef-2a2972bff10d";
        OrderRepository instance = new OrderRepository();
        int expResult = 0;
        ArrayList<Order> result = instance.getOrdersBySeller(sellerId);
        //assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        System.out.println("Result = " + result.size());
    }
    
}
