package cl.tbd.back.model;

import javax.persistence.Id;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Volunteer {

    @Id
    private final int rut;

    @NotBlank
    private final String name;

    public Volunteer(@JsonProperty("rut") int rut,
                     @JsonProperty("name") String name) {
        this.rut = rut;
        this.name = name;
    }

    public int getRut() {
        return rut;
    }

    public String getName() {
        return name;
    }

}