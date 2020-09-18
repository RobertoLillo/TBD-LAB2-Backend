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

2) Dentro del directorio TBD-Backend/src/main/resources/db se encuentran 3 archivos sql:

  - TBDBACK1.sql
  - TBDBACK2.sql
  - TBDBACK3.sql

  Cada uno corresponde al dump de la base de datos utilizada para la paralelización. Estos deben ser restaurados en postgres
  antes de realizar alguna prueba con el backend. Para esto primero crear las tres bases de datos con los mismos nombres de
  los archivos sql y luego en cada una restaurar el archivo correspondiente.
```

## Cómo iniciar
```
Dirigirse a al directorio TBD-LAB2-Backend y ejecutar:

$ mvn spring-boot:run

Esto iniciará el backend en el puerto 8081.
```
