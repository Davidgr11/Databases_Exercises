db.demo.insert({"nombre":"Juan D Silva", "profesion":"maestro"})
db.demo.remove({"nombre":"Juan D Silva"})
db.demo.drop()



db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$set":{"nombre":"Juan","apellidopat":"Silva","apellidomat":"Galindo"}},{upsert:true})
db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$set":{"nombre":"Juan","apellidopat":"SilvaUpd","apellidomat":"Galindo"}},{upsert:true})

db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$set":{"nombre":"Juan","apellidopat":"Silva","apellidomat":"Galindo","version":2,"profesion":"maestro"}},{upsert:true})

db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$set":{"nombre":"Juan","apellidopat":"Silva","apellidomat":"Galindo","version":3,"profesion":"maestro"}, "$push":{"correos":{"$each":[{"escuela":"jdsg@lasallisats.org.mx","personal":"jdsilva@gmail.com"}]}}},{upsert:true})

db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$set":{"version":4}, "$push":{"correos":{"trabajo":"jdsg@mx.zurich.com"}}},{upsert:true})
db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$push":{"correos":{"personal":"jd@gmail.com"}}},{upsert:true})
db.demo.updateOne({"nombre":{$eq:"Juan"}},{"$push":{"correos":{"escuela":"jdsg@lasallistas.org.mx"}}},{upsert:true})

db.demo.update({"nombre":{$eq:"Juan"}}, 
                      {'$pull': {'correos': {'escuela': "jdsg@lasallisats.org.mx","personal":"jdsilva@gmail.com"
                                           }
                                }
                      }
                )


db.demo.find({
        $or: [{
            apellidopat: {"$regex": "Silva"} 
        }, {
            apellidomat: {"$regex": "G"}
        }, {
            "correos.escuela": "jdsg@lasallisats.org"
        }]
    })
    .sort({
        nombre: -1
    })
    .limit(100)


db.demo.drop()

-- crea registro si no esta y hace pussh de un elemento en libro
   db.carrito.updateOne({"Nombre":{$eq:"Marcelo"}},{"$set":{"CLiente":{nombre:"MarceloMarifer",edad:25},"version":3.4}, "$push":{"Libros":{"Titulo":"BD33333","Autor":"CJ DAte3","Editorial":"Wiley3"}}},{upsert:true})


-- quita el cmampo CLiente
   db.carrito.updateOne({"Nombre":{$eq:"Marcelo"}},{"$unset":{"CLiente":""}})
   
-- agrega el objeto cliente (nombre y edad)

   db.carrito.updateOne({"Nombre":{$eq:"Marcelo"}},{"$set":{"Cliente":{nombre:"MarceloMarifer",edad:25}}})


-- quita el cmampo Nombre
   db.carrito.updateOne({"Nombre":{$eq:"Marcelo"}},{"$unset":{"Nombre":""}})

-- busca LIKE %m% ignorando may sculas
 db.carrito.find({"Cliente.nombre":  /.*m.*/i})

-- agrega libro 
db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}},{"$push":{"Libros":{"Titulo":"AS01","Autor":"Kendall","Editorial":"Pearson"}}},{upsert:true})

db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}},{"$push":{"Libros":{"Titulo":"BD01","Autor":"Elmaski","Editorial":"AW"}}},{upsert:true})
db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}},{"$push":{"Libros":{"Titulo":"BD5","Autor":"Korth","Editorial":"MacGrawHill"}}},{upsert:true})


-- quita el elemento 2 del arreglo, primero lo desliga con unset y despu s le hace pull del array
   db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}},{"$unset":{"Libros.2":1}})
   db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}}, {$pull : {"Libros" : null}})

-- quita elmento enb bas eal fitro del campo titulo
   db.carrito.updateOne({"Cliente.nombre":{$eq:"MarceloMarifer"}}, {$pull : {"Libros": {"Titulo" : "BD41"}}})

-- quita elmento en base al fitro del campo titulo
   db.carrito.updateMany({"Cliente.nombre":{$eq:"MarceloMarifer"}}, {$pull : {"Libros": {"Titulo" : "BD5"}}})
