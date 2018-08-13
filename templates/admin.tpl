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
                        <br />
                        <form action="admin.php" method="POST">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nombre</label>
                              <input type="text" class="form-control" id="nombreCategoria" style="width: 50%;margin-left: 25%;" name="nombreCategoria" placeholder="Nombre">
                            </div>
                            <input type="hidden" name="accion" value="agregarCategoria" />
                            <button type="submit" id="botonAgregarCategoria" class="btn btn-primary">Agregar</button>
                         </form>
                    </div>
                    <div id="eliminarCategoria">
                        <br />
                        <form action="?" method="post" name="listaCategorias">
				<ul id="ulCategorias">
                                    {foreach from=$categorias item=cat}
					<li style="list-style: none">
                                            <span><input type="checkbox" name="categoria_id[{$cat.categoria_id}]" value="1" /></span>
                                            {$cat.nombre}<br />
					</li>
                                    {/foreach}
				</ul>
                                <button type="submit" id="botonEliminarCategoria" class="btn btn-primary">Eliminar</button>
			</form>                        
                    </div>
                    <div id="editarCategoria">
                        <br />
                        <select class="form-control" name="selectCategoria" id="selectCategoria" style="width: 50%;margin-left: 25%;">
                            {foreach from=$categorias item=cat}
                                    <option value="{$cat.categoria_id}">{$cat.nombre}</option>
                            {/foreach}
                        </select>
                        <br />
                        <form action="admin.php" method="POST">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nombre</label>
                              <input type="text" class="form-control" id="nombreEditarCategoria" style="width: 50%;margin-left: 25%;" name="nombreEditarCategoria" placeholder="Nombre">
                            </div>
                            <input type="hidden" id="idEditarCategoria" name="idEditarCategoria" />
                            <input type="hidden" name="accion" value="editarCategoria" />
                            <button type="submit" id="botonEditarCategoria" class="btn btn-primary">Editar</button>
                         </form>
                                
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
                        <br />
                        <form action="admin.php" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Nombre</label>
                              <br />
                              <input type="text" class="form-control" id="tituloPublicacion" style="width: 50%;margin-left: 25%;" name="tituloPublicacion" placeholder="Titulo">
                              <br />
                              <select class="form-control" name="selectCategoriaPublicacion" id="selectCategoriaPublicacion" style="width: 50%;margin-left: 25%;">
                                    <option value="" disabled selected>Categoria</option>
                                    {foreach from=$categorias item=cat}
                                            <option value="{$cat.categoria_id}">{$cat.nombre}</option>
                                    {/foreach}
                              </select>
                              <br />
                              <select class="form-control" name="selectTipoPublicacion" id="selectTipoPublicacion" style="width: 50%;margin-left: 25%;">
                                    <option value="" disabled selected>Tipo</option>
                                    {foreach from=$tipos item=tipo}
                                            <option value="{$tipo.tipo_id}">{$tipo.nombre}</option>
                                    {/foreach}
                              </select>
                              <br />
                              <input type="file" id="imagen" name="imagen" style="margin-left: 25%;" />
                              <!-- IMAGEN -->
                              <br />
                              <textarea class="form-control" id="descripcionPublicacion" name="descripcionPublicacion" nombre="descripcionPublicacion" rows="3" style="width: 50%;margin-left: 25%;" placeholder="Descripcion.."></textarea>
                            </div>
                            <input type="hidden" name="accion" value="agregarPublicacion" />
                            <button type="submit" id="botonAgregarPublicacion" class="btn btn-primary">Agregar</button>
                         </form>
                              
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