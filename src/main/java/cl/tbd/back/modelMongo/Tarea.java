package cl.tbd.back.modelMongo;

import org.bson.types.ObjectId;
import org.bson.codecs.pojo.annotations.BsonId;

public class Tarea {

    @BsonId
    private ObjectId _id;
    private String nombre;
    private String descripcion;
    private String finicio;
    private String ffin;
    private Boolean estado;

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

    public String getDescripcion() {
        return this.descripcion;
    }
    public void setDescripcion(String descripcion) {
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

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

}

