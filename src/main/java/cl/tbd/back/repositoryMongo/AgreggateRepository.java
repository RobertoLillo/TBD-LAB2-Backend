package cl.tbd.back.repositoryMongo;

import com.mongodb.DBObject;
import com.mongodb.DocumentToDBRefTransformer;

import org.bson.Document;
import java.util.List;

public interface AgreggateRepository {
    public List<Document> insertar();
}
