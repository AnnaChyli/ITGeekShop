package ecommerce.controller;

import ecommerce.database.ProductRepository;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Product;
import ecommerce.domain.ShoppingCart;
import ecommerce.domain.ShoppingCartItem;
import ecommerce.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Ganna
 */
@Controller
@Scope("request")
public class ShoppingCartController {

    @Autowired
    private ShoppingCart _cart;
    private final IProductRepository productRepository = new ProductRepository();

    @RequestMapping(value = "/shoppingCart/cart.htm", method = RequestMethod.GET)
    public String showShoppingCart(Model model) {
        model.addAttribute("shoppingCart", _cart);

        for (ShoppingCartItem i : _cart.getItems()) {
            Product product = productRepository.find(i.getProductId());
            int quanityInStore = product.getQuantity();
            i.setQuantityInStore(quanityInStore);
        }
        return "shoppingCart";
    }

    @RequestMapping(value = "/shoppingCart/cart.htm", method = RequestMethod.POST)//Displays the shoppingCart form!!???????
    public String addItem(@ModelAttribute("cartItem") ShoppingCartItem cartItem, BindingResult result) {
        if (_cart.isItemExist(cartItem.getProductId())) {
            return "redirect:/shoppingCart/cart.htm";
        } else {
            _cart.add(cartItem);
            return "redirect:/shoppingCart/cart.htm";
        }
        //add product to shopping cart
    }

    @RequestMapping(value = "/shoppingCart/removeItem.htm")//Displays the shoppingCart form!!???????
    public String removeItem(@RequestParam String itemId, Model model) {
        _cart.remove(itemId);
        return "redirect:/shoppingCart/cart.htm";

        //add product to shopping cart
    }

    @RequestMapping(value = "/shoppingCart/updateItem.htm", method = RequestMethod.POST, headers = {"Content-type=application/json"})//Displays the shoppingCart form!!???????
    @ResponseBody
    public String updateItem(@RequestBody ShoppingCartItem item, Model model) {
        _cart.updateShoppingCartItem(item.getProductId(), item.getQuantity());
        return "{}";
    }

    @RequestMapping(value = "/shoppingCart/updateItem.htm", method = RequestMethod.GET)//Displays the shoppingCart form!!???????
    public String updateItem(Model model) {
        return "redirect:/shoppingCart/cart.htm";
    }

    @RequestMapping(value = "/shoppingCart/checkout.htm", method = RequestMethod.GET)
    public String checkout(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (!_cart.getItems().isEmpty()) {
            User user = null;
            if (principal instanceof User) {
                user = ((User) principal);

                //check for availability
                for(ShoppingCartItem item : _cart.getItems())
                {
                    if(item.getQuantity() <= 0 || item.isAvailableToSell()== false)
                    {
                        return "shoppingCart";
                    }
                }               
                return "checkout";
            } else {
                return "login";
            }
        } else {
            return "index";
        }
    }
}
