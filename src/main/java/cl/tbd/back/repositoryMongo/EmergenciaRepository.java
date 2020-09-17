package cl.tbd.back.repositoryMongo;

import cl.tbd.back.modelMongo.Emergencia;

import java.util.List;

public interface EmergenciaRepository {
    public Emergencia createEmergencia(Emergencia emergencia);
    public int countEmergencia();
    public List<Emergencia> getEmergencia();
}
