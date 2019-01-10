/****************************************\
|                  ALERTS                |
\****************************************/
$(document).ready(function(){
	//$("#prueba").keydown();
	// $("#prueba").onfocus(function(){$(this).change(); alert('entra');});
	if(get['msg']=='insert')
		notifySuccess('La orden de compra de <b>'+get['element']+'</b> ha sido creada correctamente.');
	if(get['msg']=='update')
	{
		var popuptext = 'La orden de compra de <b>'+get['element']+'</b> ha sido modificada correctamente'
		if(get['emailsent'])
			popuptext = popuptext + ' y un email fue enviado a <b>'+get['emailsent']+'</b> con la orden de compra.';
		notifySuccess(popuptext);
	}
	if(get['error']=="status")
		notifyError('La orden de compra no puede ser editada ya que no se encuentra en estado activo.');
	if(get['error']=="user")
		notifyError('La orden de compra que desea editar no existe.');

		if( $( '#status' ).val() == 'P' )
		{

				displayDaysAndTime();
				changeDaysAndTime();

		}

});

/****************************************\
|             CREATE / EDIT              |
\****************************************/
$(function(){
	var role = 'Purchase'
	var msg = $("#action").val();
	var params = '';
	if(get['customer'])
		params += '&customer=Y';
	// if(get['provider'])
	// 	params += '&provider='+get['provider'];
	// if(get['international'])
	// 	params += '&international='+get['international'];
	$("#BtnCreate").click(function(){
		var element = $('#company option:selected').html();
		var target	= 'list.php?status=P&msg='+msg+params+'&element='+element;
		askAndSubmit(target,role,'¿Desea crear la orden de compra de <b>'+element+'</b>?','','PurchaseForm');
	});
	// $("#BtnCreateNext").click(function(){
	// 	var element = $('#company option:selected').html();
	// 	var target		= 'new.php?element='+element+'&msg='+msg+params;
	// 	askAndSubmit(target,role,'¿Desea crear la orden de compra de <b>'+element+'</b>?','','PurchaseForm');
	// });
	$("#BtnEdit").click(function(){
		var element = $('#company option:selected').html();
		var target		= 'list.php?status=A&msg='+msg+params+'&element='+element;
		askAndSubmit(target,role,'¿Desea modificar la orden de compra de <b>'+element+'</b>?','','PurchaseForm');
	});

});

