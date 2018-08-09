<?php

require_once 'include/Smarty.class.php';
require_once 'include/class.Conexion.BD.php';

$smarty = new Smarty();

$smarty->template_dir = "templates";
$smarty->compile_dir = "templates_c";
$smarty->config_dir = "configs";
$smarty->cache_dir = "cache";

$conn = new ConexionBD("mysql", "localhost", "blogdecocina", "root", "root");