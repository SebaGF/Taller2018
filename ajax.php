<?php


include("configuracion.php");

$accion = isset($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
if(strlen($accion) && $accion == "traerCategorias"){

    $conn->conectar();    
    $conn->consulta("SELECT * FROM  `categorias`");
    if($resultado = $conn->restantesRegistros()){
        echo json_encode($resultado);
    } else {
        echo json_encode(array("error" => $conn->ultimoError()));
    }
    
    $conn->desconectar();
    
    die();
}else if(strlen($accion) && $accion == "cargarRecetas"){
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
}else  if(strlen($accion) && $accion == "eliminarCategorias"){
    if(!isset($_POST["categoria_id"])){
        retornar("Debe seleccionar algun contacto a eliminar.");        
    }
    
    sleep(1);
        
    $conn->conectar();
        
    $categorias = "";
    foreach($_POST["categoria_id"] as $k => $v){
        if(strlen($categorias)){
            $categorias .= "or ";
        }
        $categorias .= "categoria_id = " . (int)$k . " ";
    }

    $valor = $conn->consulta("UPDATE  `blogdecocina`.`categorias` SET  `eliminado` = 1 WHERE  ({$categorias})");
    
    $resultado = $conn->restantesRegistros();
        
    $error = $conn->ultimoError();
    
    $conn->desconectar();

    if($valor){
        retornar("ok");
    } else {
        retornar("Error: " . $error);
    }
 }
 
 function retornar($mensaje){
    $respuesta = array("resultado" => $mensaje);
    die(json_encode($respuesta));
 }