package cl.tbd.back.api;

import java.util.List;

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

import cl.tbd.back.model.Volunteer;
import cl.tbd.back.service.VolunteerService;

@CrossOrigin
@RestController
public class VolunteerController {

    private final VolunteerService volunteerService;

    @Autowired
    public VolunteerController(@Valid @NonNull VolunteerService volunteerService) {
        this.volunteerService = volunteerService;
    }

    @PostMapping("/api/v1/volunteers")
    public void insertVolunteer(@RequestBody Volunteer volunteer) {
        volunteerService.insertVolunteer(volunteer);
    }

    @GetMapping("/api/v1/volunteers")
    public List<Volunteer> selectAllVolunteers() {
        return volunteerService.selectAllVolunteers();
    }

    @GetMapping("/api/v1/volunteers/{rut}")
    public Volunteer selectVolunteerByRut(@PathVariable("rut") int rut) {
        return volunteerService.selectVolunteerByRut(rut).orElse(null);
    }

    @PutMapping("/api/v1/volunteers/name/{rut}")
    public void updateVolunteerNameByRut(@PathVariable("rut") int rut, @Valid @NonNull Volunteer volunteer) {
        volunteerService.updateVolunteerNameByRut(rut, volunteer);
    }

    @DeleteMapping("/api/v1/volunteers/{rut}")
    public void deleteVolunteerById(@PathVariable("rut") int rut) {
        volunteerService.deleteVolunteerByRut(rut);
    }

    @GetMapping("/api/v1/volunteers/byName/{name}")
    public List<Volunteer> selectVolunteerByName(@PathVariable("name") String name) {
        return volunteerService.selectVolunteerByName(name);
    }

}