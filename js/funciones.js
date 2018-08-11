$(document).ready(function(){
        getCategorias();
        setTimeout(function(){ 
            cargarListaNotas();
            cargarListaRecetas();
        }, 100);
        
        $("#tituloRecetas").click( function(){ console.log("REEE"); });
        $("#tituloNotas").click( function(){ console.log("REEE"); });
        
        
        
});
var categorias = [];

function getCategorias(){
    $.ajax({
       url: "ajax.php",
       dataType: "json",
       type: "POST",
       data: "accion=traerCategorias",
       timeout: 4000
    }).done(function(data){
        categorias = data;
    }).fail(function(e){
        return [];
    });
}

function cargarListaNotas(){
    $.ajax({
       url: "ajax.php",
       dataType: "json",
       type: "POST",
       data: "accion=cargarNotas",
       timeout: 4000
    }).done(function(data){
        $("#ulNotas").empty(); 
        for(var i = 0; i < data.length; i++){
            var publicacion = data[i];
            var categoria = getCategoriaDePublicacion(publicacion);
   
            var li = $("<li />");
            li.append("<br />");
            li.append( publicacion.titulo + "<br /><br />");
            li.append( categoria + "<br />");
            li.append("<br />");
            var url = "imgs/"+ publicacion.imagen ;
            li.append($("<img />").attr("src", url).attr("class", "imagenPublicacion"));
            var descripcion = publicacion.texto.substr(0, 150);
            li.append("<br />" + descripcion + "<br />");
           
            $("#ulNotas").append(li);
        }
    }).fail(function(e){
        $("#resultado").html("Error en la llamada al servidor");
    });
}

function cargarListaRecetas(){
    $.ajax({
       url: "ajax.php",
       dataType: "json",
       type: "POST",
       data: "accion=cargarRecetas",
       timeout: 4000
    }).done(function(data){
        $("#ulRecetas").empty(); 
        for(var i = 0; i < data.length; i++){
            var publicacion = data[i];
            var categoria = getCategoriaDePublicacion(publicacion);
            
            var li = $("<li />");
            li.append("<br />");
            li.append( publicacion.titulo + "<br /><br />");
            li.append( categoria + "<br />");
            li.append("<br />");
            var url = "imgs/"+ publicacion.imagen ;
            li.append($("<img />").attr("src", url).attr("class", "imagenPublicacion"));
            var descripcion = publicacion.texto.substr(0, 150);
            li.append("<br />" + descripcion + "<br />");
            $("#ulRecetas").append(li);
        }
    }).fail(function(e){
        $("#resultado").html("Error en la llamada al servidor");
    });
}

function getCategoriaDePublicacion(publicacion){
    var categoria;
    for(var i =0; i<categorias.length;i++){
        if(publicacion.categoria_id === categorias[i].categoria_id){
            categoria = categorias[i].nombre;
        }
    }
    return categoria;
}