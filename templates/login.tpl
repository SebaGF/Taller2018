{* Smarty *}
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