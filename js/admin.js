$(document).ready(function(){
    mostrarAgregarCategoria();
    mostrarAgregarPublicacion();
    
        $("#botonEliminarCategoria").click( function(e){ 
            e.preventDefault();
            borrarDeLaLista(); 
        });
        
    var select = document.getElementById('selectCategoria');
    select.addEventListener('change',
    function(){
      var selectedOption = this.options[select.selectedIndex];
      $("#nombreEditarCategoria").val(selectedOption.text);
      $("#idEditarCategoria").val(selectedOption.value);
    });
    
    
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

function eliminarCategoria(){
    $.ajax({
       url: "ajax.php",
       dataType: "json",
       type: "POST",
       data: "accion=eliminarCategorias&" + $("#eliminarCategoria form").serialize(),
       timeout: 4000
    }).done(function(data){
        if(data.resultado == "ok"){
        } else {
            alert("Hubo un error en el servidor: " + data.resultado);
        }
    }).fail(function(e){
        console.log(e);
    });
    
}


function borrarDeLaLista(){
	var ul = $("#ulCategorias");
	var lis = ul.find("li");
        eliminarCategoria();
	for(var i=0; i < lis.length; i++){
		var li = $(lis[i]);
		var checkbox = li.find("input:checked");
		if(checkbox.length > 0){
			li.remove();
		}
	}
}

function llenarFormulario($categoria){
    console.log($categoria);
}
