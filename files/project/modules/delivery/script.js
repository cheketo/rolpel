 /****************************************\
|                   ALERTS                |
\****************************************/
$( document ).ready( function()
{

		if( get[ 'msg' ] == 'insert' )
		{

				notifySuccess( 'El reparto del  <b>' + get[ 'element' ] + '</b> ha sido creado correctamente.' );

		}

		if( get[ 'msg' ] == 'update' )
		{

				notifySuccess( 'El reparto del <b>' + get[ 'element' ] + '</b> ha sido modificado correctamente.' );

		}

		if( get[ 'msg' ] == 'associate' )
		{

				notifySuccess( 'Las ordenes de compra fueron asignadas al reparto de <b>' + get[ 'element' ] + '</b>.' );

		}

		if( get[ 'error' ] == 'status' )
		{

			notifyError( 'El reparto no puede ser editado ya que no se encuentra en un estado habilitado.' );

		}

		if( get[ 'error' ] == 'user' )
		{

			notifyError( 'El reparto que desea editar no existe.' );

		}

});

 /****************************************\
|              CREATE / EDIT              |
\****************************************/
$( function()
{

		var role = 'Delivery'

		var msg = $( "#action" ).val();

		$( '#BtnCreate' ).click( function()
		{

				var element = $( '#truck option:selected' ).html();

				var target	= 'list.php?status=P&msg=' + msg + '&element=' + element;

				askAndSubmit( target, role, '¿Desea crear el reparto del cami&oacute;n <b>' + element + '</b>?', '', 'DeliveryForm' );

		});

		$( '#BtnEdit' ).click( function()
		{

				var element = $( '#truck option:selected').html();

				var target	= 'list.php?status=P&msg=' + msg + '&element=' + element;

				askAndSubmit( target, role, '¿Desea modificar el reparto del cami&oacute;n <b>' + element + '</b>?', '', 'DeliveryForm' );

		});

		$( '#BtnAssociate' ).click( function()
		{

				var element = $( '#element' ).val();

				var target	= 'list.php?status=P&msg=' + msg + '&element=' + element;

				if( validate.validateFields( '*' ) )
				{

						askAndSubmit( target, role, '¿Desea crear el reparto del cami&oacute;n <b>' + element + '</b>?' );

				}else{

						notifyWarning( 'No se puede guardar hasta que corrija todos los errores de los campos.' );

				}

		});

		$( '#BtnDeliver' ).click( function()
		{

				var element = $( '#element' ).val();

				var target	= 'list.php?status=A&msg=' + msg + '&element=' + element;

				if( validate.validateFields( '*' ) )
				{

						askAndSubmit( target, role, '¿Desea terminar el reparto del cami&oacute;n <b>' + element + '</b>? No se podrá volver a editar una vez guardado.' );

				}else{

						notifyWarning( 'No se puede guardar hasta que corrija todos los errores de los campos.' );

				}

		});

});

 /****************************************\
|                  ORDERS                 |
\****************************************/
$( document ).ready( function()
{

		QuantityFieldChanged();

		CalculateDeliveryItems();

		addPurchase();

		removePurchase();

		showDeliveryOrder();

		changeDeliveryItems();

});

function AdditionalSearchFunctions()
{

		startDelivery();

		rollBackDelivery();

}

 /****************************************\
|          SHOW DELIVERY ORDER            |
\****************************************/

function showDeliveryOrder()
{

		$( '.PurchaseList' ).click( function()
		{

				var purchase = $( this ).attr( 'purchase' );

				$( '.PurchaseItemsWrapper' ).addClass( 'Hidden' );

				$( '.PurchaseItemsWrapper[id="PurchaseItemsWrapper' + purchase + '"]' ).removeClass( 'Hidden' );

		});

}

/****************************************\
|         CHANGE DELIVERY ITEMS          |
\****************************************/

