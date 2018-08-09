<?php


include("configuracion.php");

$accion = isset($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];

if(strlen($accion) && $accion == "cargarRecetas"){
    /*
    if(!($_SESSION["user"]["logueado"])){
        die( json_encode(array("error" => "Debe estar autenticado para realizar esta consulta.")) );
    }
     * 
     */
    $conn->conectar();    
    $conn->consulta("SELECT * FROM  `publicaciones` p WHERE p.tipo_id =1 LIMIT 0,4");
    if($resultado = $conn->restantesRegistros()){
        echo json_encode($resultado);
    } else {
        echo json_encode(array("error" => $conn->ultimoError()));
    }
    
    $conn->desconectar();
    
    die();
} else if(strlen($accion) && $accion == "cargarNotas"){
    /*
    if(!($_SESSION["user"]["logueado"])){
        die( json_encode(array("error" => "Debe estar autenticado para realizar esta consulta.")) );
    }
     * 
     */
    $conn->conectar();    
    $conn->consulta("SELECT * FROM  `publicaciones` p WHERE p.tipo_id =2 LIMIT 0,4");
    if($resultado = $conn->restantesRegistros()){
        echo json_encode($resultado);
    } else {
        echo json_encode(array("error" => $conn->ultimoError()));
    }
    
    $conn->desconectar();
    
    die();
}