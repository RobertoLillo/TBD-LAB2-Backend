package cl.tbd.back.dao;

import java.util.List;
import java.util.UUID;

import cl.tbd.back.model.Volunteer_Ability;

public interface Volunteer_AbilityDao {

    int insertVolunteer_Ability(UUID id, Volunteer_Ability volunteer_Ability);

    default int insertVolunteer_Ability(Volunteer_Ability volunteer_Ability) {
        UUID id = UUID.randomUUID();
        return insertVolunteer_Ability(id, volunteer_Ability);
    }

    List<Volunteer_Ability> selectAllVolunteers_Abilities();

    int deleteVolunteer_AbilityById(UUID id);

}