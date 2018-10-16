/****************************************\
|                  ALERTS                |
\****************************************/
$(document).ready(function(){
	//$("#prueba").keydown();
	// $("#prueba").onfocus(function(){$(this).change(); alert('entra');});
	if(get['msg']=='insert')
		notifySuccess('La cotizaci&oacute;n de <b>'+get['element']+'</b> ha sido creada correctamente.');
	if(get['msg']=='update')
	{
		var popuptext = 'La cotizaci&oacute;n de <b>'+get['element']+'</b> ha sido modificada correctamente'
		if(get['emailsent'])
			popuptext = popuptext + ' y un email fue enviado a <b>'+get['emailsent']+'</b> con la cotizaci&oacute;n.';
		notifySuccess(popuptext);
	}
	if(get['error']=="status")
		notifyError('La cotizaci&oacute;n no puede ser editada ya que no se encuentra en estado activo.');
	if(get['error']=="user")
		notifyError('La cotizaci&oacute;n que desea editar no existe.');
});

/****************************************\
|             CREATE / EDIT              |
\****************************************/
$(function(){
	var role = 'Quotation'
	var msg = $("#action").val();
	var params = '';
	if(get['customer'])
		params += '&customer='+get['customer'];
	if(get['provider'])
		params += '&provider='+get['provider'];
	if(get['international'])
		params += '&international='+get['international'];
	$("#BtnCreate").click(function(){
		var element = $('#company option:selected').html();
		var target	= 'list.php?msg='+msg+params+'&element='+element;
		askAndSubmit(target,role,'¿Desea crear la cotizaci&oacute;n de <b>'+element+'</b>?','','QuotationForm');
	});
	// $("#BtnCreateNext").click(function(){
	// 	var element = $('#company option:selected').html();
	// 	var target		= 'new.php?element='+element+'&msg='+msg+params;
	// 	askAndSubmit(target,role,'¿Desea crear la cotizaci&oacute;n de <b>'+element+'</b>?','','QuotationForm');
	// });
	$("#BtnEdit").click(function(){
		var element = $('#company option:selected').html();
		var target		= 'list.php?msg='+msg+params+'&element='+element;
		askAndSubmit(target,role,'¿Desea modificar la cotizaci&oacute;n de <b>'+element+'</b>?','','QuotationForm');
	});

	$("#SaveAndSend").click(function(){
		if($("#action").val()=='insert')
			var action = 'crear';
		else
			var action = 'editar';
		var element = $('#company option:selected').html();
		var target		= 'list.php?msg='+msg+params+'&emailsent='+$('#receiver').val()+'&element='+element;
		askAndSubmit(target,role,'¿Desea '+action+' la cotizaci&oacute;n de <b>'+element+'</b> y enviarla por email al destinatario <b>'+$("#receiver").val()+'</b>?','','EmailWindowForm');
	});


});

/****************************************\
|         QUOTATION FUNCTIONS            |
\****************************************/
$(document).ready(function(){
	addItem();

	calculateRowPrice();

	changeDates();
	countItems();
	calculateTotalQuotationPrice();
	calculateTotalQuotationQuantity();
	deleteItem();
	setDatePicker();
	priceImputMask(1);
	updateDeliveryDateFromDays();
	updateAllDeliveryDates();
	showHistoryWindow();
	showHistoryButtons();
	checkHistoryButtons();
	updateExpireDate();
	updateItemExpireDate();
	getProductInfo();
	toggleItemFields();

	$( '#real_date' ).change();
});


/****************************************\
|            SET DATEPICKER              |
\****************************************/
function setDatePicker()
{
	if($(".delivery_date").length>0)
	{
		$.fn.datepicker.dates['es'] = {
		    days: ["Domingo", "Lunes", "Martes", "Miércoles", "Juves", "Viernes", "Sábado"],
		    daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
		    daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
		    months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
		    monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
		    today: "Hoy",
		    clear: "Borrar",
		    format: "dd/mm/yyyy",
		    titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
		    weekStart: 1
		};
		setADatePicker();
	}
}

function setADatePicker()
{
	$(".delivery_date").datepicker({
		autoclose:true,
		todayHighlight: true,
		language: 'es'
	});
}

function updateExpireDate()
{
	$("#expire_days").change(function(){
		if(parseInt($(this).val())>-1)
		{
			var creation_date = $("#real_date").val().split( '/' ).reverse().join( '-' );
			var ExpireDate = AddDaysToDate($(this).val(),creation_date);
			$("#expire_date").val(ExpireDate);
		}
	});
}

/****************************************\
|            PRICE INPUT MASK            |
\****************************************/
function priceImputMask(id)
{

	$("#price_"+id).change(function(){
		var decimal = $(this).val().split(".");
		if(decimal[1]=="__")
		{
			$("#price_"+id).val(decimal[0]+".00");
		}
	});
}

/****************************************\
|            HISTORY BUTTON              |
\****************************************/
function showHistoryButtons()
{
	$("#company,.itemSelect").change(function(){
		checkHistoryButtons();
	});
	// $("#company").change(function(){

	// });
}

