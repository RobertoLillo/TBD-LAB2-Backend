import pymongo
import random

####### Conexion #######
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["tbd"]

####### Funciones #######
def fechasAzar():
	m30 = [4,6,9,11]
	m31 = [1,3,5,7,8,10,12]
	ai = random.randint(2000,2020)
	af = ai + random.randint(1,5)
    
	### inicio ###
	mi = random.randint(1,12)
	if mi in m30:
		di = random.randint(1,30)
	elif mi in m31:
		di = random.randint(1,31)
	else:
		di = random.randint(1,28)
        
	### fin ### 
	mf = random.randint(1,12)
	if mf in m30:
		df = random.randint(1,30)
	elif mf in m31:
		df = random.randint(1,31)
	else:
		df = random.randint(1,28)
	fi = str(di)+'-'+str(mi)+'-'+str(ai)
	ff = str(df)+'-'+str(mf)+'-'+str(af)
	return (fi, ff)

def activoAzar():
    estados = [True, False]
    return estados[random.randint(0,1)]

####### Entidades #######
tarea = db["tarea"]
emergencia = db["emergencia"]

####### Emergencias #######
for i in range(1,31):
    n = str(i)
    ### Valores ###
    name = "emergencia -" + n
    init,end = fechasAzar()
    description = "descripcion - " + n
    
    ### Insercion ###
    json = {"nombre":name,"descripcion":description,"finicio":init,"ffin":end, "tareas":[]}
    query = emergencia.insert_one(json)
    
emergencias = emergencia.find()

####### Tareas #######
for i in range(1,31):
    n = str(i)
    ### Valores ###
    name = "tarea - " + n
    init,end = fechasAzar()
    description = "descripcion - " + n
    status = activoAzar()
    
    ### Insercion ###
    json = {"nombre":name,"descripcion":description,"finicio":init,"ffin":end,"estado":status}
    query = tarea.insert_one(json)

    ### Tarea(i) y  en Emergencia(i) ###
    index = i-1
    tareas_emer = emergencias[index]['tareas']
    tareas_emer.append(str(query.inserted_id))
    id_emer = emergencias[index]['_id']
    query = emergencia.find_one_and_update({"_id":id_emer},{"$set":{'tareas': tareas_emer}})

