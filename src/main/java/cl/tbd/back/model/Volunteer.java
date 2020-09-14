package cl.tbd.back.model;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Volunteer {

    private final UUID id;

    @NotBlank
    private final int rut;

    @NotBlank
    private final String name;

    public Volunteer(@JsonProperty("id") UUID id,
                     @JsonProperty("rut") int rut,
                     @JsonProperty("name") String name) {
        this.id = id;
        this.rut = rut;
        this.name = name;
    }

    public UUID getId() {
        return id;
    }

    public int getRut() {
        return rut;
    }

    public String getName() {
        return name;
    }

}