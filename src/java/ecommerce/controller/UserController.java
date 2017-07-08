package ecommerce.controller;

import ecommerce.database.UserRepository;
import ecommerce.domain.Account;
import ecommerce.domain.IUserRepository;
import ecommerce.domain.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Ganna
 */
@Controller
public class UserController {

    IUserRepository repository = new UserRepository();

    @RequestMapping(value = "/user/register.htm", method = RequestMethod.GET)
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/user/register.htm", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") User user, Model model, BindingResult result) {
        
        //Check if User with such Login exists
        if(repository.getUserByLogin(user.getAccount().getLogin()) == null){
            repository.addUser(user);
            return "redirect:/user/login.htm"; 
        }else{
            model.addAttribute("userExist", true);
            return "redirect:/user/register.htm"; 
        }                
                 
    }
    
    @RequestMapping(value = "/user/login")
    public String showLoginForm(Model model) {
        model.addAttribute("account", new Account());
                     
        return "login";
    }

    @RequestMapping(value = "/user/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/user/login.htm";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }

//    @RequestMapping(value = "/user/login.htm", method = RequestMethod.POST)
//    public String login(@ModelAttribute("account") Account account, BindingResult result) {
//
//        if (repository.isUserExist(account.getLogin(), account.getPassword())) {
//            return "index";
//        } else {
//            return "login";
//        }
//    }
}
