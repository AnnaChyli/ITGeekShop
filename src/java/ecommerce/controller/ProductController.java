/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.controller;

import ecommerce.common.PagedList;
import ecommerce.database.ProductRepository;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Product;
import ecommerce.domain.ShoppingCartItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Ganna Chylikina
 */
@Controller
public class ProductController {

    IProductRepository repository = new ProductRepository();

//     @RequestMapping("/product/category-grid")
//    public String showCatalogGrid(){
//        return "category-grid";
//    }
    @RequestMapping("/product/category-list")
    public String showCatalogList(@RequestParam int pageNum, @RequestParam int pageSize, @RequestParam String mode,
            @RequestParam String category, Model model) {

        
        PagedList<Product> products = repository.find(pageNum, pageSize, category);
        model.addAttribute("pagedList", products);
        model.addAttribute("mode", mode);
        model.addAttribute("category", category);
        model.addAttribute("cartItem", new ShoppingCartItem()); 

        if (mode.equals("grid")) {
            return "category-grid";
        } else {
            return "category-list";
        }

    }

    @RequestMapping("/product/product")
    public String showProduct(@RequestParam String productId, @RequestParam String category, Model model) {
        
        model.addAttribute("cartItem", new ShoppingCartItem());///????????????????
        Product productToDisplay = repository.find(productId);
        model.addAttribute("product", productToDisplay);
        return "product";
    }
    
     @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String access_denied(Model model) {
        
        return "error";
    }

}
