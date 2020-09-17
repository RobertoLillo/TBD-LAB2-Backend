package cl.tbd.back.serviceMongo;

import cl.tbd.back.repositoryMongo.AgreggateRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import org.bson.Document;
import java.util.List;

@RestController
public class AgreggateService {
    private final AgreggateRepository agreggateRepository;
    
    AgreggateService(AgreggateRepository agreggateRepository){
        this.agreggateRepository = agreggateRepository;
    }

    @GetMapping("/aggregate")
    public List<Document> insertar(){
        return agreggateRepository.insertar();
    }

}
