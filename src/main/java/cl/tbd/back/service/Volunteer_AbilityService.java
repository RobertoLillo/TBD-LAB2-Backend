package cl.tbd.back.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cl.tbd.back.dao.Volunteer_AbilityDao;
import cl.tbd.back.model.Volunteer_Ability;

@Service
public class Volunteer_AbilityService {

    private final Volunteer_AbilityDao volunteer_AbilityDao;

    @Autowired
    public Volunteer_AbilityService(@Qualifier("postgresVolunteer_Ability") Volunteer_AbilityDao volunteer_AbilityDao) {
        this.volunteer_AbilityDao = volunteer_AbilityDao;
    }

    public int insertVolunteer_Ability(Volunteer_Ability volunteerAbility) {
        return volunteer_AbilityDao.insertVolunteer_Ability(volunteerAbility);
    }

    public List<Volunteer_Ability> selectAllVolunteers_Abilities() {
        return volunteer_AbilityDao.selectAllVolunteers_Abilities();
    }

    public int deleteVolunteer_AbilityById(UUID id) {
        return volunteer_AbilityDao.deleteVolunteer_AbilityById(id);
    }

}
