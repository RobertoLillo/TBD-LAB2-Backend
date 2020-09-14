package cl.tbd.back.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cl.tbd.back.dao.AbilityDao;
import cl.tbd.back.model.Ability;

@Service
public class AbilityService {

    private final AbilityDao abilityDao;

    @Autowired
    public AbilityService(@Qualifier("postgresAbility") AbilityDao abilityDao) {
        this.abilityDao = abilityDao;
    }

    public int insertAbility(Ability ability) {
        return abilityDao.insertAbility(ability);
    }

    public List<Ability> selectAllAbilities() {
        return abilityDao.selectAllAbilities();
    }

    public Optional<Ability> selectAbilityById(UUID id) {
        return abilityDao.selectAbilityById(id);
    }

    public int updateAbilityDescriptionById(UUID id, Ability ability) {
        return abilityDao.updateAbilityDescriptionById(id, ability);
    }

    public int deleteAbilityById(UUID id) {
        return abilityDao.deleteAbilityById(id);
    }
 
}