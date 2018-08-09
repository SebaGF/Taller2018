<?php
    session_start();
    
    include("include/funciones.php");
    include("configuracion.php");
    
    if(!($_SESSION["user"]["logueado"])){
        header("location: login.php");
        die();
    }
    if(isset($_GET["accion"]) && $_GET["accion"] == "logout"){
        unset($_SESSION["user"]);
        session_destroy();
        header("location: login.php");
    }
    $user = $_SESSION["user"];
    
    $smarty->assign("user", $user);    
    $smarty->display("index.tpl");
?>
