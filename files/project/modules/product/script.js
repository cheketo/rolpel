/****************************************\
|                 ALERTS                 |
\****************************************/
$(document).ready(function(){
	if(get['msg']=='insert')
		notifySuccess('El producto <b>'+get['element']+'</b> ha sido creado correctamente.');
	if(get['msg']=='update')
		notifySuccess('El producto <b>'+get['element']+'</b> ha sido modificado correctamente.');
});

/****************************************\
|             CREATE / EDIT              |
\****************************************/
$(function(){
	$("#BtnCreate").click(function(){
		var target		= 'list.php?element='+$('#title').val()+'&msg='+ $("#action").val();
		askAndSubmit(target,'Product','¿Desea crear el producto <b>'+$('#title').val()+'</b>?');
	});
	$("#BtnCreateNext").click(function(){
		var target		= 'new.php?element='+$('#title').val()+'&msg='+ $("#action").val();
		askAndSubmit(target,'Product','¿Desea crear el producto <b>'+$('#title').val()+'</b>?');
	});
	$("#BtnEdit").click(function(){
		var target		= 'list.php?element='+$('#title').val()+'&msg='+ $("#action").val();
		askAndSubmit(target,'Product','¿Desea modificar el producto <b>'+$('#title').val()+'</b>?');
	});
	$("input").keypress(function(e){
		if(e.which==13){
			$("#BtnCreate,#BtnEdit").click();
		}
	});
});

/****************************************\
|          CHARACTER COUNTER             |
\****************************************/
$('input, textarea').keyup(function() {
  var max = $(this).attr('maxLength');
  var curr = this.value.length;
  var percent = (curr/max) * 100;
  var indicator = $(this).parent().children('.indicator-wrapper').children('.indicator').first();

  // Shows characters left
  indicator.children('.current-length').html(max - curr);

  // Change colors
  if (percent > 10 && percent <= 50) { indicator.attr('class', 'indicator low'); }
  else if (percent > 50 && percent <= 70) { indicator.attr('class', 'indicator med'); }
  else if (percent > 70 && percent < 100) { indicator.attr('class', 'indicator high'); }
  else if (percent == 100) { indicator.attr('class', 'indicator full'); }
  else { indicator.attr('class', 'indicator empty'); }
  indicator.width(percent + '%');
});
