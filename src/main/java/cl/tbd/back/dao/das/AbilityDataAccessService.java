package cl.tbd.back.dao.das;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import cl.tbd.back.dao.AbilityDao;
import cl.tbd.back.model.Ability;

@Repository("postgresAbility")
public class AbilityDataAccessService implements AbilityDao {

    @Autowired
    private Sql2o sql2o;

    @Override
    public int insertAbility(UUID id, Ability ability) {
        final String sql = "INSERT INTO abilities (id, description) VALUES (:id, :description)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                .addParameter("id", id)
                .addParameter("description", ability.getDescription())
                .executeUpdate();
            return 0;
        }
    }

    @Override
    public List<Ability> selectAllAbilities() {
        final String sql = "SELECT * FROM abilities";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                .executeAndFetch(Ability.class);
        }
    }

    @Override
    public Optional<Ability> selectAbilityById(UUID id) {
        final String sql = "SELECT * FROM abilities WHERE id = :searchId";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                .addParameter("searchId", id)
                .executeAndFetch(Ability.class)
                .stream()
                .findFirst();
        }
    }

    @Override
    public int updateAbilityDescriptionById(UUID id, Ability ability) {
        final String sql = "UPDATE abilities SET description = :description WHERE id = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                .addParameter("id", id)
                .addParameter("description", ability.getDescription())
                .executeUpdate();
            return 0;
        }
    }

    @Override
    public int deleteAbilityById(UUID id) {
        final String sql = "DELETE FROM abilities WHERE id = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                .addParameter("id", id)
                .executeUpdate();
            return 0;
        }
    }

}