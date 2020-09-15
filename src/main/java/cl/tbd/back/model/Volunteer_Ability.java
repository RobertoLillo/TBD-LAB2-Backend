package cl.tbd.back.model;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Volunteer_Ability {

    private final UUID id;

    @NotBlank
    private final int rut;

    @NotBlank
    private final UUID id_ability;

    public Volunteer_Ability(@JsonProperty("id") UUID id,
                             @JsonProperty("rut") int rut,
                             @JsonProperty("id_ability") UUID id_ability) {
        this.id = id;
        this.rut = rut;
        this.id_ability = id_ability;
    }

    public UUID getId() {
        return id;
    }

    public int getRut() {
        return rut;
    }

    public UUID getIdAbility() {
        return id_ability;
    }

}