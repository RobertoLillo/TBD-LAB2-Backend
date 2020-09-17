package cl.tbd.back.repositoryMongo;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import cl.tbd.back.modelMongo.Emergencia;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class EmergenciaRepositoryImp implements EmergenciaRepository {
    @Autowired
    MongoDatabase database;

    @Override
    public Emergencia createEmergencia(Emergencia emergencia) {
        MongoCollection<Emergencia> emergencias = database.getCollection("emergencia", Emergencia.class);
        emergencias.insertOne(emergencia);
        return emergencia;
    }

    @Override
    public int countEmergencia() {
        MongoCollection<Document> emergencias = database.getCollection("emergencia");
        long total_emergencias = emergencias.countDocuments();
        return (int) total_emergencias;
    }

    @Override
    public List<Emergencia> getEmergencia() {
        MongoCollection<Emergencia> emergencias = database.getCollection("emergencia", Emergencia.class);
        List <Emergencia> Emergencias = emergencias.find().into(new ArrayList<>());
        return Emergencias;
    }

}
