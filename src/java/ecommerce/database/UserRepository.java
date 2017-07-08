/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import ecommerce.domain.IUserRepository;
import ecommerce.domain.User;
import java.util.UUID;
import org.bson.Document;

/**
 *
 * @author Ganna
 */
public class UserRepository extends BaseRepository<User> implements IUserRepository {

    public UserRepository() {
        super();
    }
    
    @Override
    protected String getCollectionName() {
        return "users";
    }

    @Override
    protected Class<User> getClassName() {
        return User.class;
    }

    @Override
    public void addUser(User user) {
        user.setId(UUID.randomUUID().toString());
        Document doc = Document.parse(serializer.serialize(user));
        db.getCollection("users").insertOne(doc);
    }

    @Override
    public boolean isUserExist(String login, String password) {
        Document doc = db.getCollection("users").find(and(eq("account.login", login), eq("account.password", password))).first();
        return doc != null;
    }

    @Override
    public User getUserByLogin(String login) {
        Document doc = db.getCollection("users").find(eq("account.login", login)).first();
        if(doc == null)
            return null;
        
        String json = doc.toJson();
        User user = serializer.deserialize(json, User.class);
        return user;
    }

    
}
