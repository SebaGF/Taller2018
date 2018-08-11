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
    }
    
    
    $user = $_SESSION["user"];
    $smarty->assign("mensaje", $mensaje);
    $smarty->assign("user", $user);    
    $smarty->display("admin.tpl");
?>