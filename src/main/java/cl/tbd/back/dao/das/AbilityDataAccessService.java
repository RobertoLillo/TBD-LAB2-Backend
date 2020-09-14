package cl.tbd.back.dao.das;

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

        if (ability.getDescription().length() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        }
        else if (ability.getDescription().length() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        }
        else { //if (ability.getDescription().length() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql)
            .addParameter("id", id)
            .addParameter("description", ability.getDescription())
            .executeUpdate();
        return 0;
    }

    @Override
    public List<Ability> selectAllAbilities() {
        final String sql = "SELECT * FROM abilities";
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        List<Ability> db1List= source.createQuery(sql).executeAndFetch(Ability.class);

        // Búsqueda en database 2
        source = db2.open();
        List<Ability> db2List= source.createQuery(sql).executeAndFetch(Ability.class);

        // Búsqueda en database 3
        source = db3.open();
        List<Ability> db3List= source.createQuery(sql).executeAndFetch(Ability.class);

        List<Ability> temp = Stream.concat(db1List.stream(), db2List.stream()).collect(Collectors.toList());
        List<Ability> result = Stream.concat(temp.stream(), db3List.stream()).collect(Collectors.toList());

        return result;
    }

    @Override
    public Optional<Ability> selectAbilityById(UUID id) {
        final String sql = "SELECT * FROM abilities WHERE id = :searchId";
        Optional<Ability> result;
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        result = source.createQuery(sql)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            return result;
        }

        // Búsqueda en database 2
        source = db2.open();
        result = source.createQuery(sql)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            return result;
        }

        // Búsqueda en database 3
        source = db3.open();
        result = source.createQuery(sql)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        return result;
    }

    @Override
    public int updateAbilityDescriptionById(UUID id, Ability ability) {
        final String sqlSearch = "SELECT * FROM abilities WHERE id = :searchId";
        final String sqlFinal = "UPDATE abilities SET description = :description WHERE id = :id";
        Optional<Ability> result;
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .addParameter("description", ability.getDescription())
                .executeUpdate();
            return 0;
        }

        // Búsqueda en database 2
        source = db2.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .addParameter("description", ability.getDescription())
                .executeUpdate();
            return 0;
        }

        // Búsqueda en database 3
        source = db3.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .addParameter("description", ability.getDescription())
                .executeUpdate();
            return 0;
        }

        // No encontrado
        return 1;
    }

    @Override
    public int deleteAbilityById(UUID id) {
        final String sqlSearch = "SELECT * FROM abilities WHERE id = :searchId";
        final String sqlFinal = "DELETE FROM abilities WHERE id = :id";
        Optional<Ability> result;
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .executeUpdate();
            return 0;
        }

        // Búsqueda en database 2
        source = db2.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .executeUpdate();
            return 0;
        }

        // Búsqueda en database 3
        source = db3.open();
        result = source.createQuery(sqlSearch)
            .addParameter("searchId", id)
            .executeAndFetch(Ability.class)
            .stream()
            .findFirst();

        if (result.isEmpty() == false) {
            source.createQuery(sqlFinal)
                .addParameter("id", id)
                .executeUpdate();
            return 0;
        }

        // No encontrado
        return 1;
    }

}