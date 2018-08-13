<?php

    session_start();

    include("configuracion.php");
    include("include/funciones.php");

     if(isset($_POST["accion"]) && $_POST["accion"] == "login"){
        $conn->conectar();
        $params = array(
            array("email", $_POST["email"], "string"),
            array("contrasena", md5($_POST["contrasena"]), "string")
        );
        $conn->consulta("select * from usuarios where email=:email and password=:contrasena", $params);
 
        
        if($user = $conn->siguienteRegistro()){
            $_SESSION["user"] = $user;
            $_SESSION["user"]["logueado"] = true;
            $_SESSION["user"]["administrador"] = ord($user["administrador"]);
            if($_SESSION["user"]["administrador"]){
                header("location: admin.php");
            }else{
                header("location: index.php");
            }
            die();
        } else {
            $mensaje = "El usuario o contraseña ingresados son invalidos.";
        }
     }
     
        $smarty->assign("mensaje", $mensaje);
        $noLogueado = !isset($_SESSION["user"]) && !($_SESSION["user"]["logueado"]);
        $smarty->assign("noLogueado", $noLogueado);
        $smarty->assign("user", $_SESSION["user"]);
    
    $smarty->display("login.tpl");
