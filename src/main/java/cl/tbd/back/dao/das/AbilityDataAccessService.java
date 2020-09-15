package cl.tbd.back.dao.das;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import cl.tbd.back.dao.AbilityDao;
import cl.tbd.back.model.Ability;
import cl.tbd.back.model.Volunteer_Ability;

@Repository("postgresAbility")
public class AbilityDataAccessService implements AbilityDao {

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
    public int insertAbility(UUID id, Ability ability) {
        final String sql = "INSERT INTO abilities (id, description) VALUES (:id, :description)";
        Connection source;

        if (id.hashCode() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (id.hashCode() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (id.hashCode() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("id", id).addParameter("description", ability.getDescription())
                .executeUpdate();
        return 0;
    }

    @Override
    public List<Ability> selectAllAbilities() {
        final String sql = "SELECT * FROM abilities";
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        List<Ability> db1List = source.createQuery(sql).executeAndFetch(Ability.class);

        // Búsqueda en database 2
        source = db2.open();
        List<Ability> db2List = source.createQuery(sql).executeAndFetch(Ability.class);

        // Búsqueda en database 3
        source = db3.open();
        List<Ability> db3List = source.createQuery(sql).executeAndFetch(Ability.class);

        List<Ability> temp = Stream.concat(db1List.stream(), db2List.stream()).collect(Collectors.toList());
        List<Ability> result = Stream.concat(temp.stream(), db3List.stream()).collect(Collectors.toList());

        return result;
    }

    @Override
    public Optional<Ability> selectAbilityById(UUID id) {
        final String sql = "SELECT * FROM abilities WHERE id = :searchId";
        Optional<Ability> result;
        Connection source;

        if (id.hashCode() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (id.hashCode() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (id.hashCode() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        result = source.createQuery(sql).addParameter("searchId", id).executeAndFetch(Ability.class).stream()
                .findFirst();

        return result;
    }

    @Override
    public int updateAbilityDescriptionById(UUID id, Ability ability) {
        final String sql = "UPDATE abilities SET description = :description WHERE id = :id";
        Connection source;

        if (id.hashCode() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (id.hashCode() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (id.hashCode() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("id", id).addParameter("description", ability.getDescription())
                .executeUpdate();

        return 0;
    }

    @Override
    public int deleteAbilityById(UUID id) {
        final String sql = "DELETE FROM abilities WHERE id = :searchId";
        Connection source;

        if (id.hashCode() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (id.hashCode() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (id.hashCode() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("searchId", id).executeAndFetch(Ability.class).stream().findFirst();

        return 0;
    }

    // Other methods

    @Override
    public List<Ability> selectAbilitiesByRut(int rut) {
        final String sql = "SELECT * FROM volunteers_abilities WHERE rut = :rut";
        Connection source;
        List<Volunteer_Ability> volunteersAbilities;

        if (rut % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (rut % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (rut % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        volunteersAbilities = source.createQuery(sql).addParameter("rut", rut).executeAndFetch(Volunteer_Ability.class);

        int i;
        List<Ability> finalResult = new ArrayList<>();
        final String sqlSearch = "SELECT * FROM abilities WHERE id = :searchId";
        for (i = 0; i < volunteersAbilities.size(); i++) {
            Volunteer_Ability temporal = volunteersAbilities.get(i);

            if (temporal.getIdAbility().hashCode() % 3 == 0) {
                source = db1.open(); // Búsqueda en database 1
            } else if (temporal.getIdAbility().hashCode() % 3 == 1) {
                source = db2.open(); // Búsqueda en database 2
            } else { // if (temporal.getIdAbility().hashCode() % 3 == 2)
                source = db3.open(); // Búsqueda en database 3
            }

            finalResult.add(source.createQuery(sqlSearch).addParameter("searchId", temporal.getIdAbility())
                    .executeAndFetch(Ability.class).stream().findFirst().orElse(null));
        }

        return finalResult;

    }

}