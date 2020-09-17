package cl.tbd.back.serviceMongo;

import cl.tbd.back.modelMongo.Tarea;
import cl.tbd.back.repositoryMongo.TareaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class TareaService {
    
    private final TareaRepository tareaRepository;
    TareaService(TareaRepository tareaRepository){
        this.tareaRepository = tareaRepository;
    }

    @PostMapping("/mongotarea")
    @ResponseBody
    public Tarea createTarea(@RequestBody Tarea tarea){
        Tarea tareacreada = tareaRepository.createTarea(tarea);
        return tareacreada;
    }

    @GetMapping("/mongotarea/count")
    public String countTarea(){
        int tareas = tareaRepository.countTarea();
        return String.format("Hay %s tareas", tareas);
    }

    @GetMapping("/mongotarea")
    public List<Tarea> getTarea(){
        return tareaRepository.getTarea();
    }
}
