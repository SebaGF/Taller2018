$(document).ready(function(){
        cargarListaNotas();
        cargarListaRecetas();
});

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
            
            var li = $("<li />");
            var descripcion = publicacion.texto.substr(0, 150);
            li.append( publicacion.titulo + "<br />");
            li.append( $("<img />").attr("src", "imgs/IMG1.png") + "<br />");
            li.append( descripcion + "<br />");
           
            
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
            
            var li = $("<li />");
            var descripcion = publicacion.texto.substr(0, 150);
            li.append( publicacion.titulo + "<br />");
            li.append( descripcion + "<br />");
            $("#ulRecetas").append(li);
        }
    }).fail(function(e){
        $("#resultado").html("Error en la llamada al servidor");
    });
}