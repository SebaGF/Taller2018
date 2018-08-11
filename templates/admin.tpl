{* Smarty *}
<!DOCTYPE HTML>
<html style="width: 100%;height: 100%;">
	<head>
		<title>Admin</title>
                <meta charset="utf-8" />
		<link rel="stylesheet" href="css/admin.css" type="text/css" />
                <link rel="stylesheet" href="css/bootstrap.css" type="text/css">
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/admin.js"></script>
                
	</head>
	<body> 
            <div class="divSuperior">
                <span style="color: white;float: left;margin-top: 9px; margin-left: 20px;">CookingBlogApp</span>
                <span style="float: right; margin-top: 9px; margin-right: 15px;margin-top: 5px;color: white;">Bienvenido {$user.nombre}<a style="margin-left: 5px;color: white;" href="?accion=logout">Salir</a></span>
            </div>
            <div style="width: 100%; height: 90%;text-align: center;">
                <h1>Administracion</h1>
                <div class="adminCategorias">
                    <h2>Categorias</h2>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                          <a class="nav-link active" onclick="mostrarAgregarCategoria()" >Agregar Categoria</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="mostrarEliminarCategoria()">Eliminar Categorias</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="mostrarEditarCategoria()">Editar Categorias</a>
                        </li>
                     </ul>
                    
                    <div id="agregarCategoria">
                        <form action="admin.php" method="POST">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nombre</label>
                              <input type="text" class="form-control" id="nombreCategoria" name="nombreCategoria" placeholder="Nombre">
                            </div>
                            <input type="hidden" name="accion" value="agregarCategoria" />
                            <button type="submit" id="botonAgregarCategoria" class="btn btn-primary">Agregar</button>
                         </form>
                        {$mensaje}
                    </div>
                    <div id="eliminarCategoria">
                        Eliminarcategoria
                    </div>
                    <div id="editarCategoria">
                        Editar categoria
                    </div>
                </div>

                
                <div class="adminPublicaciones">
                    <h2>Publicaciones</h2>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                          <a class="nav-link active" onclick="mostrarAgregarPublicacion()" >Agregar Publicacion</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="mostrarEliminarPublicacion()">Eliminar Publicacion</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" onclick="mostrarEditarPublicacion()">Editar Publicacion</a>
                        </li>
                     </ul>
                    
                    <div id="agregarPublicacion">
                        Agregar Publicacion
                    </div>
                    <div id="eliminarPublicacion">
                        Eliminar Publicacion
                    </div>
                    <div id="editarPublicacion">
                        Editar Publicacion
                    </div>
                </div>
                
            </div>

	</body>
</html>