function changeDeliveryItems()
{

		$( '.PurchaseItem' ).change( function()
		{

				var item = $( this ).attr( 'item' );

				var purchase = $( this ).attr( 'purchase' );

				var product = $( this ).attr( 'product' );

				var productName = $( '#item_product_name_' + item ).html();

				var quantity = parseInt( $( this ).val() );

				var originalQuantity = parseInt( $( '#item_original_quantity_' + item ).val() );

				if( originalQuantity - quantity != 0 && quantity < originalQuantity )
				{

						if( $( '#item_udelivered_' + item ).length > 0 )
						{

										$( '#item_udelivered_' + item ).html( originalQuantity - quantity );

						}else{

							 $( '#UndeliveredItems' + purchase ).append( '<div class="txC pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);">No se entregaron <span id="item_udelivered_' + item + '" >' + ( originalQuantity - quantity ) + '</span> unidades de <strong>' + productName + '</strong></div>' );

						}

				}else{

						$( '#item_udelivered_' + item ).parent().remove();

				}

				var total_delivered = 0;

				var total_undelivered = 0;

				$( '.PurchaseItem[product="' + product + '"]' ).each( function()
				{

						var item = $( this ).attr( 'item' );

						var quantity = parseInt( $( this ).val() );

						var originalQuantity = parseInt( $( '#item_original_quantity_' + item ).val() );

						if( quantity <= originalQuantity )
						{

								total_delivered = total_delivered + quantity;

								total_undelivered = total_undelivered + ( originalQuantity - quantity );

						}

				});

				if( total_undelivered > 0 )
				{

						$( '#item_total_undelivered_' + product ).parent().removeClass( 'Hidden' );

						$( '#item_total_undelivered_' + product ).html( total_undelivered );

				}else{

						$( '#item_total_undelivered_' + product ).parent().addClass( 'Hidden' );

						$( '#item_total_undelivered_' + product ).html( '0' );

				}

				if( total_delivered > 0 )
				{

						$( '#item_total_' + product ).parent().removeClass( 'Hidden' );

						$( '#item_total_' + product ).html( total_delivered );

				}else{

						$( '#item_total_' + product ).parent().addClass( 'Hidden' );

						$( '#item_total_' + product ).html( '0' );

				}

				console.log( total_undelivered );

	 });

}

 /****************************************\
|             START DELIVERY              |
\****************************************/

function startDelivery()
{

	$( '.deliveryOrder' ).click( function()
	{

			var element = $( this );

			var day = element.attr( 'date' );

			var truck = element.attr( 'truck' );

			alertify.confirm( '¿Desea empezar el reparto del cami&oacute;n <b>' + truck + '</b> para el d&iacute;a <b>' + day + '</b>?', function( e )
			{

					if( e )
					{

							var ID = element.attr('id').split("_");

							ID = ID[1];

							var process = process_url;

							var string	= 'id='+ ID +'&action=startdelivery&object=Delivery';//&status='+status;

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

													notifyError( 'Se produjo un error al empezar el reparto' );

													console.log( 'Error al intentar cambiar de estado. Delivery=' + ID + '. Error: ' + data );

											}else{

													$( '.searchButton' ).click();

													notifySuccess( 'El reparto del camión ' + truck + ' para el día ' + day + ' ha comenzado correctamente' );

											}

									}

							});

					}

			});

	});

}

 /****************************************\
|           ROLL BACK DELIVERY            |
\****************************************/

function rollBackDelivery()
{

 $( '.rollBackDelivery' ).click( function()
 {

		 var element = $( this );

		 var day = element.attr( 'date' );

		 var truck = element.attr( 'truck' );

		 alertify.confirm( '¿Desea regresar el reparto del cami&oacute;n <b>' + truck + '</b> para el d&iacute;a <b>' + day + '</b> a estado pendiente?', function( e )
		 {

				 if( e )
				 {

						 var ID = element.attr('id').split("_");

						 ID = ID[1];

						 var process = process_url;

						 var string	= 'id='+ ID +'&action=rollbackdelivery&object=Delivery';//&status='+status;

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

												 notifyError( 'Se produjo un error al pasar el reparto a pendiente' );

												 console.log( 'Error al intentar cambiar de estado. Delivery=' + ID + '. Error: ' + data );

										 }else{

												 $( '.searchButton' ).click();

												 notifySuccess( 'El reparto del camión ' + truck + ' para el día ' + day + ' ha regresado a estado pendiente' );

										 }

								 }

						 });

				 }

		 });

 });

}

function QuantityFieldChanged()
{

		$( '.ItemQuantity' ).on( 'change', function()
		{

			CalculateDeliveryItems();

			return false;

		});

}

function CalculateDeliveryItems()
{

		var items = new Array();

		$( '.ItemQuantity' ).each( function()
		{

				var element = $( this );

				var quantity = element.val();

				if( quantity > 0 )
				{

						var ids = element.attr( 'id' ).split( '_' );

						var purchaseID = ids[ 1 ];

						var itemID = ids[ 2 ];

						var product = element.attr( 'product' );

						var name = $( '#title_' + purchaseID + '_' + itemID ).html();

						if( items[ product ] )
						{

								items[ product ].quantity = parseInt( items[ product ].quantity ) + parseInt( quantity );

						}else{

								items[ product ] = { name: name ,quantity: parseInt( quantity ), product: product };

						}

				}

		});

		var html = '';

		items.forEach( function( item )
		{


			var name = '<div class="col-xs-8">' + item.name + '</div>';

			var quantity = '<div class="col-xs-4">' + item.quantity + '</div>';

			var row = '<div class="row">' + name + quantity + '</div>';

			html = html + row;

		});

		$( '#DeliveryItems' ).html( html );


}

