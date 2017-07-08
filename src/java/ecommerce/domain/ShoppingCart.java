/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import java.io.Serializable;
import java.util.ArrayList;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ganna
 */
@Service
@Scope("session")
public class ShoppingCart implements Serializable {

    private ArrayList<ShoppingCartItem> _items;

    public ShoppingCart() {
        this._items = new ArrayList<>();
    }

    public void add(ShoppingCartItem item) {
        getItems().add(item);
    }

    public void remove(String itemId) {
        ShoppingCartItem itemToDelete = new ShoppingCartItem();
        for (ShoppingCartItem item : _items) {
            
            if(item.getProductId() == null ? itemId == null : item.getProductId().equals(itemId))
            {
                itemToDelete = item;
                break;
            }
        }
        _items.remove(itemToDelete);
    }

    public void clear() {
        getItems().clear();
    }

    public int count() {
        return getItems().size();
    }
 
    public double total() {
        double summ = 0;
        for (ShoppingCartItem item : getItems()) {
            summ += (item.getPrice() * item.getQuantity());
        }
        return summ;
    }

    public ArrayList<ShoppingCartItem> getItems() {
        return _items;
    }

    public void setItems(ArrayList<ShoppingCartItem> _items) {
        this._items = _items;
    }
    
    public void updateShoppingCartItem(String itemId, int quantity)
    {
       ShoppingCartItem itemToUpdate = new ShoppingCartItem();
        for (ShoppingCartItem item : _items) {
            
            if(item.getProductId() == null ? itemId == null : item.getProductId().equals(itemId))
            {
                itemToUpdate = item;
                break;
            }
        } 
        itemToUpdate.setQuantity(quantity);
    }
    
    public boolean isItemExist(String productId){
        for(ShoppingCartItem item : _items){
            return item.getProductId().equals(productId);
        }
        return false;
    }
}
