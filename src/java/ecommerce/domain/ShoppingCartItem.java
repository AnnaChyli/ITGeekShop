/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import java.io.Serializable;

/**
 *
 * @author Ganna
 */
public class ShoppingCartItem implements Serializable{
    private String productId;
    private String name;
    private int quantity;
    private double price;
    private int quantityInStore;

    /**
     * @return the productId
     */
    public String getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the quantityInStore
     */
    public int getQuantityInStore() {
        return quantityInStore;
    }

    /**
     * @param quantityInStore the quantityInStore to set
     */
    public void setQuantityInStore(int quantityInStore) {
        this.quantityInStore = quantityInStore;
    }
    
    public boolean isAvailableToSell(){
        return quantity <= quantityInStore;
    }
}
