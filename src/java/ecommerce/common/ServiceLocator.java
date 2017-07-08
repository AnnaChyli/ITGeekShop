/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Ganna
 */
public class ServiceLocator {
    
    public FileUploadStrategy chooseStrategy(MultipartFile file, String fileName){
        
        if(file.getContentType().equals("jpeg")) {
            return new StandartFileUploadStrategy();
        } else {
            return new ConvertedFileUploadStrategy();
        }
    }
    
}
