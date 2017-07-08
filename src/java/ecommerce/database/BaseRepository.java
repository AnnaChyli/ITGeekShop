/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

import static com.mongodb.client.model.Filters.eq;
import ecommerce.common.IEntitySerializer;
import ecommerce.common.JsonSerializer;
import org.bson.Document;

/**
 *
 * @author Ganna
 */
public abstract class BaseRepository<T> {
    
    protected IEntitySerializer<T> serializer;
    protected DataBase db;
    
    public BaseRepository(){
       db = DataBase.getInstance();
       serializer = new JsonSerializer<>();
    }
    
    
    protected T findById(String id){
        Document doc = db.getCollection(getCollectionName()).find(eq("id", id)).first();
        if(doc == null) {
            return null;
        }

        String json = doc.toJson();
        return serializer.deserialize(json, getClassName()); 
    }
    
    protected abstract String getCollectionName();
    protected abstract Class<T> getClassName();
}
