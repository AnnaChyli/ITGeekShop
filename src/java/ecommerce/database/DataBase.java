/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

/**
 *
 * @author Ganna
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
/**
 *
 * @author Ganna
 */
public class DataBase {
    
   private static DataBase instance = null;
   private MongoClient client = new MongoClient();
   private MongoDatabase db = client.getDatabase("GeekShop");
   private DataBase() {

   }
   
   public static DataBase getInstance() {
      if(instance == null) {
         instance = new DataBase();
      }
      return instance;
   }

    public MongoCollection<Document> getCollection(String products) {
        return db.getCollection(products);
    }
   

}
       

