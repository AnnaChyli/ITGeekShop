/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Ganna
 */
public class OrderFactory {
    
    public Order CreateOrder(ShoppingCart cart)
    {
        Order order = new Order();
        //orderItems = new ArrayList<>();
        Date date = Calendar.getInstance().getTime();
        order.setDate(date);
        if (!cart.getItems().isEmpty()) {
            for (ShoppingCartItem i : cart.getItems()) {
                
                if(i.getQuantity() != 0){
                OrderLine item = new OrderLine();
                item.setProductId(i.getProductId());
                item.setName(i.getName());
                item.setPrice(i.getPrice());
                item.setQuantity(i.getQuantity());
                order.addOrderItem(item);
                }
            }
        }
        return order;
    }
}
            
            
    

