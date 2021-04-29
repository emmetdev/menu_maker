# -*- coding: utf-8 -*-
"""
Created on Sat Jan  2 14:58:23 2021

@author: Emmet (github.com/emmetdev)


Example dbconfig.ini included in git, needs to be renamed from .example to .ini
A MySQL database needs to be running on a database server such as xampp
An example database import file is included in /setup_resources

"""

import mysql.connector
import configparser


config = configparser.ConfigParser()
config.read('dbconfig.ini')

config = {
  'user': config['mysqlDB']['user'],
  'password': config['mysqlDB']['pass'],
  'host': config['mysqlDB']['host'],
  'database': config['mysqlDB']['db'],
  'raise_on_warnings': bool(config['mysqlDB']['raise_on_warnings'])
}

cnx = mysql.connector.connect(**config)

print("\nWelcome to recipe generator. The available recipes are: \n")

cursor = cnx.cursor(prepared=True)
query = ("SELECT recipe_id, recipe_name FROM `recipes`")
cursor.execute(query)

i=1
for row in cursor:
  print("("+str(i)+") {}".format(row[1]))
  i+=1
cursor.close()



# # # # # Get user's recipe choices and sanitise the input # # # # #

while True:
    try:
        selection_list = input("Please enter which recipe numbers you require as a comma separated list:")
    except ValueError:
        print("Sorry, that input was not recognised. Please try again.")
        # try again... Return to the start of the loop
        continue
    else:
        try:
            required_recipes = selection_list.split(",")
            
            #cast each input to type int
            for n in range(len(required_recipes)):
                required_recipes[n] = int(required_recipes[n].strip())
            print(required_recipes)
            
            #input was successfully parsed!
            break
            
        except ValueError:
            print("Sorry 2, that input was not recognised. Please try again.")
            # try again... Return to the start of the loop
            continue

        
        
# # # # # Retreive all the ingredients & amounts then list them # # # # #

cursor = cnx.cursor(buffered=True)
for recipe_id in required_recipes:
    print ("\n**** Ingredients for recipe "+str(recipe_id)+": ****")
    # Parameterized query
    query = """ SELECT recipe_ingredients.ingredientsID, ingredients.ingredient_name, recipe_ingredients.quantity, recipe_ingredients.quantity_unit, ingredients.is_storecupboard
                    FROM
                    recipe_ingredients LEFT JOIN ingredients
                    ON
                    recipe_ingredients.ingredientsID = ingredients.ingredient_id
                    WHERE
                    recipe_ingredients.recipesID = %s"""

    param = (recipe_id, )
    cursor.execute(query, param)

    
    i=1
    for row in cursor:
      print("("+str(i)+") {}".format(row[1]), row[2], row[3])
      i+=1

cursor.close()



# # # # # Retreive all the steps needed for each recipe and list them # # # # #

cursor = cnx.cursor(buffered=True)
for recipe_id in required_recipes:
    
    # Parameterized query
    query = """SELECT recipe_id, recipe_name, steps FROM `recipes` WHERE recipe_id = %s"""

    param = (recipe_id, )
    cursor.execute(query, param)
    
    print("\n")
    i=1
    for row in cursor:
      print("**** Steps for recipe "+str(recipe_id)+", "+(row[1])+": ****\n"+row[2])
      i+=1

cursor.close()



# # # # # Retreive all the "fresh" ingredients for all meals selected # # # # #

cursor = cnx.cursor(buffered=True)

# Parameterized query

l = required_recipes
if len(l) > 1:
    t = tuple(l)
else:
    t = '('+str(l[0])+')'

query = """SELECT recipe_ingredients.ingredientsID, ingredients.ingredient_name, SUM(recipe_ingredients.quantity), 
recipe_ingredients.quantity_unit, ingredients.is_storecupboard 
FROM recipe_ingredients 
LEFT JOIN ingredients 
ON recipe_ingredients.ingredientsID = ingredients.ingredient_id 
WHERE recipe_ingredients.recipesID in {} AND is_storecupboard = 0 
GROUP BY recipe_ingredients.ingredientsID""".format(t)

cursor.execute(query)

print("\n**** All fresh ingredients required: ****")

i=1
for row in cursor:
  print("("+str(i)+") {}".format(row[1]), row[2], row[3])
  i+=1

cursor.close()



# # # # # Retreive all the "store cupboard" ingredients for all meals selected # # # # #

cursor = cnx.cursor(buffered=True)


l = required_recipes
if len(l) > 1:
    t = tuple(l)
else:
    t = '('+str(l[0])+')'

query = """SELECT recipe_ingredients.ingredientsID, ingredients.ingredient_name, SUM(recipe_ingredients.quantity), 
recipe_ingredients.quantity_unit, ingredients.is_storecupboard 
FROM recipe_ingredients 
LEFT JOIN ingredients 
ON recipe_ingredients.ingredientsID = ingredients.ingredient_id 
WHERE recipe_ingredients.recipesID in {} AND is_storecupboard = 1 
GROUP BY recipe_ingredients.ingredientsID""".format(t)

cursor.execute(query)

print("\n**** All store-cupboard ingredients required: ****")

i=1
for row in cursor:
  print("("+str(i)+") {}".format(row[1]), row[2], row[3])
  i+=1

cursor.close()

cnx.close()