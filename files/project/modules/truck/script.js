///////////////////////// CREATE/EDIT ////////////////////////////////////
$(function(){
	$("#BtnCreate,#BtnCreateNext").click(function(){
		if(validate.validateFields(''))
		{
			var BtnID = $(this).attr("id")
			if(get['id']>0)
			{
				confirmText = "modificar";
				procText = "modificaci&oacute;n"
			}else{
				confirmText = "crear";
				procText = "creaci&oacute;n"
			}
			var truck = utf8_encode($("#brand").val() + ' ' + $("#model").val());
			confirmText += " el cami&oacute;n '"+truck+"'";

			alertify.confirm(utf8_decode('¿Desea '+confirmText+' ?'), function(e){
				if(e)
				{
					var process		= process_url+'?object=Truck';
					if(BtnID=="BtnCreate")
					{
						var target		= 'list.php?element='+truck+'&msg='+ $("#action").val();
					}else{
						var target		= 'new.php?element='+truck+'&msg='+ $("#action").val();
					}
					var haveData	= function(returningData)
					{
						$("input,select").blur();
						notifyError("Ha ocurrido un error durante el proceso de "+procText+".");
						console.log(returningData);
					}
					var noData		= function()
					{
						document.location = target;
					}
					sumbitFields(process,haveData,noData);
				}
			});
		}
	});

	$("input").keypress(function(e){
		if(e.which==13){
			$("#BtnCreate").click();
		}
	});
});

$(function(){
	$("#create").click(function(){
		if(validate.validateFields('')){
			var process		= 'process.php';
	 		var target		= 'list.php?msg='+ $("#action").val();
	 		var haveData	= function(returningData)
	 		{
	 			$("input,select").blur();
				notifyError(returningData);
	 		}
	 		var noData		= function()
	 		{
	 			document.location = target;
	 		}
			sumbitFields(process,haveData,noData);
		}
	});
});
