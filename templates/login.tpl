<!--{* Smarty *}
<!DOCTYPE HTML>
<html>
	<head>
		<title>Login</title>
                <meta charset="utf-8" />
		<link rel="stylesheet" href="css/estilos.css" type="text/css" />
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/funciones.js"></script>
	</head>
	<body>
		<h1>Login</h1>
                
		<form action="login.php" method="post" class="cuadro">
			<label for="user">Email:</label>
                        <input type="text" id="email" name="email" value="{$postUser}" />
			<label for="pass">Contrasena:</label>
			<input type="password" id="contrasena" name="contrasena" />
                        <input type="hidden" name="accion" value="login" />
                        <button type="submit">Entrar</button>
		</form>
                {$mensaje}
	</body>
</html>
-->

{* Smarty *}
<!DOCTYPE HTML>
<html>
	<head>
		<title>Login</title>
                <meta charset="utf-8" />
		<link rel="stylesheet" href="css/Login.css" type="text/css" />
                <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
                <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/funciones.js"></script>
	</head>
	<body>
            <div class="container">

                <div class="contenedorLogIn contenedor">

                    <div class="form-group text-center"> 
                        <h2>Blog de Cocina</h2>
                        <img id="profile-img" class="img-circle profile-img" src="./imgs/avatar.png" />
                    </div>
                    <form action="login.php" method="post" class="cuadro">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input for="user" type="text" id="email" name="email" required="required" class="form-control focus" placeholder="Usuario" value="{$postUser}" />
                            </div>
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-eye-close"></span></span>
                                <input for="pass" type="password" id="contrasena" name="contrasena" required="required" class="form-control" placeholder="Contraseña" />                    
                            </div>
                        </div>
                        <input type="hidden" name="accion" value="login" />
                        <div class="form-group text-right"><button type="submit" class="btn btn-primary">Entrar</button></div>
                        <p class="text-danger text-center">{$mensaje}</p>
                    </form>
                </div>

            </div>
	</body>
</html>


