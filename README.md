# tryton-project

Tryton-project es un repositorio base con todo lo necesario para crear
una instalación de tryton localizada con los módulos de
argentina. Utiliza docker al estilo microservices para levantar un
container con tryton y otro para postgresql. También está pensado para
poder desarrollar sobre esta base, pudiendo agregar y modificar
modulos.

# Instalando docker

Dependiendo de tu sistema operativo/distribución corresponderá una descarga diferente.
Podes encontrar las diferentes formas de instalación
[aqui](http://docs.docker.com/installation)

En el caso de ubuntu sería:

    ```$ wget -qO- https://get.docker.com/ | sh```

# Drun

Para facilitar el manejo de los container hemos creado un pequeño
wrapper. Para activarlo use:

    ```$ source drunrc```

# Creando los containers

Una vez hecho el source de drunrc tenemos disponible el comando
drun. La primera vez tendremos que ejecutar los siguientes comandos
para construir los container y poner los módulos argentinos.

    ```$ drun build_image # Build de imágenes de docker```
    ```$ drun create # Crea los containers de docker```
    ```$ drun install_modules # Instala los módulos definidos en modules.json```
    ```$ drun stop # Detiene los containers```
    ```$ drun start # Vuelve a arrancar los containers```
