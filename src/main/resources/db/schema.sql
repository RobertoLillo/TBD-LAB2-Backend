----------------------------------------------------------------------------------
--------------------------------------TABLES--------------------------------------
----------------------------------------------------------------------------------
DROP TABLE IF EXISTS volunteers_abilities;
DROP TABLE IF EXISTS abilities;
DROP TABLE IF EXISTS volunteers;

CREATE TABLE volunteers
(
    id UUID NOT NULL,
    rut INTEGER NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE abilities
(
    id UUID NOT NULL,
    description VARCHAR(250),
    PRIMARY KEY (id)
);

CREATE TABLE volunteers_abilities
(
    id UUID NOT NULL,
    id_volunteer UUID NOT NULL,
    id_ability UUID NOT NULL,
    PRIMARY KEY (id)
);
----------------------------------------------------------------------------------
------------------------------------VOLUNTEERS------------------------------------
----------------------------------------------------------------------------------
INSERT INTO volunteers VALUES ('4a995f8c-a3a5-11ea-bb37-0242ac130002', '7888641', 'Claudia Castillo');

INSERT INTO volunteers VALUES ('4a9967e8-a3a5-11ea-bb37-0242ac130002', '24672223', 'Andrés Núñez');

INSERT INTO volunteers VALUES ('4a996cac-a3a5-11ea-bb37-0242ac130002', '14558915', 'Ximena Gallardo');

INSERT INTO volunteers VALUES ('4a9961a8-a3a5-11ea-bb37-0242ac130002', '10912578', 'Jorge Rosales');

INSERT INTO volunteers VALUES ('4a99628e-a3a5-11ea-bb37-0242ac130002', '8942032', 'Mónica Pascual');

INSERT INTO volunteers VALUES ('4a9964c8-a3a5-11ea-bb37-0242ac130002', '22898251', 'Román Martínez');

INSERT INTO volunteers VALUES ('4a9965ae-a3a5-11ea-bb37-0242ac130002', '19519986', 'Guillermo Calvo');

INSERT INTO volunteers VALUES ('4a99666c-a3a5-11ea-bb37-0242ac130002', '9781759', 'Iris Navarro');

INSERT INTO volunteers VALUES ('4a99672a-a3a5-11ea-bb37-0242ac130002', '22380438', 'Laura Morales');

INSERT INTO volunteers VALUES ('4a99689c-a3a5-11ea-bb37-0242ac130002', '6917247', 'Ernesto Castro');

INSERT INTO volunteers VALUES ('4a996bb2-a3a5-11ea-bb37-0242ac130002', '21147439', 'Alan Pastor');

INSERT INTO volunteers VALUES ('4a996d6a-a3a5-11ea-bb37-0242ac130002', '24846354', 'Alonzo Diaz');

INSERT INTO volunteers VALUES ('4a996e28-a3a5-11ea-bb37-0242ac130002', '22052132', 'Paola Velasco');

INSERT INTO volunteers VALUES ('4a996ee6-a3a5-11ea-bb37-0242ac130002', '5999796', 'Emanuel Santos');

INSERT INTO volunteers VALUES ('4a996fa4-a3a5-11ea-bb37-0242ac130002', '18466532', 'Daniela Santana');

INSERT INTO volunteers VALUES ('4a997062-a3a5-11ea-bb37-0242ac130002', '13597524', 'Amanda Herrera');

INSERT INTO volunteers VALUES ('4a997116-a3a5-11ea-bb37-0242ac130002', '24444426', 'Pedro Molina');

INSERT INTO volunteers VALUES ('4a997300-a3a5-11ea-bb37-0242ac130002', '15088098', 'Cecilia Arias');

INSERT INTO volunteers VALUES ('4a9973d2-a3a5-11ea-bb37-0242ac130002', '6793405', 'Celeste Vera');

INSERT INTO volunteers VALUES ('4a997490-a3a5-11ea-bb37-0242ac130002', '15295833', 'Javier Parra');
----------------------------------------------------------------------------------
--------------------------------------ABILITIES-----------------------------------
----------------------------------------------------------------------------------
INSERT INTO abilities VALUES ('72a6f398-a3ac-11ea-bb37-0242ac130002', 'Fuerza y resistencia');

INSERT INTO abilities VALUES ('72a6f5d2-a3ac-11ea-bb37-0242ac130002', 'Manejo de la matemática básica como álgebra y buena ortografía');

INSERT INTO abilities VALUES ('72a6f6c2-a3ac-11ea-bb37-0242ac130002', 'Habilidades de comunicación con abuelos y niños');

INSERT INTO abilities VALUES ('72a6f794-a3ac-11ea-bb37-0242ac130002', 'Empatia y paciencia');

INSERT INTO abilities VALUES ('72a6f852-a3ac-11ea-bb37-0242ac130002', 'Hábil y delicado con los animales');

INSERT INTO abilities VALUES ('72a70234-a3ac-11ea-bb37-0242ac130002', 'Orden y limpieza en su lugar de trabajo');

INSERT INTO abilities VALUES ('72a70374-a3ac-11ea-bb37-0242ac130002', 'No tener fobia a la sangre, heridas, cortes y las jeringas');

INSERT INTO abilities VALUES ('72a70446-a3ac-11ea-bb37-0242ac130002', 'Capacidad de trabajar bajo presión');

INSERT INTO abilities VALUES ('72a70504-a3ac-11ea-bb37-0242ac130002', 'Capacidad de organizar y liderar una gran cantidad de personas');

INSERT INTO abilities VALUES ('72a705c2-a3ac-11ea-bb37-0242ac130002', 'Conocimientos de Reanimación cardiopulmonar (RCP)');

INSERT INTO abilities VALUES ('72a70680-a3ac-11ea-bb37-0242ac130002', 'Buena orientación');

INSERT INTO abilities VALUES ('72a7073e-a3ac-11ea-bb37-0242ac130002', 'Experiencia de rescates en bosques');

INSERT INTO abilities VALUES ('72a707f2-a3ac-11ea-bb37-0242ac130002', 'Posibilidad de movilización por sus propios medios (Traslado)');

INSERT INTO abilities VALUES ('72a70a9a-a3ac-11ea-bb37-0242ac130002', 'Disposición para aprender');

INSERT INTO abilities VALUES ('72a70b6c-a3ac-11ea-bb37-0242ac130002', 'Comunicación oral eficiente al trabajar en equipo');
----------------------------------------------------------------------------------
-------------------------------VOLUNTEERS_ABILITIES-------------------------------
----------------------------------------------------------------------------------
INSERT INTO volunteers_abilities VALUES ('aeb2aa9a-a441-11ea-bb37-0242ac130002', '4a995f8c-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2acb6-a441-11ea-bb37-0242ac130002', '4a995f8c-a3a5-11ea-bb37-0242ac130002', '72a6f5d2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2ae50-a441-11ea-bb37-0242ac130002', '4a995f8c-a3a5-11ea-bb37-0242ac130002', '72a70b6c-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2af68-a441-11ea-bb37-0242ac130002', '4a995f8c-a3a5-11ea-bb37-0242ac130002', '72a70504-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b0a8-a441-11ea-bb37-0242ac130002', '4a9961a8-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b17a-a441-11ea-bb37-0242ac130002', '4a9961a8-a3a5-11ea-bb37-0242ac130002', '72a70234-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b27e-a441-11ea-bb37-0242ac130002', '4a9961a8-a3a5-11ea-bb37-0242ac130002', '72a70a9a-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b3e6-a441-11ea-bb37-0242ac130002', '4a99628e-a3a5-11ea-bb37-0242ac130002', '72a6f794-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b4ae-a441-11ea-bb37-0242ac130002', '4a99628e-a3a5-11ea-bb37-0242ac130002', '72a705c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b5d0-a441-11ea-bb37-0242ac130002', '4a99628e-a3a5-11ea-bb37-0242ac130002', '72a70374-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b6b6-a441-11ea-bb37-0242ac130002', '4a9964c8-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b7d8-a441-11ea-bb37-0242ac130002', '4a9964c8-a3a5-11ea-bb37-0242ac130002', '72a70374-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b8d2-a441-11ea-bb37-0242ac130002', '4a9964c8-a3a5-11ea-bb37-0242ac130002', '72a6f852-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2b9e0-a441-11ea-bb37-0242ac130002', '4a9965ae-a3a5-11ea-bb37-0242ac130002', '72a70680-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2bc56-a441-11ea-bb37-0242ac130002', '4a9965ae-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2bd14-a441-11ea-bb37-0242ac130002', '4a9965ae-a3a5-11ea-bb37-0242ac130002', '72a705c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2be72-a441-11ea-bb37-0242ac130002', '4a99666c-a3a5-11ea-bb37-0242ac130002', '72a6f794-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2bf30-a441-11ea-bb37-0242ac130002', '4a99666c-a3a5-11ea-bb37-0242ac130002', '72a6f6c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c034-a441-11ea-bb37-0242ac130002', '4a99666c-a3a5-11ea-bb37-0242ac130002', '72a6f5d2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c11a-a441-11ea-bb37-0242ac130002', '4a99672a-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c23c-a441-11ea-bb37-0242ac130002', '4a99672a-a3a5-11ea-bb37-0242ac130002', '72a70a9a-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c3a4-a441-11ea-bb37-0242ac130002', '4a99672a-a3a5-11ea-bb37-0242ac130002', '72a70b6c-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c50c-a441-11ea-bb37-0242ac130002', '4a9967e8-a3a5-11ea-bb37-0242ac130002', '72a705c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c624-a441-11ea-bb37-0242ac130002', '4a9967e8-a3a5-11ea-bb37-0242ac130002', '72a7073e-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c728-a441-11ea-bb37-0242ac130002', '4a9967e8-a3a5-11ea-bb37-0242ac130002', '72a70504-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c7e6-a441-11ea-bb37-0242ac130002', '4a99689c-a3a5-11ea-bb37-0242ac130002', '72a70680-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2c944-a441-11ea-bb37-0242ac130002', '4a99689c-a3a5-11ea-bb37-0242ac130002', '72a705c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2ca3e-a441-11ea-bb37-0242ac130002', '4a99689c-a3a5-11ea-bb37-0242ac130002', '72a7073e-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2cb38-a441-11ea-bb37-0242ac130002', '4a996bb2-a3a5-11ea-bb37-0242ac130002', '72a6f794-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2cc64-a441-11ea-bb37-0242ac130002', '4a996bb2-a3a5-11ea-bb37-0242ac130002', '72a6f6c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2cdc2-a441-11ea-bb37-0242ac130002', '4a996bb2-a3a5-11ea-bb37-0242ac130002', '72a6f852-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2ceee-a441-11ea-bb37-0242ac130002', '4a996cac-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d006-a441-11ea-bb37-0242ac130002', '4a996cac-a3a5-11ea-bb37-0242ac130002', '72a7073e-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d132-a441-11ea-bb37-0242ac130002', '4a996cac-a3a5-11ea-bb37-0242ac130002', '72a705c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d1fa-a441-11ea-bb37-0242ac130002', '4a996d6a-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d308-a441-11ea-bb37-0242ac130002', '4a996d6a-a3a5-11ea-bb37-0242ac130002', '72a70b6c-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d416-a441-11ea-bb37-0242ac130002', '4a996d6a-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d524-a441-11ea-bb37-0242ac130002', '4a996e28-a3a5-11ea-bb37-0242ac130002', '72a6f852-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d63c-a441-11ea-bb37-0242ac130002', '4a996e28-a3a5-11ea-bb37-0242ac130002', '72a70374-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d754-a441-11ea-bb37-0242ac130002', '4a996e28-a3a5-11ea-bb37-0242ac130002', '72a6f794-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d86c-a441-11ea-bb37-0242ac130002', '4a996ee6-a3a5-11ea-bb37-0242ac130002', '72a70a9a-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2d97a-a441-11ea-bb37-0242ac130002', '4a996ee6-a3a5-11ea-bb37-0242ac130002', '72a70234-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2da6a-a441-11ea-bb37-0242ac130002', '4a996ee6-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2db82-a441-11ea-bb37-0242ac130002', '4a996fa4-a3a5-11ea-bb37-0242ac130002', '72a7073e-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2dc9a-a441-11ea-bb37-0242ac130002', '4a996fa4-a3a5-11ea-bb37-0242ac130002', '72a707f2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2dd76-a441-11ea-bb37-0242ac130002', '4a996fa4-a3a5-11ea-bb37-0242ac130002', '72a70680-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2de98-a441-11ea-bb37-0242ac130002', '4a997062-a3a5-11ea-bb37-0242ac130002', '72a6f794-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2dfce-a441-11ea-bb37-0242ac130002', '4a997062-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e0c8-a441-11ea-bb37-0242ac130002', '4a997116-a3a5-11ea-bb37-0242ac130002', '72a707f2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e294-a441-11ea-bb37-0242ac130002', '4a997116-a3a5-11ea-bb37-0242ac130002', '72a70b6c-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e3ac-a441-11ea-bb37-0242ac130002', '4a997300-a3a5-11ea-bb37-0242ac130002', '72a70234-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e4a6-a441-11ea-bb37-0242ac130002', '4a997300-a3a5-11ea-bb37-0242ac130002', '72a6f5d2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e604-a441-11ea-bb37-0242ac130002', '4a9973d2-a3a5-11ea-bb37-0242ac130002', '72a70374-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e6cc-a441-11ea-bb37-0242ac130002', '4a9973d2-a3a5-11ea-bb37-0242ac130002', '72a70446-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e79e-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a7073e-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e8d4-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a70374-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2e992-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a6f5d2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2eae6-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a6f398-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2ebf4-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a6f6c2-a3ac-11ea-bb37-0242ac130002');

INSERT INTO volunteers_abilities VALUES ('aeb2ed16-a441-11ea-bb37-0242ac130002', '4a997490-a3a5-11ea-bb37-0242ac130002', '72a6f852-a3ac-11ea-bb37-0242ac130002');
----------------------------------------------------------------------------------