function addPurchase()
{

		$( '.addPurchase' ).on( 'click', function( e )
		{

				e.stopPropagation();

				$( this ).addClass( 'Hidden' );

				var id = $( this ).attr( 'purchase' );

				var purchaseData = $( '#purchase_data' + id ).val().replace( /'/g, '"');

				purchaseData = JSON.parse( purchaseData	);

				var pIDs = $( '#selected_purchases' ).val().split( ',' );

				if(  $.inArray( id, pIDs ) == -1  )
				{

						pIDs.push( id );

						var itemsData = $( '#items_data' + id ).val().replace( /'/g, '"');

						itemsData = JSON.parse( itemsData );

						$( '#selected_purchases' ).val( pIDs.join( ',' ) );

						if( $( '.purchaseContainer' ).length > 0 )
						{

								//var position = parseInt( $( '#PurchaseList' ).children().last().attr( 'position' ) ) + 1;

								var position = $( '.purchaseContainer' ).length + 1;

						}else{

								var position = 1;

						}

						var orderSubTitle = '<span class="orderSubTitle">(' + purchaseData[ 'name' ] + ')</span>';

						var orderTitle = '<div class="orderTitle"><b><i class="fa fa-map-marker text-' + $( '#purchase_color' + id ).val() + '"></i> <span id="position' + id + '">' + position + '</span>. ' + purchaseData[ 'address' ] + '</b> ' + orderSubTitle + '</div>';

						var orderFields = '<div>';

						itemsData.forEach( function( item )
						{

								var itemProduct = '<input type="hidden" id="product_' + id + '_' + item.item_id + '" value="' + item.product_id + '">';

								var itemPosition = '<input type="hidden" id="position_' + id + '_' + item.item_id + '" value="' + position + '">';

								var itemName = '<div class="col-xs-6" id="title_' + id + '_' + item.item_id + '" class="ItemName">' + item.title + itemPosition + '</div>'

								var itemQuantity = '<div class="col-xs-6"><input type="text" product="' + item.product_id + '" id="quantity_' + id + '_' + item.item_id + '" class="form-control txC ItemQuantity" value="' + item.quantity_remain + '" validateEmpty="Ingrese una cantidad." validateOnlyNumbers="Ingrese n&uacute;meros &uacute;nicamente." validateMaxValue="' + item.quantity_remain + '///Ingrese una cantidad menor o igual a ' + item.quantity_remain + '" validateMinValue="0///Ingrese un n&uacute;mero entero positivo."></div>'

								var  itemHTML = '<div class="row" id="item_' + item.item_id + '">' + itemProduct + itemName + itemQuantity + '</div>';

								orderFields = orderFields + itemHTML;


						});

						orderFields = orderFields + '</div>';

						var orderExtraInfo = '';

            if(  purchaseData[ 'extra' ] )
            {

                orderExtraInfo = '<h5><i class="fa fa-user-secret"></i> Información para el cliente:<br><strong><span class="text-green">' + purchaseData[ 'extra' ] + '</span></strong></h5>'

            }

            var orderAdditionalInfo = '';

            if(  purchaseData[ 'additional_information' ] )
            {

                orderAdditionalInfo = '<h5><i class="fa fa-info-circle"></i> Información para el reparto:<br><strong><span class="text-warning">' + purchaseData[ 'additional_information' ] + '</span></strong></h5>'

            }

						$( '#PurchaseList' ).append( '<div id="purchase_container' + id + '" purchase="' + id + '" class="purchaseContainer" position="' + position + '">' + orderTitle + orderFields + orderExtraInfo + orderAdditionalInfo + '<br></div>' )

						$( '#remove' + id ).removeClass( 'Hidden' );

				}

				validateDivChange();

				QuantityFieldChanged();

				CalculateDeliveryItems();

				return false;

		});

}

function removePurchase()
{

		$( '.removePurchase' ).on( 'click', function( e )
		{

				e.stopPropagation();

				var id = $( this ).attr( 'purchase' );

				var position = parseInt( $( '#purchase_container' + id ).attr( 'position' ) );

				$( '#purchase_container' + id ).remove();

				$( '#remove' + id ).addClass( 'Hidden' );

				$( '#add' + id ).removeClass( 'Hidden' );

				var pIDs = $( '#selected_purchases' ).val().split( ',' );

				pIDs = pIDs.filter( item => item !== id );

				if( pIDs.length )
				{

						$( '.purchaseContainer' ).each( function()
						{

								if( parseInt( $( this ).attr( 'position' ) ) > position )
								{

										$( this ).attr( 'position', parseInt( $( this ).attr( 'position' ) ) - 1 );

										$( '#position' + $( this ).attr( 'purchase' ) ).html( $( this ).attr( 'position' ) );

								}

						})

				}

				$( '#selected_purchases' ).val( pIDs.join( ',' ) );

				QuantityFieldChanged();

				CalculateDeliveryItems();

				return false;

		});

}
