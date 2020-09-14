package cl.tbd.back.model;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Ability {
    
    private final UUID id;

    @NotBlank
    private final String description;

    public Ability(@JsonProperty("id") UUID id,
                   @JsonProperty("description") String description) {
        this.id = id;
        this.description = description;
    }

    public UUID getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}