function checkHistoryButtons()
{
	$(".itemSelect").each(function(){
		var itemid = $(this).attr("item");
		if($("#item_"+itemid).val()>0)
		{
			$("#HistoryItem"+itemid).removeClass("Hidden");
			if(get['customer']=='Y')
			{
				if($("#company").val())
					$("#QuotationsBox").removeClass("Hidden");
				else
					$("#QuotationsBox").addClass("Hidden");
			}
		}else{
			$("#HistoryItem"+itemid).addClass("Hidden");
		}
	})

}

/****************************************\
|          UPDATE EXPIRE DATE		         |
\****************************************/

function updateItemExpireDate()
{

		$( '#real_date' ).change( function( event )
		{

				event.stopPropagation();

				var realDate = $( this ).val();

				$( '.ItemRow' ).each( function()
				{

						var item = $( this ).attr( 'item' );

						$( '#date_' + item ).val( realDate );

						$( '#day_' + item ).change();

						$( '#expire_days' ).change();

				});

		});

}

/****************************************\
|            QUOTATION ITEMS             |
\****************************************/
function addItem()
{
	$("#add_quotation_item").click(function(){
		var id		= parseInt($("#items").val())+1;
		var string	= 'item='+ id +'&action=additem&object=Purchase';
		$.ajax({
	        type: "POST",
	        url: process_url,
	        data: string,
	        cache: false,
	        success: function(data){
	            if(data)
	            {
	                $(".ItemRow:last-child").after(data);
	                $("#items").val(id);
	                setItemChosen(id);
	                deleteItem();
	                setADatePicker();
	                validateDivChange();
	                countItems();
	                calculateRowPrice();
	                DecimalInputMask();
	                updateRowBackground();
	                // recalculateItemPrice();
	                updateDeliveryDateFromDays();
	                showHistoryWindow();
	                showHistoryButtons();
	                checkHistoryButtons();
									toggleItemFields();
									$( '#real_date' ).change();
	            }else{
	                console.log('Sin información devuelta. Item='+id);
	            }
	        }
	    });
	});
}

function toggleItemFields()
{

		$( ".itemSelect" ).change(function()
		{

				var id = $( this ).attr( "id" ).split( "_" )[1];

				var value = $( this ).val();

				$( ".ItemField" + id ).each( function()
				{

						var field = $( this );

						if( field.attr( "id" ) != "date_" + id && field.attr( "id" ) != "TextAutoCompleteitem_" + id )
						{

								if( value )
								{

										field.attr( "disabled", false );

								}else{

										field.attr( "disabled", true );

								}

						}

				});

		});

}



function editItem()
{
	$(".EditItem").on("click",function(){
		var id = $(this).attr("item");
		$("#SaveItem"+id+",.ItemField"+id).removeClass('Hidden');
		$("#EditItem"+id+",.ItemText"+id).addClass('Hidden');
		$("#item_"+id).next().removeClass('Hidden');
	});
}

function deleteItem()
{
	$(".DeleteItem").click(function(){
		var id = $(this).attr("item");
		$("#item_row_"+id).remove();
		countItems();
		calculateTotalQuotationPrice();
		calculateTotalQuotationQuantity();
		updateRowBackground();
	});
}

function updateDeliveryDateFromDays()
{
	$(".DayPicker").change(function(){
		var id = $(this).attr("id").split("_");
		if(parseInt($(this).val())>-1 && $("#real_date").val())
		{
			var creation_date = $("#real_date").val().split( '/' ).reverse().join( '-' );
			var DeliveryDate = AddDaysToDate($(this).val(),creation_date);
			$("#date_"+id[1]).val(DeliveryDate);
		}
	});
}

function updateAllDeliveryDates()
{
	$(".DayPicker").each(function(){
		$(this).change();
	});
}

function updateRowBackground()
{
	var bgClass = "bg-gray";
	$(".ItemRow").each(function(){
		$(this).removeClass("bg-gray");
		$(this).removeClass("bg-gray-active");
		$(this).addClass(bgClass);
		if(bgClass == "bg-gray")
			bgClass = "bg-gray-active";
		else
			bgClass = "bg-gray";
	});
}

function countItems()
{
	$("#TotalItems").html($(".ItemRow").length);
}

function calculateRowPrice()
{
	$(".calcable").change(function(){
		var element = $(this).attr("id").split("_");
		var id = element[1];
		var price = parseFloat($("#price_"+id).val());
		var quantity = parseInt($("#quantity_"+id).val())
		if(price>0 && quantity>0)
			var total = price*quantity;
		else
			var total = 0.00;
		$("#item_number_"+id).attr("total",total);
		$("#item_number_"+id).html("$ "+total.formatMoney(2));

		calculateTotalQuotationPrice();
		calculateTotalQuotationQuantity();
	});
}

function calculateTotalQuotationQuantity()
{
	var total = 0;
	$(".QuantityItem").each(function(){
		var val = parseInt($(this).val());
		if(val>0)
			total = total + val;
	});

	$("#TotalQuantity").html(total);
}

