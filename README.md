# TBD-Backend
Backend TBD 1-2020

## Spring Initializr
```
https://start.spring.io/
```

## sql2o Docs
```
https://github.com/aaberg/sql2o/wiki
```

## Base de datos
```
1) En el directorio TBD-Backend/src/main/resources se encuentra el archivo application.properties.
En este se debe indicar la dirección de la base de datos (por defecto viene configurado para localhost o 127.0.0.1).

2) Dentro del directorio TBD-Backend/src/main/resources/db se encuentran 2 archivos:

  - Schema.sql contiene el esquema de base de datos que fue utilizado para el ejemplo que fue grabado en video.

  - Dump.sql contiene el backup hecho directamente desde pgadmin.
```

## Cómo iniciar
```
Dirigirse a al directorio TBD-Backend y ejecutar:

$ mvn spring-boot:run

Esto iniciará el backend en el puerto 8081.
```
