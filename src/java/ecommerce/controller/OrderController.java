package ecommerce.controller;

import ecommerce.database.OrderRepository;
import ecommerce.database.ProductRepository;
import ecommerce.domain.IOrderRepository;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Order;
import ecommerce.domain.OrderFactory;
import ecommerce.domain.Product;
import ecommerce.domain.ShoppingCart;
import ecommerce.domain.ShoppingCartItem;
import ecommerce.domain.User;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Ganna
 */
@Controller
@Scope("request")
public class OrderController {

    @Autowired
    private ShoppingCart _cart;
    private final IOrderRepository orderRepository = new OrderRepository();
    private final IProductRepository productRepository = new ProductRepository();
    private final OrderFactory orderFactory = new OrderFactory();

    @RequestMapping(value = "order/placeOrder")
    public String placeOrder(Model model) {

        ArrayList<ShoppingCartItem> listOfItems = _cart.getItems();
        for (ShoppingCartItem i : listOfItems) {
            if (!productRepository.isProductAvailable(i.getProductId(), i.getQuantity())) {
                return "shoppingCart";
            }
        }

        Order order = orderFactory.CreateOrder(_cart);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = null;

        if (principal instanceof User) {
            //Get userId
            user = ((User) principal);
            order.setUserId(user.getId());

            // save order to DB
            orderRepository.addOrder(order);

            //Update Product remains
            Product newProduct = new Product();
            for (ShoppingCartItem item : listOfItems) {
                int newQuantity = item.getQuantityInStore() - item.getQuantity();
                productRepository.updateProductQuantity(item.getProductId(), newQuantity);
            }
            // clean cart
            _cart.clear();

            return "confirmation";
        } else {
            return "index";
        }
    }

}