function calculateTotalQuotationPrice()
{
	var total = 0.00;
	$(".item_number").each(function(){
		var val = parseFloat($(this).attr("total"));
		if(val>0)
			total = total + val;
	});
	$("#total_price").val(total);
	$("#TotalPrice").html("$ "+total.formatMoney(2));
}

function changeDates()
{
	$("#ChangeDays").click(function(){
		var days = $("#change_day").val();
		alertify.confirm(utf8_decode('¿Desea establecer '+days+' d&iacute;as de entrega para todos los art&iacute;culos ?'), function(e){
		if(e)
		{
			$(".DayPicker").each(function(){
				if(!$(this).hasClass('Restricted'))
					$(this).val(days);
					$(this).change();
			});

			$(".OrderDay").each(function(){
				if(!$(this).hasClass('Restricted'))
					$(this).html(days);
			});

			$(".OrderDate").each(function(){
				if(!$(this).hasClass('Restricted'))
				{
					var id = $(this).attr("id").split("Date");
					$(this).html($("#date_"+id[1]).val());
				}
			});
		}
		});
	});
}


function showHistoryWindow()
{
	$(".HistoryItem").click(function(){
		var id = $(this).attr("item");
		$("#window_traceability").removeClass("Hidden");
		$("#product").val($("#item_"+id).val());
		$("#item").val(id);
		FillTraceabilityWindow();
	})
}

/****************************************\
|          LOAD BRANCH SELECT            |
\****************************************/
$(function(){
	$("#company").change(function(){
		if($(this).val())
		{
			fillBranch();
		}
	});
});

function fillBranch()
{
	var company = $('#company').val();
	var process = process_url;
	var string  = 'id='+ company +'&action=fillbranches&object=CompanyBranch';
    var data;
    $.ajax({
        type: "POST",
        url: process,
        data: string,
        cache: false,
        success: function(data){
            if(data)
            {
              $('#branch-wrapper').html(data);
							agentFunctions();
            }else{
              $('#branch-wrapper').html('<select id="branch" class="form-control chosenSelect" disabled="disabled" ><option value="0">Sin Sucusales</option></select>');
            }
            chosenSelect();
        }
    });
}


/****************************************\
|    CALCULATE ITEM PRICE BY CUSTOMER    |
\****************************************/
$(document).ready(function(){
	if($(".itemSelect").length>0 && get['customer']=='Y')
	{
		$(".itemSelect").each(function(){
			var item = $(this).attr('item');
			setItemChosen(item);
		});
	}
});

function setItemChosen(id)
{

		SetAutoComplete( '#TextAutoCompleteitem_' + id );

		$( '#TextAutoCompleteitem_' + id ).on( 'change', function()
		{

				$( '#sizex_' + id ).val( '' );

				$( '#sizey_' + id ).val( '' );

				$( '#sizez_' + id ).val( '' );

				$( '#price_' + id ).val( '' );

				var product = $( '#item_' + id ).val();

				if( $( '#TextAutoCompleteitem_' + id ).val() )
				{

						getProductInfo( product, id );

				}else{

						$( '#item_' + id ).val( '' );

				}

		});

		$( '#TextAutoCompleteitem_' + id ).on( 'keydown', function(e)
		{

				var keyCode = e.keyCode || e.which;

				if( keyCode == 9 )
				{

						e.preventDefault();

						$( '#TextAutoCompleteitem_' + id ).change();

						$( '#sizex_' + id ).focus();

				}

		});

}

function getProductInfo( product, id )
{

		if( !isNaN( product ) && product > 0 )
		{

				// console.log( product );

				var string = "product=" + product + "&action=Getproductdata&object=Product";

				$.ajax(
				{

						type: "POST",

						url: process_url,

						data: string,

						success: function( response )
						{

								var data = JSON.parse( response );

								if( data.width > 0 )
								{

										$( '#sizex_' + id ).val( data.width );

								}

								if( data.height > 0 )
								{

										$( '#sizey_' + id ).val( data.height );

								}

								if( data.depth > 0 )
								{

										$( '#sizez_' + id ).val( data.depth );

								}

								if( data.price > 0 )
								{

										$( '#price_' + id ).val( data.price );

										$( '#price_' + id ).change();

								}

						},

						error: function ( response )
						{

								notifyWarning( 'Se ha producido un error al intentar obtener información del producto.' );

								console.log( response );

						}

				});

		}else{

				console.log( product );

		}

}

/****************************************\
|             LIST FUNCTIONS             |
\****************************************/
$(function(){
	$(".storeElement").click(function(){
		var ID = $(this).attr('id').split("_");
		ID = ID[1];
		var process = process_url+'';
		var string	= 'id='+ ID +'&action=store&object=Quotation';//&status='+status;
		$.ajax({
	        type: "POST",
	        url: process,
	        data: string,
	        cache: false,
	        success: function(data){
	            if(data)
	            {
	              notifyError('Se produjo un error al archivar la cotización');
	                console.log('Error al intentar cambiar de estado. Item='+ID+'. Error: '+data);
	            }else{
	                $(".searchButton").click();
	                notifySuccess('La cotización se archiv&oacute; correctamente');
	            }
	        }
	    });
	});
});
