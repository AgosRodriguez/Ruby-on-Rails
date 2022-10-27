# Practica 02

Se debera utilizar la API de **[The Movie Database](https://developers.themoviedb.org/3)** para buscar informacion de peliculas y series.

El proceso pedira por consola al usuario que es lo que desea buscar (pelicula/serie) y el nombre de la misma, con lo cual se devolvera por consola un JSON con la informacion correspondiente (en caso de haber mas de una coincidencia devolvera la informacion del primero)

El JSON resultante debera tener los siguientes datos segun corresponda:

# Index
- [Serie](#serie)
- [Movie](#movie)
- [Genre](#genre)
- [Collection](#collection)

# Serie
Informacion de la serie

- "serie":
  + "first_air_date": fecha de lanzamiento
  + "genres": listado de [Genre](#genre)
  + "id": identificador
  + "number_of_episodes": cantidad de episodios
  + "number_of_seasons": cantidad de temporadas
  + "original_name": nombre original
  + "overview": resumen

# Movie
Informacion de la pelicula

- "movie":
  + "belongs_to_collection": [Collection](#collection)
  + "genres": listado de [Genre](#genre)
  + "id": identificador
  + "original_title": nombre original
  + "overview": resumen
  + "release_date": fecha de lanzamiento

# Genre
Informacion del genero

- "genre":
  + "id": identificador
  + "name": nombre

# Collection
Informacion de la coleccion

- "collection":
  + "id": identificador
  + "name": nombre

> **ADVERTENCIA**
> * Tanto el genero, la coleccion y el resumen deberan estar en idioma castellano
> * Se considerara el archivo resultante un *JSON* valido si pasa la validacion de **[The JSON Validator](https://jsonlint.com)**

> **SUGERENCIA**  
> Se recomienda usar **[Postman](https://www.postman.com/downloads/)** para realizar las pruebas correspondientes
