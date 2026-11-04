# SIGAM -- Sistema de Gestión y Asignación de Auxilio Mecánico

## Descripción

SIGAM es un sistema desarrollado en PSeInt para gestionar solicitudes de
auxilio mecánico y organizar la interacción entre clientes, choferes,
administración y soporte.

El proyecto representa el funcionamiento básico de un servicio de
asistencia: un cliente registra una solicitud, el sistema busca un
chofer que pueda atenderla y los usuarios pueden consultar o gestionar
las operaciones disponibles según su perfil.

Esta versión fue desarrollada en pseudocódigo como parte del trabajo
final de la materia **Laboratorio**, de la Universidad Tecnológica
Nacional (UTN), Instituto Nacional Superior del Profesorado Técnico
(INSPT).

## Objetivos

-   Aplicar los conceptos de algoritmia y programación estudiados
    durante la cursada.
-   Organizar el programa mediante funciones y subalgoritmos.
-   Utilizar vectores para almacenar y administrar información.
-   Implementar validaciones y controles sobre los datos ingresados.
-   Gestionar solicitudes de auxilio, estados de choferes, localidades y
    reclamos.
-   Desarrollar un menú interactivo con diferentes perfiles de usuario.

## Perfiles y funcionalidades

### Cliente

-   Solicitar un servicio de auxilio mecánico.
-   Indicar la localidad, el tipo de vehículo y la situación que
    requiere asistencia.
-   Ingresar la patente del vehículo.
-   Consultar el estado de su solicitud.
-   Contactar a soporte mediante un reclamo.
-   Cerrar sesión.

### Chofer

-   Consultar y modificar su estado de disponibilidad.
-   Visualizar el servicio asignado.
-   Iniciar el viaje.
-   Finalizar el servicio.
-   Contactar a soporte.
-   Cerrar sesión.

### Administrador

-   Gestionar el estado de los usuarios.
-   Gestionar las localidades del sistema.
-   Cerrar sesión.

### Soporte

-   Consultar los reclamos pendientes.
-   Gestionar el estado de los usuarios.
-   Consultar el historial de reclamos.
-   Cerrar sesión.

## Búsqueda y asignación de choferes

El sistema incorpora una lógica de búsqueda para encontrar choferes que
puedan atender una solicitud. Para ello, considera la localidad de la
solicitud y el estado de disponibilidad de los choferes.

También calcula un puntaje de prioridad a partir de las características
de la situación informada por el cliente. Las solicitudes pueden
clasificarse según ese puntaje.

## Tecnologías y herramientas

-   **PSeInt:** desarrollo y ejecución del pseudocódigo.
-   **Git y GitHub:** control de versiones y colaboración durante el
    desarrollo.

## Requisitos

Para ejecutar esta versión se necesita tener instalado **PSeInt**.

## Cómo ejecutar el programa

1.  Descargar o clonar este repositorio.
2.  Abrir PSeInt.
3.  Abrir el archivo principal del proyecto, con extensión `.psc`.
4.  Ejecutar el algoritmo desde PSeInt.

El archivo principal contiene el algoritmo `SIGAM` y los subalgoritmos y
funciones utilizados por el sistema.

## Datos de prueba

La versión desarrollada en PSeInt utiliza datos precargados en el código
para permitir probar el funcionamiento del sistema.

Para ingresar, se deben utilizar las credenciales definidas en la
función `validaLogin` del código fuente. Allí se encuentran los usuarios
y contraseñas de prueba correspondientes a los distintos perfiles.

## Consideraciones

Esta versión trabaja con información almacenada en memoria durante la
ejecución. Los datos precargados se inicializan al iniciar el programa y
no se conservan automáticamente al cerrar la ejecución.

## Integrantes

-   Tomas Escobar
-   Omar Gomez
-   Agustina Gonzalez

## Institución y materia

**Universidad Tecnológica Nacional (UTN)**\
**Instituto Nacional Superior del Profesorado Técnico (INSPT)**

**Trabajo Final -- Laboratorio**
