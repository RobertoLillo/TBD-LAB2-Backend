package cl.tbd.back.repositoryMongo;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import cl.tbd.back.modelMongo.Tarea;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TareaRepositoryImp implements TareaRepository {
    @Autowired
    MongoDatabase database;
    
    @Override
    public Tarea createTarea(Tarea tarea) {
        MongoCollection<Tarea> tareas = database.getCollection("tarea", Tarea.class);
        tareas.insertOne(tarea);
        return tarea;
    }

    @Override
    public int countTarea() {
        MongoCollection<Document> tareas = database.getCollection("tarea");
        long total_tareas = tareas.countDocuments();
        return (int) total_tareas;
    }

    @Override
    public List<Tarea> getTarea() {
        MongoCollection<Tarea> tareas = database.getCollection("tarea", Tarea.class);
        List<Tarea> Tareas = tareas.find().into(new ArrayList<>());
        return Tareas;
    }
}
