<?php
    session_start();
    
    include("include/funciones.php");
    include("configuracion.php");
    
    if(isset($_GET["accion"]) && $_GET["accion"] == "logout"){
        unset($_SESSION["user"]);
        session_destroy();
        header("location: login.php");
    }
    
    $accion = isset($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
    
    if(strlen($accion) && $accion == "agregarCategoria"){
        $conn->conectar();
        $params = array(
            array("nombre", $_POST["nombreCategoria"], "string"), 
        );

        $sql = "INSERT INTO  `blogdecocina`.`categorias` (`nombre`)VALUES (:nombre);";
        
        $conn->consulta($sql, $params);
        
        $conn->desconectar();
    } else if(strlen($accion) && $accion == "editarCategoria"){
        $conn-> conectar();
       
        $sql = "UPDATE  `blogdecocina`.`categorias` SET  `nombre` = :nombre WHERE  `categorias`.`categoria_id` = :id;";
        $params = array(
            array("nombre", $_POST["nombreEditarCategoria"], "string"),
            array("id", $_POST["idEditarCategoria"], "int"),
        );
        
        $conn->consulta($sql, $params);
        $conn->desconectar();
        
    } else if(strlen($accion) && $accion == "agregarPublicacion"){
        $conn->conectar();
        
        $params = array(
            array("titulo", $_POST["tituloPublicacion"], "string"),
            array("categoria_id", $_POST["selectCategoriaPublicacion"], "int"),
            array("tipo_id", $_POST["selectTipoPublicacion"], "int"),
            array("texto", $_POST["descripcionPublicacion"], "string"),
            array("usuario_id", $_SESSION["user"]["usuario_id"], "int"),
            array("fecha", date("y-m-d")),
            array("imagen", $_FILES["imagen"]["name"], "string"),
            array("eliminado", 0)
        );
        
        $name = $_FILES["imagen"]["name"];
        $tmp = $_FILES["imagen"]["tmp_name"];
        move_uploaded_file($tmp, "imgs/" . $name);
        
        $sql = "INSERT INTO  `blogdecocina`.`publicaciones` (`titulo`,`texto`,`fecha`,`imagen`,`categoria_id`,`tipo_id`,`usuario_id`,`eliminado`)VALUES (:titulo, :texto, :fecha, :imagen, :categoria_id, :tipo_id, :usuario_id, :eliminado);";
        $conn->consulta($sql, $params);
        
        $conn->desconectar();
        
        
    }
    $conn->conectar();    
    
    $conn->consulta("SELECT * FROM  `categorias` c WHERE c.eliminado=0"); 
    $categorias = $conn->restantesRegistros();
    $conn->desconectar();
    $smarty->assign("categorias", $categorias);
    
    $conn->conectar();
    $conn->consulta("SELECT * FROM `tipos`");
    $tipos = $conn->restantesRegistros();
    $conn->desconectar();
    $smarty->assign("tipos", $tipos);
    
    $user = $_SESSION["user"];
    $smarty->assign("user", $user);

    
    $smarty->display("admin.tpl");
?>