# encoding: utf-8

ANAGRAM_LIST = [
  'abanan',
  'rimar',
  'repase',
  'sobreplanes',
  'balcon',
  'rebroto',
  'apresa',
  'pares',
  'ultimar',
  'alados',
  'velas',
  'revisen'
]

def print_line
  puts '--------------------------'
end

# Pre-condicion: Las oraciones ingresada no deben comenzar con un espacio
def acronym(palabra)
  acronimo = palabra.chars
  aux = []
  aux.push(acronimo[0])
  i = 1
  while i < acronimo.length
    if acronimo[i] == ' ' || acronimo[i] == '-'
      aux.push(acronimo[i+1])
    end
   i = i+1
  end
  return aux.join('')
end

#Convierte la palabra a minuscula
def convertidor(palabra)
  minuscula = palabra.downcase
  return minuscula
end

#Convierte una cadena en un array de caracteres y luego los ordena ascendentemente
def ordenAscendente(palabra)
  array = palabra.chars
  array.sort
  return array
end

def anagram(palabra)
  anagrama = convertidor(palabra)
  array = ordenAscendente(anagrama)

  ANAGRAM_LIST.each do |i|
    j = ordenAscendente(i)
    if (array.length == j.length)
      if (j - array).empty? #comprobar que todos los valores de un array están en incluidos en otro.
        return true
      end
    end  
  end
  return false
end

def main_menu
  puts 'Seleccionar una opcion: '
  puts '1. Acronimo'
  puts '2. Anagrama'
  puts '3. Salir'
  print_line
  case gets.chomp.to_i
  when 1
    print_line
    puts 'Ingrese por pantalla una frase '
    acronimo = gets.chomp
    siglas = acronym(acronimo)
    puts 'Resultado:'
    print_line
    puts siglas.upcase
    print_line
    puts ' '
    main_menu
  when 2
    print_line
    puts 'Ingrese una palabra y te dire si es un anagrama: '
    respuesta = gets.chomp
    puts 'Resultado:'
    print_line
    sera_anagrama = anagram(respuesta)
    if sera_anagrama
      puts 'Es anagrma'
    else 
      puts 'No es anagrama'
    end
    print_line
    puts ' '
    main_menu
  when 3
    puts 'Saliendo'
  else
    puts 'Opcion invalida'
    puts ' '
    main_menu
  end
end

main_menu
