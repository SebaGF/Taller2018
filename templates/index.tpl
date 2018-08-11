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
            <div class="divSuperior">
                <span style="color: white;float: left;margin-top: 9px; margin-left: 20px;">CookingBlogApp</span>
                <span style="float: right; margin-top: 9px; margin-right: 15px;margin-top: 5px;color: white;">Bienvenido {$user.nombre}<a style="margin-left: 5px;color: white;" href="?accion=logout">Salir</a></span>
            </div>
            <div style="width: 100%; height: 90%;">
                <div id="publicaciones" style="width: 100%; height: 100%;">
                    
                    <div id="recetas" class="divPublicaciones">
                        <h1 id="tituloRecetas" style="cursor: pointer;">Recetas</h1>
                        <form action="?" method="post" name="listaRecetas">
                            <ul id="ulRecetas"></ul>
                            <span id="resultado"></span>
                        </form>
                    </div>
                    
                    <div id="notas" class="divPublicaciones">
                        <h1 id="tituloNotas" style="cursor: pointer;">Notas</h1>
                        <form action="?" method="post" name="listaNotas">
                            <ul id="ulNotas"></ul>
                            <span id="resultado"></span>
                        </form>
                    </div>
                    
		</div>
                
            </div>
	</body>
</html>