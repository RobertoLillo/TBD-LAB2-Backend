package cl.tbd.back.dao;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import cl.tbd.back.model.Ability;

public interface AbilityDao {

    int insertAbility(UUID id, Ability ability);

    default int insertAbility(Ability ability) {
        UUID id = UUID.randomUUID();
        return insertAbility(id, ability);
    }

    List<Ability> selectAllAbilities();

    Optional<Ability> selectAbilityById(UUID id);

    int updateAbilityDescriptionById(UUID id, Ability ability);

    int deleteAbilityById(UUID id);

    List<Ability> selectAbilitiesByRut(int rut);
}