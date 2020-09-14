package cl.tbd.back.model;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Volunteer_Ability {

    private final UUID id;

    @NotBlank
    private final UUID id_volunteer;

    @NotBlank
    private final UUID id_ability;

    public Volunteer_Ability(@JsonProperty("id") UUID id,
                             @JsonProperty("id_volunteer") UUID id_volunteer,
                             @JsonProperty("id_ability") UUID id_ability) {
        this.id = id;
        this.id_volunteer = id_volunteer;
        this.id_ability = id_ability;
    }

    public UUID getId() {
        return id;
    }

    public UUID getIdVolunteer() {
        return id_volunteer;
    }

    public UUID getIdAbility() {
        return id_ability;
    }

}