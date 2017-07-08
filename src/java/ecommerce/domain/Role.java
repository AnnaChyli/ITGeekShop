/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.domain;

import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author Ganna
 */
public class Role implements GrantedAuthority{

    private String role;
    
    @Override
    public String getAuthority() {
        return this.getRole();
    }

    /**
     * @return the role
     */
    public String getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.role = role;
    }
    
    
}
