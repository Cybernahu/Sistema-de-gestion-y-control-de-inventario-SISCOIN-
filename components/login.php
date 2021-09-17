<?php
/** 
 * @brief Obtiene los datos del login, los compara con la base de datos asegurandose de que sean datos validos y envia al usuario a su ventana
 * @param usu En esta variable se guarda el nombre que ingresa el usuario en el login
 * @param pass  En esta variable se guarda la contraseña que ingresa el usuario en el login
 * @param sql En esta variable se guardará la consulta sql que trae los datos del usuario cuando corresponden a los ingresados en el login
 * @param numfilas Esta variable es para asegurarnos que la base de datos nos devuelva los datos requeridos
 * @param sqlperfil En esta variable se guardan los datos del usuario de base de datos para comprararlos y enviar al usuario a su correspondiente ventana
 * @param info En esta variable se guardan los datos del usuario para comprararlos con los de la base de datos y enviar al usuario a su correspondiente ventana
 * 
 */
if(isset($_POST['ingresar'])){
	
	$usu = $_POST['usuario'];
	$pass = MD5($_POST['clave']); 
	
	if($usu!="" && $pass!=""){	
	
		require("conexion.php");
		
		$sql = "SELECT * FROM usuario WHERE nombre = '$usu' AND clave ='$pass'";		
		$numfilas = mysqli_num_rows($conexion->query($sql));
		
		if($numfilas>0){	
						
			$sqlperfil = "SELECT nombre, tipoUsuario FROM usuario WHERE nombre = '$usu'";			
			
			$resultado = $conexion->query($sqlperfil);
			$info = $resultado -> fetch_assoc(); 			
			
			if($info['tipoUsuario']=="informatica"){
				
				header('location:informatica.php');
				
			}else if($info['tipoUsuario']=="director"){
				
				header('location:director.php');
				
			}else if($info['tipoUsuario']=="sub_a"){
				
				header('location:subdireccionA.php');
				
			}else if($info['tipoUsuario']=="sub_b"){
				
				header('location:subdireccionB.php');
				
			}else if($info['tipoUsuario']=="auditoria"){
				
				header('location:auditoria.php');
				
			}else if($info['tipoUsuario']=="compras"){
				
				header('location:compras.php');
				
			}else if($info['tipoUsuario']=="gerente"){
				
				header('location:cliente.php');
				
			}
			
			
			session_start();
			$_SESSION['usuario'] = $info['nombre'];
			$_SESSION['perfil'] = $info['tipoUsuario'];
			
			
		}else{
			echo "<script>alert(\"Usuario y/o contraseña incorrectos.\");window.location='index.php';</script>";
			exit;
		}
		
	}else{
			echo "<script>alert(\"No dejes campos vacios.\");window.location='index.php';</script>";
			exit;
		}
}


?>