/****************************************\
|         PURCHASE FUNCTIONS            |
\****************************************/
$( document ).ready( function()
{

		addItem();

		calculateRowPrice();

		changeDates();

		countItems();

		calculateTotalPurchasePrice();

		calculateTotalPurchaseQuantity();

		deleteItem();

		setDatePicker();

		DecimalInputMask();

		updateDeliveryDateFromDays();

		updateAllDeliveryDates();

		showHistoryWindow();

		showHistoryButtons();

		checkHistoryButtons();

		updateExpireDate();

		DayCheck();

		branchChange();

		displayDaysAndTime();

		toggleItemFields();

		getProductInfo();

		updateItemExpireDate();

		// fillProductSizes();

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
|            DAYS AND HOURS              |
\****************************************/
function DayCheck()
{
	$('.iCheckbox').on('ifChecked', function(){
		var id = $(this).attr('id');
		$("#from_"+id).attr("validateEmpty","Seleccione un horario inicial.");
		$("#from_"+id).attr("disabled",false);
		$("#to_"+id).attr("validateEmpty","Seleccione un horario final.");
		$("#to_"+id).attr("disabled",false);
	});

	$('.iCheckbox').on('ifUnchecked', function(){
		var id = $(this).attr('id');

		$("#from_"+id).removeAttr("validateEmpty");
		$("#from_"+id).attr("disabled",true);
		$("#from_"+id).val('');
		$("#from_"+id).change();
		$("#to_"+id).removeAttr("validateEmpty");
		$("#to_"+id).attr("disabled",true);
		$("#to_"+id).val('');
		$("#to_"+id).change();
	});

	$(".clockPicker").focusout(function()
	{
		if($(this).val())
		{
			$(this).val($(this).val().replace('_','0'));
			var time = $(this).val().split(':');

			if(!time[1])
			{
				$(this).val(time[0]+':00');
			}else{
				if(time[1]=='__')
				{
					$(this).val(time[0]+':00');
				}else{
					$(this).val($(this).val().replace('_','0'));
				}
			}

			if(time[0]>23 || time[1]>59)
			{
				$(this).val('');
			}

			var id = $(this).attr('id').split('_');
			var from = $("#from_"+id[1]);
			var to = $("#to_"+id[1]);

			if(from.val() && to.val())
			{
				var time1 = from.val().replace(':','');
				var time2 = to.val().replace(':','');

				if(parseInt(time1)>parseInt(time2))
				{
					var fromval = from.val();
					from.val(to.val());
					to.val(fromval);
				}
			}

			if( id[1] == 'monday' )
			{

				$(".clockPicker").each(function(){
					// console.log($(this).attr('id'));
					if(!$(this).val() && $(this).attr('disabled')!="disabled" )
					{
						var otherid = $(this).attr('id').split('_');
						if(otherid[0]=='to')
						{
							$(this).val(to.val());
						}else{
							$(this).val(from.val());
						}
					}
				});
			}
		}
	});
}

function branchChange()
{

		$( "#branch" ).change( function()
		{
				displayDaysAndTime();
				changeDaysAndTime();

		});

}

function displayDaysAndTime()
{
		if( $( "#branch" ).val() > 0 )
		{

				$( '#DeliveryDateTime' ).removeClass( 'Hidden' );

		} else {

				$( '#DeliveryDateTime' ).addClass( 'Hidden' );

		}

}

function resetDayAndTimeInputs()
{

		$( '.iCheckbox' ).iCheck( 'uncheck' );
		$( '.clockPicker' ).val( '' );

}


 /****************************************\
| CHANGE DELIVERY TIME WHEN BRANCH CHANGE |
\****************************************/
function changeDaysAndTime()
{

		var branch = $( "#branch" ).val();

		if( branch )
		{

				resetDayAndTimeInputs();

				var string	= 'branch=' + branch + '&action=getbranchinfo&object=CompanyBranch';

				$.ajax(
				{

						type: "POST",

						dataType: "json",

						url: process_url,

						data: string,

						cache: false,

						success: function( data )
						{

								if( data.monday_from )
								{

										$( '#monday' ).iCheck( 'check' );
										$( '#from_monday' ).val( data.monday_from );
										$( '#to_monday' ).val( data.monday_to );

								}

								if( data.tuesday_from )
								{

										$( '#tuesday' ).iCheck( 'check' );
										$( '#from_tuesday' ).val( data.tuesday_from );
										$( '#to_tuesday' ).val( data.tuesday_to );

								}

								if( data.wensday_from )
								{

										$( '#wensday' ).iCheck( 'check' );
										$( '#from_wensday' ).val( data.wensday_from );
										$( '#to_wensday' ).val( data.wensday_to );

								}

								if( data.thursday_from )
								{

										$( '#thursday' ).iCheck( 'check' );
										$( '#from_thursday' ).val( data.thursday_from );
										$( '#to_thursday' ).val( data.thursday_to );

								}

								if( data.friday_from )
								{

										$( '#friday' ).iCheck( 'check' );
										$( '#from_friday' ).val( data.friday_from );
										$( '#to_friday' ).val( data.friday_to );

								}

								if( data.saturday_from )
								{

										$( '#saturday' ).iCheck( 'check' );
										$( '#from_saturday' ).val( data.saturday_from );
										$( '#to_saturday' ).val( data.saturday_to );

								}

								if( data.sunday_from )
								{

										$( '#sunday' ).iCheck( 'check' );
										$( '#from_sunday' ).val( data.sunday_from );
										$( '#to_sunday' ).val( data.sunday_to );

								}

						},

						error: function( data )
						{

								notifyError( 'Ocurrió un error al intentar completar los horarios de entrega de la sucrusal.' );

								console.log( data );

						}

				});

		}

}


/****************************************\
|            HISTORY BUTTON              |
\****************************************/
function showHistoryButtons()
{

		$( "#company,.itemSelect" ).change(function()
		{

				checkHistoryButtons();

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
					$("#PurchasesBox").removeClass("Hidden");
				else
					$("#PurchasesBox").addClass("Hidden");
			}
		}else{
			$("#HistoryItem"+itemid).addClass("Hidden");
		}
	})

}

