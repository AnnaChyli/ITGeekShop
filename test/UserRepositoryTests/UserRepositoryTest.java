/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserRepositoryTests;

import ecommerce.database.UserRepository;
import ecommerce.domain.User;
import org.junit.Test;

/**
 *
 * @author Ganna
 */
public class UserRepositoryTest {
    
    @Test
//    @Ignore
    public  void testFindUserBytLogin(){
    
    UserRepository rep = new UserRepository();
    User user = new User();

    user = rep.getUserByLogin("a.chilikina@hotmail.com");    
       
    System.out.println(user.getId());
    
        String userId = user.getId();
    }
}
