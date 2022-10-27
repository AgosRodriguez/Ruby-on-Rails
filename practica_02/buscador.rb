# encoding: utf-8

require 'net/http'
require 'net/https' if RUBY_VERSION < '1.9'
require 'json'


PELI_EXAMPLE = <<-EOF
{
  "belongs_to_collection": {
      "id": 5039,
      "name": "Rambo - Colección"
  },
  "genres": [
      {
          "id": 28,
          "name": "Acción"
      },
      {
          "id": 53,
          "name": "Suspense"
      },
      {
          "id": 18,
          "name": "Drama"
      }
  ],
  "id": 522938,
  "original_title": "Rambo: Last Blood",
  "overview": "Después de luchar contra sus demonios durante décadas, John Rambo vive ahora en paz en su rancho familiar en Arizona, pero su descanso se ve interrumpido cuando Gabriela, la nieta de su ama de llaves María, desaparece después de cruzar la frontera con México con el propósito de conocer a su padre biológico. Rambo, que con los años se ha convertido para Gabriela en una verdadera figura paterna, emprende un desesperado y peligroso viaje para encontrarla.",
  "release_date": "2019-09-19"
}
EOF

SERIE_EXAMPLE = <<-EOF
{
  "first_air_date": "2005-03-24",
  "genres": [
      {
          "id": 35,
          "name": "Comedia"
      }
  ],
  "id": 2316,
  "number_of_episodes": 195,
  "number_of_seasons": 9,
  "original_name": "The Office",
  "overview": "Steve Carell protagoniza The Office, un fresco y divertido vistazo, con formato pseudo-documental, al día a día en la vida de unos excéntricos trabajadores de la empresa Dunder Mifflin. El serio pero despistadísimo director Michael Scott se considera un magnífico jefe y mentor, pero realmente inspira más críticas que respeto a sus empleados."
}
EOF

# Informacion de la pelicula para mostrar por pantalla 
INFO_PELICULAS= ['belongs_to_collection', 'genres', 'id', 'original_title', 'overview']

# Informacion de la serie para mostrar por pantalla 
INFO_SERIES = ['first_air_date', 'first_air_date', 'genres', 'id', 'number_of_episodes', 'number_of_seasons', 'original_name', 'overview']


def busca_peli(nombre)
  uri = URI("https://api.themoviedb.org/3/search/movie?api_key=b0776a43b2e8c50123976317b5c4e903&language=es-ES&query= #{nombre}")
  res = Net::HTTP.get(uri)
  result = JSON.parse(res) 
  

  peliStr = []
  # Si el nombre de la pelicula existe -> existe al menos una pagina que contiene la informacion.
  if result['total_pages'] > 0

    idPelicula = result['results'][0]['id']
    url = URI("https://api.themoviedb.org/3/movie/#{idPelicula}?api_key=b0776a43b2e8c50123976317b5c4e903&language=es-ES")
    respPeli = JSON.parse(Net::HTTP.get(url))

    INFO_PELICULAS.each do |items|
        # Contiene la informacion del primer libro que coincida con el nombre buscado
      peliStr.push([items, respPeli[items]])
    end

    puts peliStr.to_h.to_json
  else
    puts 'NO SE ENCONTRO LA PELICULA QUE BUSCABAS'
  end
end


def busca_serie(nombre)
  uri = URI("https://api.themoviedb.org/3/search/tv?api_key=b0776a43b2e8c50123976317b5c4e903&language=es-ES&query= #{nombre}")
  res = Net::HTTP.get(uri)
  result = JSON.parse(res) 

  serieStr = []
  if result['total_pages'] == 0
    puts 'La serie no fue encontrada'
  else
    
    idSerie = result['results'][0]['id']
    url = URI("https://api.themoviedb.org/3/tv/#{idSerie}?api_key=b0776a43b2e8c50123976317b5c4e903&language=es-ES")
    respSerie = JSON.parse(Net::HTTP.get(url))

    INFO_SERIES.each do |items|
      serieStr.push([items, respSerie[items]])
    end
      puts serieStr.to_h.to_json
  end
end


print 'Desea buscar una pelicula o una serie? '
tipo = gets.chomp
print 'Cual es el nombre? '
nombre = gets.chomp
if ['pelicula', 'peli', 'movie'].include?(tipo.downcase)
  busca_peli(nombre)
elsif tipo.downcase == 'serie'
  busca_serie(nombre)
else
  puts "La seleccion '#{tipo}' no es valida"
end
