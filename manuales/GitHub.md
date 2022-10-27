# Indice
  - [Generar clave ssh](#generar-clave-ssh)
  - [Configurar GitHub](#configurar-github)
  - [Comprobar si GitHub reconoce la key](#comprobar-si-github-reconoce-la-key)

# Generar clave ssh

````
$ ssh-keygen -t ed25519 -C "mail_que_usamos_en_github@mail.com"
````

*Aceptar con enter todo lo que pregunta, dejando todas las opciones por defecto*

# Configurar GitHub

+ *Copiar nuestra clave publica*

````
$ cat ~/.ssh/id_ed25519.pub
````

+ *Hacer click en nuestro avatar y luego en **Settings**.*

+ *En el submenu **Access** ingresar a **SSH and GPG keys**.*

+ *Click en **New SSH key**, ingresar un nombre en **Title**, seleccionar **Authentication key** en **Key type** y pegar la clave publica donde dice **Key**, hacer click en **Add SSH key** para finalizar.*

# Comprobar si GitHub reconoce la key

````
$ ssh git@github.com
````

*Si reconoce la key deberia retornar el siguiente mensaje*

````
PTY allocation request failed on channel 0
Hi nombre_usuario_github! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.
````
