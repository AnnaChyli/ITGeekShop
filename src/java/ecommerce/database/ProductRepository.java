/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.database;

import com.mongodb.client.FindIterable;
import static com.mongodb.client.model.Filters.eq;
import ecommerce.common.PagedList;
import ecommerce.domain.IProductRepository;
import ecommerce.domain.Product;
import java.util.ArrayList;
import java.util.UUID;
import org.bson.BsonDocument;
import org.bson.BsonString;
import org.bson.Document;

/**
 *
 * @author Ganna
 */
public class ProductRepository extends BaseRepository<Product> implements IProductRepository {

    public ProductRepository() {
        super();

    }
    
    @Override
    public void updateProductQuantity(String productId, int quantity){
        Product newProduct = findById(productId);
        newProduct.setQuantity(quantity);
        updateProduct(newProduct);
    }
    
    @Override
    public boolean isProductAvailable(String shopItemId, int quantity)
    {
        Product product = findById(shopItemId);
        
        return product.getQuantity() >= quantity;
    }

    @Override
    public String addProduct(Product product) {
        String id = UUID.randomUUID().toString();
        product.setId(id);
        Document doc = Document.parse(serializer.serialize(product));
        db.getCollection("products").insertOne(doc);
       
        return id;
    }

    @Override
    public ArrayList<Product> find(int pageNum, int size, UUID userId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public PagedList<Product> find(int pageNum, int size, String category) {
        FindIterable<Document> list = db.getCollection("products").find(eq("category", category))
                .skip(size*(pageNum-1))
                .limit(size);
        
        ArrayList<Product> products = new ArrayList<>();

        for (Document doc : list) {
            String json = doc.toJson();
            Product product = serializer.deserialize(json, Product.class);
            products.add(product);
        }
        PagedList pagedList = new PagedList();
        pagedList.setList(products);
        pagedList.setPageNum(pageNum);
        pagedList.setPageSize(size);
        
        long total = db.getCollection("products").count(new BsonDocument("category", new BsonString(category)));
        pagedList.setTotal(total);
        return pagedList;
    }

    @Override
    public ArrayList<Product> find(int pageNum, int size) {
        FindIterable<Document> list = db.getCollection("products").find()
                .skip(size*(pageNum-1))
                .limit(size);
        
        ArrayList<Product> products = new ArrayList<>();

        for (Document doc : list) {
            String json = doc.toJson();
            Product product = serializer.deserialize(json, Product.class);
            products.add(product);
        }
        return products;
    }

    @Override
    public Product findById(String productId) {

        Document doc = db.getCollection("products").find(eq("id", productId)).first();
        if(doc == null) {
            return null;
        }

        String json = doc.toJson();
        return serializer.deserialize(json, Product.class);
    }
    //Get inventory list
    @Override
    public ArrayList<Product> getProductListFor(String sellerId) {
        FindIterable<Document> list = db.getCollection("products").find(eq("userId", sellerId)); //edit for sellerId
        ArrayList<Product> products = new ArrayList<>();

        for (Document doc : list) {
            String json = doc.toJson();
            Product product = serializer.deserialize(json, Product.class);
            products.add(product);
        }
        return products;

    }

    @Override
    public void updateProduct(Product product) {
        Document doc = Document.parse(serializer.serialize(product));
        db.getCollection("products").replaceOne(eq("id", doc.get("id")), doc);
        // find(eq("id", id)).first()
    }

    @Override
    protected String getCollectionName() {
        return "products";
    }

    @Override
    protected Class<Product> getClassName() {
        return Product.class;
    }

    @Override
    public Product find(String productId) {
        return findById(productId);
    }

}

//list = db.getCollection("products").find(and(eq("category", category), eq("account.password", password)));
