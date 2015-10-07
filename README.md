Description
===========

General purpose Dockerfile for Drupal development

Usage:
======

Prerequisites
-------------

First of all you have to install Docker. 
I would suggest to use https://kitematic.com.


Spin up a container
-------------------

`$ docker run --name my-drupal-site -d -v path-to-my-drupal-site:/var/www/html -p port-number hairqles/docker-drupal:latest`


SSH into your container
-----------------------

`$ docker exec -it container-name bash`


Spin up a whole environment
---------------------------

Create a docker-compose.yml file into your Drupal root and run `$ docker-compose up -d`


Example docker-compose file
---------------------------

```
drupal:
  image: hairqles/docker-drupal
  container_name: project-name-drupal
  ports:
  - "80:80"
  volumes:
  - .:/var/www/html
  links:
  - mysql
mysql:
  image: mysql:5.7
  container_name: project-name-mysql
  environment:
  - MYSQL_DATABASE=content-hub
  - MYSQL_ROOT_PASSWORD=pizza
  - MYSQL_USER=content-hub
  - MYSQL_PASSWORD=pizza
  ports:
   - "3306:3306"
```
