package cl.tbd.back.repositoryMongo;

import org.bson.Document;
import java.util.List;

public interface AgreggateRepository {
    public List<Document> insertar();
}
