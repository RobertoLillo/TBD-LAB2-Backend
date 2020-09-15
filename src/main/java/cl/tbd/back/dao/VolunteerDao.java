package cl.tbd.back.dao;

import java.util.List;
import java.util.Optional;

import cl.tbd.back.model.Volunteer;

public interface VolunteerDao {

    int insertVolunteer(Volunteer volunteer);

    List<Volunteer> selectAllVolunteers();

    Optional<Volunteer> selectVolunteerByRut(int id);

    int updateVolunteerNameByRut(int rut, Volunteer volunteer);

    int deleteVolunteerByRut(int rut);

    List<Volunteer> selectVolunteersByName(String name);

}