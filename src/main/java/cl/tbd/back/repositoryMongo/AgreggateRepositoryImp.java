package cl.tbd.back.repositoryMongo;

import com.mongodb.Block;
import com.mongodb.DBObject;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Accumulators;
import com.mongodb.client.model.Accumulators.*;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Projections;
import static com.mongodb.client.model.Aggregates.*;

import org.bson.Document;
import org.bson.conversions.Bson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.CountOperation;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Repository
public class AgreggateRepositoryImp implements  AgreggateRepository {

    @Autowired
    MongoDatabase database;

    @Override
    public List<Document> insertar(){
        Bson ContTareas = new Document("$size","$tareas");

        MongoCollection emergencias = database.getCollection("emergencia");
        AggregateIterable<Document> emers = emergencias.aggregate(
                Arrays.asList(
                        Aggregates.project(
                                Projections.fields(
                                        Projections.excludeId(),
                                        Projections.include("nombre"),
                                        Projections.computed("tareas", ContTareas)
                                )
                        )

                )
        );


        ArrayList<Document> arreglofinal = new ArrayList<>(   );
        
        for (Document document : emers) {
            arreglofinal.add(document);
        }
        
        return arreglofinal;
    }

}
