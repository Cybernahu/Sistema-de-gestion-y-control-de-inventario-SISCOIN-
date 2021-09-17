<?php
	/** 
 * @brief Es la conexion a la base de datos, a la cual se refieren los otros archivos cuando lo requieren
 * @param conexion es la variable en la cual se guarda los datos de la base de datos 
 */
	$conexion = new mysqli('localhost', 'root', '', 'buss');
	if ($conexion->connect_errno) {
		echo "Lo sentimos, este sitio web está experimentando problemas.";
		exit;
	}
	
?>