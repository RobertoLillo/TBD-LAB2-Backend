package cl.tbd.back.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cl.tbd.back.dao.VolunteerDao;
import cl.tbd.back.model.Volunteer;

@Service
public class VolunteerService {

    private final VolunteerDao volunteerDao;

    @Autowired
    public VolunteerService(@Qualifier("postgresVolunteer") VolunteerDao volunteerDao) {
        this.volunteerDao = volunteerDao;
    }

    public int insertVolunteer(Volunteer volunteer) {
        return volunteerDao.insertVolunteer(volunteer);
    }

    public List<Volunteer> selectAllVolunteers() {
        return volunteerDao.selectAllVolunteers();
    }

    public Optional<Volunteer> selectVolunteerByRut(int rut) {
        return volunteerDao.selectVolunteerByRut(rut);
    }

    public int updateVolunteerNameByRut(int rut, Volunteer volunteer) {
        return volunteerDao.updateVolunteerNameByRut(rut, volunteer);
    }

    public int deleteVolunteerByRut(int rut) {
        return volunteerDao.deleteVolunteerByRut(rut);
    }

    public List<Volunteer> selectAllVolunteersByAbility(UUID id) {
        return volunteerDao.selectAllVolunteersByAbility(id);
    }

    public List<Volunteer> selectAllVolunteersByEmergency(UUID id) {
        return volunteerDao.selectAllVolunteersByEmergency(id);
    }

}