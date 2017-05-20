---
layout: index
---

# Recogidas de material informático en la UGR


Procesamiento de datos de recogidas de material informático llevado a
cabo por la [Oficina de Software Libre](http://osl.ugr.es) de la UGR.

## Uso

Los datos de recogidas son públicos. Para descargártelos y guardarlos
en un fichero, ejecuta

	./descarga.sh
	
Este script usa dos utilidades: `curl` (que debería estar instalado en
todos los sistemas Linux, si no, [descargarlo](https://curl.haxx.se/)) y [`jq`](https://stedolan.github.io/jq/), una excelente
utilidad de procesamiento de ficheros json. 

Eso genera un fichero .csv, que puedes procesar como quieras. Un
ejemplo está en `recogidas.dat`. Ese fichero devuelve sólo las fechas
de cada recogida, que posteriormente puedes procesar con

	./procesa.pl

para generar un fichero CSV que puedas trazar. Un informe a fecha
diciembre de 2015 se ha
[publicado en RPubs](http://rpubs.com/jjmerelo/recogidas-ugr).

Antes tendrás que instalar los módulos de Perl necesarios con

    cpanm --installdeps .
	
`cpanm` debería estar instalado en el sistema (si usas Perlbrew, que
deberías, estará ya); si
no, [aquí está la explicación e instrucciones de instalación](http://search.cpan.org/~miyagawa/App-cpanminus-1.7043/lib/App/cpanminus.pm) 
