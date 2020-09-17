package cl.tbd.back.serviceMongo;

import cl.tbd.back.modelMongo.Emergencia;
import cl.tbd.back.repositoryMongo.EmergenciaRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmergenciaService {

    private final EmergenciaRepository emergenciaRepository;
    EmergenciaService(EmergenciaRepository emergenciaRepository){
        this.emergenciaRepository = emergenciaRepository;
    }

    @PostMapping("/mongoemergencia")
    @ResponseBody
    public Emergencia createEmergencia(@RequestBody Emergencia emergencia){
        Emergencia emergenciacreada = emergenciaRepository.createEmergencia(emergencia);
        return emergenciacreada;
    }

    @GetMapping("/mongoemergencia/count")
    public String countEmergencia(){
        int emergencias = emergenciaRepository.countEmergencia();
        return String.format("Hay %s Emergencias", emergencias);
    }
    
    @GetMapping("/mongoemergencia")
    public List<Emergencia> getEmergencia(){
        return emergenciaRepository.getEmergencia();
    }
}
