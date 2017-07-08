
package ecommerce.common;

import static ecommerce.common.FileUploadStrategy.destinationDir;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Ganna
 */
public class ConvertedFileUploadStrategy extends FileUploadStrategy {

    private BufferedImage bufferedImage;
    
    @Override
    public void upload(MultipartFile file, String fileName) throws IOException {
        
        if(file.getContentType().equals("png") || file.getContentType().equals("bmp") || file.getContentType().equals("jpg"))
        {
             //read image file
	  bufferedImage = ImageIO.read(file.getInputStream());

	  // create a blank, RGB, same width and height, and a white background
	  BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
			bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
	  newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);

	  // write to jpeg file
	  ImageIO.write(newBufferedImage, "jpeg", new File(destinationDir + fileName + ".jpeg"));
        }
        else{
        File image = new File(destinationDir + fileName + ".jpeg");
        file.transferTo(image);
        }
    }
    
}
