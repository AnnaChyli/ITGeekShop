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
public interface IUserRepository {
    void addUser(User user);
    boolean isUserExist(String login, String password);
    User getUserByLogin(String login);
}
