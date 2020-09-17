package cl.tbd.back.modelMongo;

import org.bson.types.ObjectId;
import org.bson.codecs.pojo.annotations.BsonId;

import java.util.List;

public class Emergencia {
    @BsonId
    ObjectId _id;
    private String nombre;
    private String descripcion;
    private String finicio;
    private String ffin;
    private List<String> tareas;

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

    public List<String> getTareas(){
        return this.tareas;
    }
    public  void setTareas(List<String> works){
        this.tareas= works;
    }
}

