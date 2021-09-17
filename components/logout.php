<?php
/** 
 * @brief En las siguientes sentencias se limpiarán las variables, se destruirán las sesiones y te enviará a la página de login
 */
	session_start();
	session_unset();
	session_destroy();
	
	header('location:index.php');

?>