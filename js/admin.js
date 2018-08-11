$(document).ready(function(){
    mostrarAgregarCategoria();
    mostrarAgregarPublicacion();
});

function  mostrarAgregarCategoria(){
    $("#agregarCategoria").show();
    $("#eliminarCategoria").hide();
    $("#editarCategoria").hide();
}

function  mostrarEliminarCategoria(){
    $("#agregarCategoria").hide();
    $("#eliminarCategoria").show();
    $("#editarCategoria").hide();
}

function  mostrarEditarCategoria(){
    $("#agregarCategoria").hide();
    $("#eliminarCategoria").hide();
    $("#editarCategoria").show();  
}

function  mostrarAgregarPublicacion(){
    $("#agregarPublicacion").show();
    $("#eliminarPublicacion").hide();
    $("#editarPublicacion").hide();
}

function  mostrarEliminarPublicacion(){
    $("#agregarPublicacion").hide();
    $("#eliminarPublicacion").show();
    $("#editarPublicacion").hide();
}

function  mostrarEditarPublicacion(){
    $("#agregarPublicacion").hide();
    $("#eliminarPublicacion").hide();
    $("#editarPublicacion").show();  
}