// function fillProductSizes()
// {
//
// 		$( ".itemSelect" ).change( function()
// 		{
//
// 				console.log( 'entra en change' );
//
// 				if( $( this ).val() && !isNaN( $( this ).val() ) )
// 				{
// 						var id = $( this ).attr( "item" );
//
// 						var product = $( this ).val()
//
// 						var string = "product=" + product + "&action=Getproductdata&object=Product";
//
// 						$.ajax(
// 						{
//
// 								type: "POST",
//
// 								url: process_url,
//
// 								data: string,
//
// 								cache: false,
//
// 								success: function( response )
// 								{
//
// 										console.log( 'Success' );
// 										console.log( response );
//
// 								},
// 								error: function( response )
// 								{
//
// 										console.log( 'Error' );
// 										console.log( response );
//
// 								}
//
// 						});
//
// 				}
//
// 		});
//
// }

/****************************************\
|            PURCHASE ITEMS             |
\****************************************/
function addItem()
{
	$("#add_purchase_item").click(function(){
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

function deleteItem()
{
	$(".DeleteItem").click(function(){
		var id = $(this).attr("item");
		$("#item_row_"+id).remove();
		countItems();
		calculateTotalPurchasePrice();
		calculateTotalPurchaseQuantity();
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
		var price = parseFloat( $("#price_"+id).val().replace( '$', '' ) );
		var quantity = parseInt($("#quantity_"+id).val())
		if(price>0 && quantity>0)
			var total = price*quantity;
		else
			var total = 0.00;
		$("#item_number_"+id).attr("total",total);
		$("#item_number_"+id).html("$ "+total.formatMoney(2));

		calculateTotalPurchasePrice();
		calculateTotalPurchaseQuantity();
	});
}

function calculateTotalPurchaseQuantity()
{
	var total = 0;
	$(".QuantityItem").each(function(){
		var val = parseInt($(this).val());
		if(val>0)
			total = total + val;
	});

	$("#TotalQuantity").html(total);
}

function calculateTotalPurchasePrice()
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

		$( "#ChangeDays" ).click( function()
		{

				var days = $( "#change_day" ).val();

				if( days && !isNaN( days ) )
				{

						alertify.confirm( utf8_decode( '¿Desea establecer ' + days + ' d&iacute;as de entrega para todos los art&iacute;culos ?' ), function( e )
						{

								if( e )
								{

										$( ".DayPicker" ).each( function()
										{

												if( !$( this ).hasClass( 'Restricted' ) )
												{

														$( this ).val( days );

												}

												$( this ).change();

										});

										// $( ".OrderDay" ).each( function()
										// {
										//
										// 		if( !$( this ).hasClass( 'Restricted' ) )
										// 		{
										// 				$( this ).html( days );
										//
										// 		}
										//
										// });

									// $(".OrderDate").each(function(){
									// 	if(!$(this).hasClass('Restricted'))
									// 	{
									// 		var id = $(this).attr("id").split("Date");
									// 		$(this).html($("#date_"+id[1]).val());
									// 	}
									// });
								}
						});

				}

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
						// changeDaysAndTime();
						branchChange();
						$( "#branch" ).change();
        }
    });
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


/****************************************\
|    				GET PRODUCT INFO					   |
\****************************************/

function setItemChosen( id )
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

// function getProductsPrices(values,ids)
// {
// 	var string	= 'items='+values+'&action=Getitemprices&object=Purchase';
// 	if(values.length>0 && get['customer']=='Y')
// 	{
// 		if(ids)
// 		{
// 			ids = ids +'';
// 			$.ajax({
// 		        type: "POST",
// 		        url: process_url,
// 		        data: string,
// 		        success: function(data){
// 		            if(data)
// 		            {
// 		            	console.log(data);
// 		            	var prices = data.split(",");
// 		            	var items = ids.split(",");
// 		            	var decimal;
// 		            	prices.forEach(function(price,index){
// 		            		decimal = price.substr(price.indexOf("."));
// 			            	if(decimal.length==1)
// 			            	{
// 			            		price = price + ".00";
// 			            	}
// 			            	if(decimal.length==2)
// 			            	{
// 			            		price = price + "0";
// 			            	}
// 			            	$("#price_"+items[index]).val(price);
// 			            	$("#Price"+items[index]).html("$ "+price);
// 		            	});
// 		            }else{
// 		            	notifyError('Hubo un error al calcular el precio del producto');
// 		                console.log('Sin información devuelta. Item='+id);
// 		            }
// 		        }
// 		    });
// 		}
// 	}
// }

/****************************************\
|             LIST FUNCTIONS             |
\****************************************/
function AdditionalSearchFunctions()
{

		storeElement();

		deliverElement();

		rollbackElement();

}

function storeElement()
{

	$( '.storeElement' ).click( function()
	{

			var element = $( this );

			alertify.confirm( utf8_decode( '¿Desea pagar y dar por finalizada la orden de compra de <b>' + element.attr( 'company' ) + '</b>?<br>Esta acci&oacute;n no se puede deshacer.' ), function( e )
			{

					if( e )
					{

							var ID = element.attr('id').split("_");

							ID = ID[1];

							var process = process_url;

							var string	= 'id='+ ID +'&action=store&object=Purchase';//&status='+status;

							$.ajax(
							{

									type: 'POST',

									url: process,

									data: string,

									cache: false,

									success: function( data )
									{

											if( data )
											{

													notifyError( 'Se produjo un error al archivar la orden de compra' );

													console.log( 'Error al intentar cambiar de estado. Item=' + ID + '. Error: ' + data );

											}else{

													$( '.searchButton' ).click();

													notifySuccess( 'La orden se archiv&oacute; correctamente' );

											}

									}

							});

					}

			});

	});

}

function deliverElement()
{

		$( '.deliveryElement' ).click( function()
		{

				var ID = $(this).attr('id').split("_");

				ID = ID[1];

				var process = process_url;

				var string	= 'id='+ ID +'&action=deliver&object=Purchase';//&status='+status;

				$.ajax(
				{

						type: 'POST',

						url: process,

						data: string,

						cache: false,

						success: function( data )
						{

								if( data )
								{

										notifyError( 'Se produjo un error al pasar a reparto la orden de compra' );

										console.log( 'Error al intentar cambiar de estado. Item=' + ID + '. Error: ' + data );

								}else{

										notifySuccess( 'Ahora la orden se encuentra en reparto' );

										$( '.searchButton' ).click();

								}

						}

				});

		});

}

function rollbackElement()
{

		$( '.rollbackElement' ).click( function()
		{

				var ID = $(this).attr('id').split("_");

				ID = ID[1];

				var process = process_url;

				var string	= 'id='+ ID +'&action=rollback&object=Purchase';//&status='+status;

				$.ajax(
				{

						type: 'POST',

						url: process,

						data: string,

						cache: false,

						success: function( data )
						{

								if( data )
								{

										notifyError( 'Se produjo un error al pasar a pendiente la orden de compra' );

										console.log( 'Error al intentar cambiar de estado. Item=' + ID + '. Error: ' + data );

								}else{

										notifySuccess( 'Ahora la orden se encuentra pendiente' );

										$( '.searchButton' ).click();

								}

						}

				});

		});

}
//
// $( function()
// {
//
// 		storeElement();
//
// 		deliverElement();
//
// 		rollbackElement();
//
// });
