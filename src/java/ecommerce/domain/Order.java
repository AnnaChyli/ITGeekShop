/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ganna
 */
@Service
public class Order implements Serializable {

    private String orderId;
    private String userId;
    private Date date;
    private ArrayList<OrderLine> orderItems;

    public double calculateTotal() {
        double summ = 0;
        for (OrderLine item : getItems()) {
            summ += (item.getPrice() * item.getQuantity());
        }
        return summ;
    }
    
    public Order(){
        orderItems = new ArrayList<>();
    }

    

    /**
     * @return the orderId
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the items
     */
    public ArrayList<OrderLine> getItems() {
        return orderItems;
    }

    /**
     * @param items the items to set
     */
    public void setItems(ArrayList<OrderLine> items) {
        this.orderItems = items;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public void addOrderItem(OrderLine item){
        orderItems.add(item);
    }
}
