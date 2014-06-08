Proyecto de AP - Scrum Management System
---------------------------

OJO -> Las partes importantes del proyecto están completamente comentados. Estos son:
  La carpeta app, dentro de ella la carpeta controllers, los controladores. Sobre todo el ProjectsController, está comentado.
  En realidad lo que importa del proyecto es: la carpeta App, el archivo Gemfile.rb, el archivo Routes.rb.

Les recomiendo que instalen Ruby On Rails usando esta guía http://railsapps.github.io/installrubyonrails-ubuntu.html
Yo estoy usando la version 4.0.4 pero con que sea mayor a 4 están bien.

Tienen que tener instalado también MySQL en su linux, se instala fácil por el apt-get si estan en ubuntu. Cuando lo instalen, asegurense de que la contraseña del root sea semcr .

Luego, cuando tienen el RVM, rails, Node.js y el MySQL instalados (si siguieron la guía), nada más se meten en consola a la carpeta raíz del proyecto y ejecutan
  rake db:schema:load
  
Eso les genera la base de datos con la que yo estoy trabajando, en el MySQL. No recuerdo si antes tienen que crearla, es capaz que si tienen que crear una base de datos llamada sms y un usuario llamado root (el predeterminado) con pass semcr.

Luego de esto, desde la misma carpeta raíz, ejecutan
  bundle install
  
Eso les instala todas las gemas (librerias) que usa el proyecto. Puede durar un buen rato.

Cuando eso está listo, simplemente llaman
  rails s
  
Y eso inicia el servidor local, lo pueden acceder en localhost:3000

Cualquier cosa me preguntan por face, correo o me llaman.
