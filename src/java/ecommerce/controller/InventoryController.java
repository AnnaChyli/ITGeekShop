package ecommerce.controller;

import ecommerce.common.FileUploadStrategy;
import ecommerce.common.FinancialCalculator;
import ecommerce.common.ServiceLocator;
import ecommerce.database.ProductRepository;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Product;
import ecommerce.domain.User;
import java.io.File;
import java.util.ArrayList;
import org.springframework.core.io.FileSystemResource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Ganna
 */
@Controller
public class InventoryController {

    private static final String destinationDir = "D:/temp/";
    IProductRepository repository = new ProductRepository();

    @RequestMapping(value = "/inventory/inventory.htm", method = RequestMethod.GET)
    public String showInventory(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = null;
        if (principal instanceof User) {
            user = ((User) principal);
        }
        ArrayList<Product> products = repository.getProductListFor(user.getId());  //!!!!!!!!!!!! how to manage NullPointerException
        model.addAttribute("products", products);

        return "inventory";
    }

    @RequestMapping(value = "/inventory/inventory.htm", method = RequestMethod.POST, headers = {"Content-type=application/json"})
    @ResponseBody
    public String updateProduct(@RequestBody Product product, Model model) {

        if (product.getQuantity() >= 0) {
            Product productToUpdate = repository.find(product.getId());

            productToUpdate.setQuantity(product.getQuantity());
            repository.updateProduct(productToUpdate);           
        } 
        return "{}";
    }

    @RequestMapping(value = "/inventory/addNewProduct.htm", method = RequestMethod.GET)
    public String showAddNewProductForm(Model model) {
        model.addAttribute("product", new Product());

        return "addNewProduct";
    }

    @RequestMapping(value = "/inventory/download.htm", method = RequestMethod.GET)
    @ResponseBody
    public FileSystemResource getFile(@RequestParam("fileName") String fileName) {

        File image = new File(destinationDir + fileName);
        return new FileSystemResource(image);
    }

    @RequestMapping(value = "/inventory/addNewProduct.htm", method = RequestMethod.POST)
    public String addItem(
            @RequestParam("name") String name,
            @RequestParam("author") String author,
            @RequestParam("description") String description,
            @RequestParam("category") String category,
            @RequestParam("ISBN") String isbn,
            @RequestParam("quantity") String quantity,
            @RequestParam("sellPrice") String sellPrice,
            @RequestParam("invoicePrice") String invoicePrice,
            @RequestParam("file") MultipartFile file) {

        Product product = new Product();
        product.setName(name);
        product.setAuthor(author);
        product.setCategory(category);
        product.setDescription(description);
        product.setInvoicePrice(Double.parseDouble(invoicePrice));
        product.setSellPrice(Double.parseDouble(sellPrice));
        product.setQuantity(Integer.parseInt(quantity));

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = null;
        if (principal instanceof User) {//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            user = ((User) principal);
            String userId = user.getId();
            product.setUserId(userId);
            String productId = repository.addProduct(product);

            if (!file.isEmpty()) {
                try {
                    ServiceLocator service = new ServiceLocator();
                    FileUploadStrategy fileUploader = service.chooseStrategy(file, productId);
                    fileUploader.upload(file, productId);
                } catch (Exception e) {
                    return "You failed to upload " + name + " => " + e.getMessage();
                }
            }

            return "redirect:/inventory/inventory.htm";
        } else {
            return "login";
        }
    }

    //inventory/updateProduct.htm
    @RequestMapping(value = "/inventory/financeInfo.htm", method = RequestMethod.GET)
    public String showFinancePage(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        User user = null;
        if (principal instanceof User) {

            user = ((User) principal);
            model.addAttribute("financeInfo", new FinancialCalculator(user.getId()));

            return "financialInfo";
        }
        return "";
        //for calculating and displaying the fin info
        //ArrayList<Product> products = repository.getProductListFor(null);
//        model.addAttribute("product", products);
//
//        Map<Product, String> productMap = new HashMap<Product, String>();
//
//        for (Product product : products) {
//            productMap.put(product, calculateSililarity.calculate(sessionUser.getUserId(), user.getUserId()));
//        }
//
//        model.addAttribute("productMap", productMap);
    }
}
