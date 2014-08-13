// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

// metodo para adicionar nuevo fila de tabla
$(document).on('click','.add_department',function(){
  $.ajax({
      url: '/registers/new_department',
      dataType: 'html'
  }).success(function(data){
  	console.log(data);
	  $('#table_lands tbody tr:last').after(data);
  })
});

//metodo para actulizar el listado de municipios cuando se elige un departmento
$(document).on('change','.select_department',function(){
	id_department = $(this).val();

	if(id_department){
		id_tr_departments = $(this).attr('id');
	  id_tr_municipalities = id_tr_departments.replace('lands_department_', 'lands_municipality_')
	  $.ajax({
	      url: '/registers/' + id_department + '/municipalities_from',
	      dataType: 'html'
	  }).success(function(data){
		  $('#' + id_tr_municipalities).html(data);
	  })
	}
	else{
		$('#' + id_tr_municipalities).html('<option></option>');
	}
});