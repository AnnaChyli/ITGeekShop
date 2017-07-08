/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import java.util.ArrayList;

/**
 *
 * @author Ganna
 */
public interface IOrderRepository {
    
    void addOrder(Order order);
    ArrayList<Order> getOrdersBySeller(String sellerId);
}
