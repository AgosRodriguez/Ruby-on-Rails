# Practica 03

Trabajando en un *Escape Room* se nos encargo modelar la clase *Person* para asegurar la seguridad de los asistentes, teniendo en cuenta las siguientes consideraciones

- La altura minima para entrar a las salas es de 130 centimetros

- Las salas estan dirigidas a personas mayores de 16 años, pero tambien podran entrar personas desde 14 años acompañados siempre por un adulto, en este caso se le otorga un pase al menor

- El pase no se otorga en el momento de la creacion y no es transferible

- El pase puede ser revocado por mal comportamiento

- Para ingresar a la sala debera tener un pase o que cumplir con la edad y la altura minima

Se deberan crear todas las funcionalidades necesarias para que la clase cumpla con los requisitos, ademas se deberan testear todas las funcionalidades de la clase, tanto el exito como el fallo

Para el testeo se utilizara **[minitest](https://github.com/minitest/minitest)**

## Instalacion nueva gema minitest

````
$ bundle install
````

> **INFORMACION**  
> Para la instalacion de la gema se genero un archivo *Gemfile*, se utiliza para que todos las personas que trabajan en el projecto tengan las mismas versiones de gemas

## Uso de minitest

Correr la bateria de test

````
$ ruby -Ilib:test person_test.rb -p
````

Correr un test en particular

````
$ ruby -Ilib:test person_test.rb -p -n test_nueva_instancia_valida
````
