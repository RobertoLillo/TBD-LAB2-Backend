package cl.tbd.back.dao.das;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import cl.tbd.back.dao.VolunteerDao;
import cl.tbd.back.model.Volunteer;

@Repository("postgresVolunteer")
public class VolunteerDataAccessService implements VolunteerDao {

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
    public int insertVolunteer(Volunteer volunteer) {
        final String sql = "INSERT INTO volunteers (rut, name) VALUES (:rut, :name)";
        Connection source;

        if (volunteer.getRut() % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (volunteer.getRut() % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (volunteer.getRut() % 3 == 2) {
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("rut", volunteer.getRut()).addParameter("name", volunteer.getName())
                .executeUpdate();
        return 0;

    }

    @Override
    public List<Volunteer> selectAllVolunteers() {
        final String sql = "SELECT * FROM volunteers";
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        List<Volunteer> db1List = source.createQuery(sql).executeAndFetch(Volunteer.class);

        // Búsqueda en database 2
        source = db2.open();
        List<Volunteer> db2List = source.createQuery(sql).executeAndFetch(Volunteer.class);

        // Búsqueda en database 3
        source = db3.open();
        List<Volunteer> db3List = source.createQuery(sql).executeAndFetch(Volunteer.class);

        List<Volunteer> temp = Stream.concat(db1List.stream(), db2List.stream()).collect(Collectors.toList());
        List<Volunteer> result = Stream.concat(temp.stream(), db3List.stream()).collect(Collectors.toList());

        return result;
    }

    @Override
    public Optional<Volunteer> selectVolunteerByRut(int rut) {
        final String sql = "SELECT * FROM volunteers WHERE rut = :rut";
        Connection source;

        if (rut % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (rut % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (rut % 3 == 2)
            source = db3.open(); // Búsqueda en database 3
        }

        return source.createQuery(sql).addParameter("rut", rut).executeAndFetch(Volunteer.class).stream().findFirst();

    }

    @Override
    public int updateVolunteerNameByRut(int rut, Volunteer volunteer) {
        final String sql = "UPDATE volunteers SET name = :name WHERE rut = :rut";
        Connection source;

        if (rut % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (rut % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (rut % 3 == 2)
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("rut", rut).addParameter("name", volunteer.getName()).executeUpdate();
        return 0;
    }

    @Override
    public int deleteVolunteerByRut(int rut) {
        final String sql = "DELETE FROM volunteers WHERE rut = :rut";
        Connection source;

        if (rut % 3 == 0) {
            source = db1.open(); // Búsqueda en database 1
        } else if (rut % 3 == 1) {
            source = db2.open(); // Búsqueda en database 2
        } else { // if (rut % 3 == 2)
            source = db3.open(); // Búsqueda en database 3
        }

        source.createQuery(sql).addParameter("rut", rut).executeUpdate();
        return 0;
    }

    @Override
    public List<Volunteer> selectVolunteersByName(String name) {
        final String sql = "SELECT * FROM volunteers WHERE name LIKE :name";
        final String search = "%" + name + "%";
        Connection source;

        // Búsqueda en database 1
        source = db1.open();
        List<Volunteer> db1List = source.createQuery(sql).addParameter("name", search).executeAndFetch(Volunteer.class);

        // Búsqueda en database 2
        source = db2.open();
        List<Volunteer> db2List = source.createQuery(sql).addParameter("name", search).executeAndFetch(Volunteer.class);

        // Búsqueda en database 3
        source = db3.open();
        List<Volunteer> db3List = source.createQuery(sql).addParameter("name", search).executeAndFetch(Volunteer.class);

        List<Volunteer> temp = Stream.concat(db1List.stream(), db2List.stream()).collect(Collectors.toList());
        List<Volunteer> result = Stream.concat(temp.stream(), db3List.stream()).collect(Collectors.toList());
        return result;
    }

}