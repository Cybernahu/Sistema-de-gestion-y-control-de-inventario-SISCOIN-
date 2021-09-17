<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./../styles/estilos.css" />
    <title>Auditoria</title>
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
            
        }if($_SESSION['perfil']=='gerente'){
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
            <a class="cerrarSesion" href="#">
                Cerrar Sesión
            </a>
        </nav>
    </header>
    <div class="titulo">
        <h1>auditoria</h1>
    </div>
    <div class="contenedorGeneralAuditoria">

        <div class="contenedorTablaAuditoria">
            <h3>Historial de compras</h3>
            <table class="tablaAuditoria">
                <tr  class="tablaAuditoria">
                    <th >
                        Nro Solicitud
                    </th>
                    <th>
                        Fecha
                    </th>
                    <th>
                        Motivo
                    </th>
                    <th>
                        Articulo
                    </th>
                    <th>
                        Cantidad
                    </th>
                    <th>
                        Precio
                    </th>
                    
                </tr>
                <tr  class="tablaAuditoria">
                    <td>
                        ola
                    </td>
                    <td>
                        carambola
                    </td>
                    <td>
                        Cacerola
                    </td>
                    <td>
                        Ornitorrinco
                    </td>
                    <td>
                        equisde
                    </td>
                    <td>
                        hipopotamo
                    </td>
                </tr>
            </table>
        </div>
        
        <div class="contenedorBotonAuditoria">
            <button class="botonAuditoria"> Solicitar repuestos </button>
        </div>
    </div>

</body>
</html>