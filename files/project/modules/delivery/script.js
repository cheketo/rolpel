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

});

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

						$( '#PurchaseList' ).append( '<div id="purchase_container' + id + '" purchase="' + id + '" class="purchaseContainer" position="' + position + '">' + orderTitle + orderFields + '<br></div>' )

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
