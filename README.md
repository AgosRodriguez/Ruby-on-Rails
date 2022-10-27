# Indice
  - [Requisitos](#requisitos)
  - [Clonar repositorio](#clonar-repositorio)
  - [Crear nuevo branch](#crear-nuevo-branch)
  - [Ejecutar archivos ruby](#ejecutar-archivos-ruby)
  - [Chequear cambios](#chequear-cambios)
  - [Realizar commits](#realizar-commits)
  - [Subir cambios](#subir-cambios)
  - [Merge con branch main](#merge-con-branch-main)

# Requisitos

  * Ruby
  * Git

# Clonar repositorio

````
git clone git@github.com:ditec/backend-classroom.git
````

# Crear nuevo branch

> **ADVERTENCIA**
> * Asegurarse de estar posicionado en el branch correcto (main)
> * Usar nombre de pila como *nombre_del_nuevo_branch*

````
git checkout -b nombre_del_nuevo_branch
````

*El comando crea un nuevo branch y se posiciona en el*

# Ejecutar archivos ruby

````
ruby nombre_del_archivo
````

# Chequear cambios

````
git status
````

# Realizar commits

*Agregar archivos*

````
git add nombre_del_archivo
````

*Realizar commit*

````
git commit -m "mensaje descriptivo de la tarea realizada"
````

# Subir cambios

````
git push origin nombre_del_branch_donde_estoy_parado
````

# Merge con branch main

> **ADVERTENCIA**  
> Antes de hacer algo asegurarse de haber hecho commit de los cambios del branch actual para evitar perder el trabajo

*Chequear si existen cambios online*

````
git fetch
````

*Moverse al branch main*

````
git checkout main
````

*Traer al repositorio local los cambios subidos al online*

````
git pull origin main
````

*Volver a mi rama*

````
git checkout nombre_del_mi_branch
````

*Hacer merge con main*

````
git merge main
````
