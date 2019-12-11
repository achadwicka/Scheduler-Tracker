[![RoR](https://img.shields.io/badge/RoR-5.1.5-blue.svg)]()
[![Postgres](https://img.shields.io/badge/Postgres-10.3.0-blue.svg)]()
[![Node](https://img.shields.io/badge/Node-8.X-blue.svg)]()
[![ruby](https://img.shields.io/badge/ruby-2.5.0-blue.svg)]()

# KineTime

Proyecto para el ramo IIC3143 - Desarrollo de Software: http://kinetime.herokuapp.com/

> Check [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/) for more details.

#### Setup

* `docker-compose build`
* `docker-compose up`
* `docker-compose run web rake db:create`
* `docker-compose run web rake db:migrate`
* `docker-compose run web rake db:seed`

#### Open application
* Open `localhost:3000` with any browser.

#### Close Application
* `docker-compose down`
  
#### Extra
* Cada vez que se agrega una gema o se cambia de branch hay que bajar el contenedor y volver a correr el build.
