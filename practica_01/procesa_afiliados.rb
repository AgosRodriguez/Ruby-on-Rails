# encoding: utf-8

require 'csv'
require 'json'
require 'fileutils'

FILENAME = File.expand_path('../', __FILE__) + '/afiliados.csv'
FILENAME_RESULT = File.expand_path('../', __FILE__) + '/afiliados_titulares.json'

def lee_csv(archivo)
  file = archivo
  data = CSV.parse(File.read(file), headers: true)

  data.each do |row|
    puts "Nombre: #{row['Nombre']}\nDireccion: #{row['Direccion']}\nSexo: #{row['Sexo']}\nFecha Nacimiento: #{row['Fecha Nacimiento']}\nNro Afiliado: #{row['Nro Afiliado']}"
    puts "\n"
  end
end

def afiliados_titulares
  File.open(FILENAME_RESULT, 'w') do |f|  
    lee_csv(FILENAME).each do |row|
      if row["Nro Afiliado"].end_with? "/00"
        #Imprime por pantalla los afiliados titulares
        puts "Nombre: #{row['Nombre']}\nDireccion: #{row['Direccion']}\nSexo: #{row['Sexo']}\nFecha Nacimiento: #{row['Fecha Nacimiento']}\nNro Afiliado: #{row['Nro Afiliado']}"
        puts "\n"

        #Escribe los afiliados titulares en un archivo json
        f.puts JSON.pretty_generate(row.to_hash)
      end
    end
  end
end


if File.exist?(FILENAME)
  FileUtils.cp FILENAME, FILENAME + '.bak'

lee_csv(FILENAME)
afiliados_titulares
else
  puts "No existe archivo afiliados.csv"
end
