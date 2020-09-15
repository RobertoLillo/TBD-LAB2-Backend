package cl.tbd.back.api;

import java.util.List;
import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import cl.tbd.back.model.Ability;
import cl.tbd.back.service.AbilityService;

@CrossOrigin
@RestController
public class AbilityController {

    private final AbilityService abilityService;

    @Autowired
    public AbilityController(@Valid @NonNull AbilityService abilityService) {
        this.abilityService = abilityService;
    }

    @PostMapping("/api/v1/abilities")
    public void insertAbility(@RequestBody Ability ability) {
        abilityService.insertAbility(ability);
    }

    @GetMapping("/api/v1/abilities")
    public List<Ability> selectAllAbilities() {
        return abilityService.selectAllAbilities();
    }

    @GetMapping("/api/v1/abilities/{id}")
    public Ability selectAbilityById(@PathVariable("id") UUID id) {
        return abilityService.selectAbilityById(id).orElse(null);
    }

    @PutMapping("/api/v1/abilities/description/{id}")
    public void updateAbilityDescriptionById(@PathVariable("id") UUID id, @Valid @NonNull Ability ability) {
        abilityService.updateAbilityDescriptionById(id, ability);
    }

    @DeleteMapping("/api/v1/abilities/{id}")
    public void deleteAbilityById(@PathVariable("id") UUID id) {
        abilityService.deleteAbilityById(id);
    }

    @GetMapping("/api/v1/abilities/byRut/{rut}")
    public List<Ability> selectAbilitiesByRut(@PathVariable("rut") int rut) {
        return abilityService.selectAbilitiesByRut(rut);
    }

}