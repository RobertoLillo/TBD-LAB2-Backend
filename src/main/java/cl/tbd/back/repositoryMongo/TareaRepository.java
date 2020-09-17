package cl.tbd.back.repositoryMongo;

import cl.tbd.back.modelMongo.Tarea;

import java.util.List;

public interface TareaRepository {
    public Tarea createTarea(Tarea tarea);
    public int countTarea();
    public List<Tarea> getTarea();
}
