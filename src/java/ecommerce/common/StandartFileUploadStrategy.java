/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import java.io.File;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Ganna
 */
public class StandartFileUploadStrategy extends FileUploadStrategy {

    @Override
    public void upload(MultipartFile file, String fileName) throws IOException{
        File image = new File(destinationDir + fileName + ".jpeg");
        file.transferTo(image);
    }

}
