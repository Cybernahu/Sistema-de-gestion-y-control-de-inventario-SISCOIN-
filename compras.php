<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./../styles/estilos.css" />
    <title>Compras</title>
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
            
        }if($_SESSION['perfil']=='gerente'){
            echo "<script>alert(\"No tienes permiso de entrar en este usuario.\");window.location='cliente.php';</script>";
        }else{
            
        }                       

    }    
    
?>
<body>
    <header>
        <nav class="nav">
            <a class="cerrarSesion" href="logout.php">
                Cerrar Sesión
            </a>
        </nav>
    </header>
    
    <div class="contenedorGeneralAuditoria">
        <div class="titulo">
            <h1>Compra</h1>
        </div>
        <div class="contenedorTablaAuditoria">
            <h3>Solicitudes de compra</h3>
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
                    <th>
                        Estado Solicitud
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
            <h3>Comprar articulos</h3>
        </div>
        <div class="contenedorFormularioCompra">
            
            <form>
                <p class="itemsEnBloque">Tipo de articulo</p>
                <select></select>
                <br>
                <p class="itemsEnBloque">Marca</p>
                <select></select>
                <br>
                <p class="itemsEnBloque">Cantidad</p>
                <input type="number" min="1" max="8"/>
                <br>
                <p class="itemsEnBloque">Precio total:</p>
                <br>
                <input type="submit" value="Confirmar Compra">
            </form>
        </div>
        <div class="contenedorBotonAuditoria">
            <button class="botonAuditoria"> Solicitar repuestos </button>
        </div>
    </div>

</body>
</html>