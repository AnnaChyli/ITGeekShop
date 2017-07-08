package ecommerce.database;

import com.mongodb.client.FindIterable;
import ecommerce.domain.IOrderRepository;
import ecommerce.domain.Order;
import java.util.ArrayList;
import java.util.UUID;
import org.bson.Document;

/**
 *
 * @author Ganna
 */
public class OrderRepository extends BaseRepository<Order> implements IOrderRepository {

    public OrderRepository() {
        super();
    }

    @Override
    protected String getCollectionName() {
        return "orders";
    }

    @Override
    protected Class<Order> getClassName() {
        return Order.class;
    }

    @Override
    public void addOrder(Order order) {
        order.setOrderId(UUID.randomUUID().toString());
        Document doc = Document.parse(serializer.serialize(order));
        db.getCollection("orders").insertOne(doc);
    }

    public ArrayList<Order> getOrdersBySeller(String sellerId) {

        FindIterable<Document> soldProducts = db.getCollection("orders").find();
        
        ArrayList<Order> orders = new ArrayList<>();
        
        for (Document doc : soldProducts) {
            String json = doc.toJson();        
            
            Order order = serializer.deserialize(json, Order.class);
            orders.add(order);                 
        }
        return orders;
    }
}
