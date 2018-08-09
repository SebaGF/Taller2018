{* Smarty *}
<!DOCTYPE HTML>
<html style="width: 100%;height: 100%;">
	<head>
		<title>CookingBlogApp</title>
                <meta charset="utf-8" />
		<link rel="stylesheet" href="css/estilos.css" type="text/css" />
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/funciones.js"></script>
	</head>
	<body> 
            <div style="width: 100%;height: 5%;">
                <span style="float: right;margin-right: 5px;margin-top: 5px;">Bienvenido {$user.nombre}<a style="margin-left: 5px;" href="?accion=logout">Salir</a></span>
            </div>
            <div style="width: 100%; height: 90%;">
                <div id="publicaciones" style="width: 100%; height: 100%;">
                    <div id="recetas" style="width: 50%; height: 100%; float: left; background-color: skyblue; text-align: center;">
                        <h1>Recetas</h1>
                        <form action="?" method="post" name="listaRecetas">
                        <ul id="ulRecetas">
                           
                        </ul>
                        <span id="resultado"></span>
                    </form>
                    </div>
                    <div id="notas" style="width: 50%; height: 100%; float: left; background-color: graytext; text-align: center;">
                        <h1>Notas</h1>
                        <form action="?" method="post" name="listaNotas">
                        <ul id="ulNotas">
                           
                        </ul>
                        <span id="resultado"></span>
                    </form>
                    </div>
		</div>
                
            </div>

	</body>
</html>