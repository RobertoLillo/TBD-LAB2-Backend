package cl.tbd.back.dao.das;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import cl.tbd.back.dao.Volunteer_AbilityDao;
import cl.tbd.back.model.Volunteer_Ability;

@Repository("postgresVolunteer_Ability")
public class Volunteer_AbilityDataAccessService implements Volunteer_AbilityDao {

    @Autowired
    @Qualifier("db1")
    private Sql2o db1;

    @Autowired
    @Qualifier("db2")
    private Sql2o db2;

    @Autowired
    @Qualifier("db3")
    private Sql2o db3;

    @Override
    public int insertVolunteer_Ability(UUID id, Volunteer_Ability volunteer_Ability) {
        final String sql = "INSERT INTO volunteers_abilities (id, rut, id_ability) VALUES (:id, :rut, :id_ability)";
        Connection source;

        if (volunteer_Ability.getRut() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        }
        else if (volunteer_Ability.getRut() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        }
        else { //if (volunteer_Ability.getRut() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql)
            .addParameter("id", id)
            .addParameter("rut", volunteer_Ability.getRut())
            .addParameter("id_ability", volunteer_Ability.getIdAbility())
            .executeUpdate();
        return 0;
    }

    @Override
    public List<Volunteer_Ability> selectAllVolunteers_Abilities() {
        final String sql = "SELECT * FROM volunteers_abilities";
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        List<Volunteer_Ability> db1List= source.createQuery(sql).executeAndFetch(Volunteer_Ability.class);

        // Búsqueda en database 2
        source = db2.open();
        List<Volunteer_Ability> db2List= source.createQuery(sql).executeAndFetch(Volunteer_Ability.class);

        // Búsqueda en database 3
        source = db3.open();
        List<Volunteer_Ability> db3List= source.createQuery(sql).executeAndFetch(Volunteer_Ability.class);

        List<Volunteer_Ability> temp = Stream.concat(db1List.stream(), db2List.stream()).collect(Collectors.toList());
        List<Volunteer_Ability> result = Stream.concat(temp.stream(), db3List.stream()).collect(Collectors.toList());

        return result;
    }

}