Es un problema de la pluralizacion del person/people aparentemente

Sol 1 - Sobreescribir el show y el edit para que se puede generar correctamente la ruta users/:id/people/:id
agregar en user 
def people
  return user.person
end
para no tener problemas con person/people
-------------------------------------------------------------------------------------

Sol 2 - Manyinearla. Sacar el belongs_to de person para que no se generen las rutas anidadas. Sacar el 
link a "Persona" en la pagina principal y en el show de user, person linkea a admin/people/:id

Sol 3 - Cambiar person por otro nombre que no genere el conflicto de pluralizacion. Con course y course_module
no se da el problema usando el belongs_to

Sol 4 - Generar people/:id/users/:id. Es decir, dar vuelta todo, anidar al reves, incluyendo los form y los modelos