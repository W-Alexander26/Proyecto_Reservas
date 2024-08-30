#Aplicación de 1NF,2NF,3NF.

##Se aplicó la 1NF en todas las tablas del "proyecto reserva".
--Se puede demostrar observando en cada tabla tiene un valor único, evitando que hayan varios datos dentro de cada una.
--Cada tabla posee un llave primaria.

## Aplicación de 2NF.
--Se corrobora que se aplicó la 2NF, teniendo en cuenta principalmente que se cumple la aplicación de 1NF.
--Esto se demuestra observando que cada tabla depende completamentamente de su llave primaria
--haciendo una relacion funcional y no transitoria.

### Aplicación de 3NF.
--Se cumple con las reglas de la 2NF.
--Se aplica la dependencia que en la tabla Cliente(id_cliente PK) es la que determina la funcionalidad 
--de las columnas,observandose que id_pais depende de id_cliente pero no genera una dependencia transitoria 
--con la tabla Cliente. A su vez se puede entender que el resto de columnas dependeran de su PK id_cliente
--para funcionar de manera unica.
--------------------------------------------------------------------------------------------------------------
--En la tabla Reserva: por ejemplo id_cliente,check_in y check_out_date,tanto como habitacion_id dependen 
--completamente de su llave primaria haciendo un relacion funcional.

--En resumen, se aplica todas las reglas de las 3 formas de normalizacion conjuntas.
--Evitando tener varios valores en una columna.
--Evitando la duplicacion de columnas.
--Cada tabla tiene una PK con identificador único.
--No hay valores repetitivos.
--Y en todas las tablas se crean relaciones dependientes de su PK evitando relaciones parciales 
--o transitorios con sus otros atributos.