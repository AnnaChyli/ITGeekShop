/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Ganna
 */
public abstract class FileUploadStrategy {
    protected static final String destinationDir = "D:/temp/";
    public abstract void upload(MultipartFile file, String fileName) throws IOException ;        
    
}
