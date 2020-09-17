package cl.tbd.back.modelMongo;

import net.minidev.json.annotate.JsonIgnore;
import org.bson.types.ObjectId;
import org.bson.codecs.pojo.annotations.BsonId;
import org.springframework.data.annotation.Id;

public class Tarea {

    @BsonId
    private ObjectId _id;
    private String nombre;
    private String descripcion;
    private String finicio;
    private String ffin;
    private Bool estado;

    public ObjectId getId() {
        return this._id;
    }
    public void setId(ObjectId id) {
        this._id = id;
    }

    public String getNombre() {
        return this.nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescrip() {
        return this.descripcion;
    }
    public void setDescrip(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFinicio() {
        return this.finicio;
    }

    public void setFinicio(String finicio) {
        this.finicio = finicio;
    }

    public String getFfin() {
        return this.ffin;
    }

    public void setFfin(String ffin) {
        this.ffin = ffin;
    }

    public Bool getEstado() {
        return estado;
    }

    public void setEstado(Bool estado) {
        this.estado = estado;
    }

}

