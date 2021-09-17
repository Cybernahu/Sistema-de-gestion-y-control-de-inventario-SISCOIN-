<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./../styles/estilos.css" />
    <title>Cliente</title>
</head>
<?php 
/** 
 * @brief Impide el ingreso a la ventana sin el logueo previo, también impide que otros usuarios sin permisos ingresen en este
 */
	session_start(); 
	
	if(empty($_SESSION['usuario'])){
		
		header('location:index.php');
		
	}else{
        if($_SESSION['perfil']=='informatica'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='informatica.php';</script>";
        }else{
            
        }if($_SESSION['perfil']=='auditoria'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='auditoria.php';</script>";
        }else{
            
        }if($_SESSION['perfil']=='director'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='director.php';</script>";
        }else{
            
        }if($_SESSION['perfil']=='sub_a'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='subdireccionA.php';</script>";
        }else{
            
        }if($_SESSION['perfil']=='sub_b'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='subdireccionB.php';</script>";
        }else{
            
        }if($_SESSION['perfil']=='compras'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='compras.php';</script>";
        }else{
            
        }               		

	}	 
	
?>
<body>
    <header>
        <nav class="nav">
            <a class="cerrarSesion"  href="logout.php">
                Cerrar Sesión
            </a>
        </nav>
    </header>
    <div class="contenedorGeneral">
        <div class="titulo">
            <h1>Oficina cliente </h1>
        </div>
        

        <div class="contenedorBotones">
            
            <input class="boton" type="button" value="Solicitar repuestos"/>
            <input class="boton" type="button" value="Ver mi inventario"/>

        </div>
    </div>

</body>
</html>