# Practica 04

Se deberan crear las clases necesarias y utilizar la gema **[ffaker](https://github.com/ffaker/ffaker/)** para generar datos aleatorios que cumplan las siguientes especificaciones

- Se debera retornar por pantalla un listado de empleados en formato *JSON*
- Los empleados pertenecen a la misma compania
- La compania tiene sucursales en Cordoba, Rio Cuarto, Villa Mercedes y San Luis
- En cada sucursal debe haber solo un usuario administrador
- Cada sucursal cuenta entre 3 y 6 empleados
- Los datos deben ser generados aleatoriamente, pero en las sucesivas ejecuciones el proceso debe retornar siempre el mismo resultado
- Si es posible los resultados deberan estar en castellano/latino

#### Employee
- **name**: string
- **address**: string
- [city](#city)
- [company](#company)
- [user](#user)

#### City
- **name**: string
- **zip_code**: string
- [state](#state)

#### State
- **name**: string

#### Company
- **name**: string

#### User
- **login**: string
- **email**: string
- **password**: string
- **admin**: boolean

## Instalacion de gema ffaker

````
$ bundle install
````

> **ADVERTENCIA**  
> Se considerara el archivo resultante un *JSON* valido si pasa la validacion de **[The JSON Validator](https://jsonlint.com)**
