<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="../styles/estilos.css">
    <title>Login</title>
</head>

<body>
    <h1 class="tittleLogin">Siscoin</h1>
    <div class="mainContainerLogin">
        <div class="formContainer">
            <form class="loginBase" action="login.php" method="post">
                <input class="user inputTextLogin" type="text" name="usuario" placeholder="Usuario">
                <input class="userPwd inputTextLogin" type="password" name="clave" placeholder="Contraseña">
                <a><input class="submitButtonLogin" type="submit" value="INGRESAR" name="ingresar"></a>
            </form>
        </div>
    </div>
</body>

</html>
