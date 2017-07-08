/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import ecommerce.database.OrderRepository;
import ecommerce.database.ProductRepository;
import ecommerce.domain.IOrderRepository;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Order;
import ecommerce.domain.OrderLine;
import java.util.ArrayList;

/**
 *
 * @author Ganna
 */
public class FinancialCalculator implements ICalculator {

    private final IOrderRepository orderRepository = new OrderRepository();
    private final IProductRepository productRepository = new ProductRepository();
    private String sellerId;

    public FinancialCalculator(String sellerId) {
        this.sellerId = sellerId;
    }

    public FinancialCalculator() {
    }

    @Override
    public double calculateCost() {
        ArrayList<Order> orders = orderRepository.getOrdersBySeller(sellerId);
        double amount = 0;
        if (orders != null) {
            for (Order order : orders) {
                for (OrderLine line : order.getItems()) {
                    if (productRepository.find(line.getProductId()).getUserId().equals(sellerId)) {

                        double invPrice = productRepository.find(line.getProductId()).getInvoicePrice();
                        amount += line.getQuantity() * invPrice;
                    }
                }
            }
        }
        return amount;
    }

    @Override
    public double calculateRevenue() {
        ArrayList<Order> orders = orderRepository.getOrdersBySeller(sellerId);
        double amount = 0;

        for (Order order : orders) {
            for (OrderLine line : order.getItems()) {
                if (productRepository.find(line.getProductId()).getUserId().equals(sellerId)) {

                    double sellPrice = line.getPrice();
                    amount += sellPrice * line.getQuantity();
                }
            }
        }

        return amount;
    }

    @Override
    public double calculateProfit() {
        return (calculateRevenue() - calculateCost());
    }

}
