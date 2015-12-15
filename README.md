# Recogidas de material informático en la UGR


Procesamiento de datos de recogidas de material informático llevado a
cabo por la [Oficina de Software Libre](http://osl.ugr.es) de la UGR.

## Uso

Los datos de recogidas son públicos. Para descargártelos y guardarlos
en un fichero, ejecuta

	./descarga.sh

Eso genera un fichero .csv, que puedes procesar como quieras. Un
ejemplo está en `recogidas.dat`. Ese fichero devuelve sólo las fechas
de cada recogida, que posteriormente puedes procesar con

	./procesa.pl

para generar un fichero CSV que puedas trazar. Un informe a fecha
diciembre de 2015 se ha
[publicado en RPubs](http://rpubs.com/jjmerelo/recogidas-ugr).

