# Menu_maker

A recipe generator for lockdown dining.

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Acknowledgments](#acknowledgments)

## General info
This project is a simple recipe generator written in Python and MySQL. The single script menu_maker.py uses a MySQL database with three tables 'ingredients', 'recipes' and 'recipe_ingredients'. On selecting which recipes the user wants to view, a print out of the ingredients and steps for each recipe is returned, as well as an aggregated list of "fresh" and "store-cupboard" ingredients.
	
## Technologies
Project is created with:
* Python 3.8
* MySQL (tested with XAMPP phpMyAdmin using server version 10.4.8-MariaDB)
* Python packages: mysql.connector, configparser
	
## Setup
To run this project either clone the repository locally, or download the files to a directory on your computer.

Install a MySQL database engine, for example MariaDB packaged which comes packaged as part of Apache XAMPP https://www.apachefriends.org/download.html

Configure a database user, for example "meals_admin".

Import the example database using the db_example_for_import.sql file in the setup_resources directory and ensure the user has privileges over the new database.

Rename the file dbconfig.ini.example to dbconfig.ini and ensure all fields have been filled out, including the password for your chosen database user

Ensure python 3 (3.8 recommended) is installed and configured in your environment.

Use the terminal/CMD to navigate to the directory where menu_maker.py is located and run:

```
$ python menu_maker.py

```

## Acknowledgments
Full list of references may be found in /setup_resources/references.txt
With thanks to authors below who have tutorials which can be used to convert this project into a python flask app hosted on Google Cloud:

Martin Breuss https://realpython.com/python-web-applications/
Wole Oyekanmi https://www.smashingmagazine.com/2020/08/api-flask-google-cloudsql-app-engine/ 