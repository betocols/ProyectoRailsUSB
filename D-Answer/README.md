ProyectoRailsUSB
================

Herramientas de Programación en Internet -- Proyecto 1
===============================================================================

En los últimos años, se ha popularizado los sitios de "preguntas y respuestas",
que permiten a los usuarios tanto realizar preguntas como responder preguntas
ya hechas y/o comentar las preguntas y respuestas. Además, permiten calificar
las preguntas bajo un sistema de puntuación plus/minus, donde se puede dar un
voto aprobatorio (que aumenta la puntuación en 1) o reprobatorio (que disminuye
la puntuación en 1). El ejemplo principal de este tipo de aplicaciones es
Stack Overflow [1] y toda la familia de StackExchange [2].

Su aplicación debe tener la siguiente funcionalidad implementada:

* La aplicación maneja usuarios. Hay dos tipos de usuarios: regulares y
  administradores.
  
* Un usuario sin registrar puede registrarse al sistema y ver la lista completa
  de preguntas.
  
* Un usuario regular puede:
  - Revisar la lista completa de preguntas.
  - Revisar su lista de preguntas.
  - Publicar una pregunta.
  - Responder una pregunta que no sea hecha por él.
  - Poder publicar comentarios a cualquier pregunta y/o respuesta.
  - Si la pregunta es publicada por el usuario, el puede determinar si una
    respuesta es la adecuada.
  - Puede dar votos aprobatorios o reprobatorios, con solo un voto por
    respuesta.

* Un administrador solo puede administrar la lista de usuarios (listar, modifi-
  car y/o borrar) y la lista de preguntas (listar, detallar y borrar).
  
  No puede realizar las mismas acciones que el usuario regular.

Ideas para ir mas alla en la aplicacion (y optar al umbral 5):

* Etiquetar las preguntas, y poder realizar un listado de preguntas por
  etiquetas.
  
* Manejar notificaciones. Por ejemplo:
  - Si hubo respuestas a una pregunta.
  - Si hubo comentarios a una pregunta/respuesta hecha por uno.
  - Si calificaron una pregunta de manera satisfactoria.
  - ... entre otros!
  
* Manejar un sistema de importancia, en el cual se puede ganar puntos dependi-
  endo de que haya respondido preguntas de manera correcta.

Detalles:

1. Para este primer proyecto, no se necesita implementar CSS, JavaScript o 
AJAX. Si lo desea implementar, puede contar para llegar al umbral 5.

2. No tiene que implementar todas las ideas. Tome las que mas le interese e
implementelas de manera correcta.

3. Mientras mas soluciones fuera de lo que ofrece por defecto el framework
(gemas, etc), mas posibilidades tiene de alcanzar el umbral 5.

4. La fecha de presentación del proyecto es entre las semanas 6 y 7.

[1] www.stackoverflow.com
[2] stackexchange.com

