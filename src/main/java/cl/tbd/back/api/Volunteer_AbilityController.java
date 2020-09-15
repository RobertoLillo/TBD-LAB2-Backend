package cl.tbd.back.api;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.NonNull;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import cl.tbd.back.model.Volunteer_Ability;
import cl.tbd.back.service.Volunteer_AbilityService;

@CrossOrigin
@RestController
public class Volunteer_AbilityController {

    private final Volunteer_AbilityService volunteer_AbilityService;

    @Autowired
    public Volunteer_AbilityController(@Valid @NonNull Volunteer_AbilityService volunteer_AbilityService) {
        this.volunteer_AbilityService = volunteer_AbilityService;
    }

    @PostMapping("/api/v1/volunteersAbilities")
    public void insertVolunteer_Ability(@RequestBody Volunteer_Ability volunteer_ability) {
        volunteer_AbilityService.insertVolunteer_Ability(volunteer_ability);
    }

    @GetMapping("/api/v1/volunteersAbilities")
    public List<Volunteer_Ability> selectAllVolunteers_Abilities() {
        return volunteer_AbilityService.selectAllVolunteers_Abilities();
    }

}