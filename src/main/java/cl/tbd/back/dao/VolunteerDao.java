package cl.tbd.back.dao;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import cl.tbd.back.model.Volunteer;

public interface VolunteerDao {

    int insertVolunteer(UUID id, Volunteer volunteer);

    default int insertVolunteer(Volunteer volunteer) {
        UUID id = UUID.randomUUID();
        return insertVolunteer(id, volunteer);
    }

    List<Volunteer> selectAllVolunteers();

    Optional<Volunteer> selectVolunteerByRut(int id);

    int updateVolunteerNameByRut(int rut, Volunteer volunteer);

    int deleteVolunteerByRut(int rut);

    List<Volunteer> selectAllVolunteersByAbility(UUID idAbility);

    List<Volunteer> selectAllVolunteersByEmergency(UUID idEmergency);

}