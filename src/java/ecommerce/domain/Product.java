/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

/**
 *
 * @author Ganna
 */
public class Product {
    
    
    private String id;
    private String userId;
    private String pictureId;
    private String name;
    private String author;
    private String description;
    private double invoicePrice;
    private double sellPrice;
    private int quantity;
    private String category;
    private String ISBN;
    
    /**
     * @return the ProductId
     */
    public String getId() {
        return id;
    }

    /**
     * @param productId
     */
    public void setId(String productId) {
        this.id = productId;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * @return the pictureId
     */
    public String getPictureId() {
        return pictureId;
    }

    /**
     * @param pictureId the pictureId to set
     */
    public void setPictureId(String pictureId) {
        this.pictureId = pictureId;
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
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the invoicePrice
     */
    public double getInvoicePrice() {
        return invoicePrice;
    }

    /**
     * @param invoicePrice the invoicePrice to set
     */
    public void setInvoicePrice(double invoicePrice) {
        this.invoicePrice = invoicePrice;
    }

    /**
     * @return the sellPrice
     */
    public double getSellPrice() {
        return sellPrice;
    }

    /**
     * @param sellPrice the sellPrice to set
     */
    public void setSellPrice(double sellPrice) {
        this.sellPrice = sellPrice;
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
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the ISBN
     */
    public String getISBN() {
        return ISBN;
    }

    /**
     * @param ISBN the ISBN to set
     */
    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }
    
    
}
