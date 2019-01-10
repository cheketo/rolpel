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

				notifySuccess( 'El reparto del <b>' + get[ 'element' ] + '</b> ha sido modificado correctamente' );

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

});

 /****************************************\
|                  ORDERS                 |
\****************************************/
$( document ).ready( function()
{

		// addPurchase();
		//
		// removePurchase();

});

function addPurchase()
{

		$( '.addPurchase' ).on( 'click', function( e )
		{

				e.stopPropagation();

				$( this ).addClass( 'Hidden' );

				var id = $( this ).attr( 'purchase' );


				var purchaseData = $( '#purchase_data' + id ).val().replace( /'/g, '"');

				purchaseData = JSON.parse( purchaseData	 );

				var pIDs = $( '#selected_purchases' ).val().split( ',' );

				if(  $.inArray( id, pIDs ) == -1  )
				{

						pIDs.push( id );

						$( '#selected_purchases' ).val( pIDs.join( ',' ) );

						if( $( '.purchaseContainer' ).length > 0 )
						{

								var position = parseInt( $( '#PurchaseList' ).children().last().attr( 'position' ) ) + 1;

						}else{

								var position = 1;

						}

						$( '#PurchaseList' ).append( '<div id="purchase_container' + id + '" purchase="' + id + '" class="purchaseContainer" position="' + position + '"><b><i class="fa fa-map-marker"></i><span id="position' + id + '">' + position + '</span>. ' + purchaseData[ 'address' ] + '</b></div>' )

						$( '#remove' + id ).removeClass( 'Hidden' );

				}

				return false;

		});

}

function removePurchase()
{

		$( '.removePurchase' ).on( 'click', function( e )
		{

				e.stopPropagation();

				$( this ).addClass( 'Hidden' );

				var id = $( this ).attr( 'purchase' );

				var position = parseInt( $( '#purchase_container' + id ).attr( 'position' ) );

				$( '#purchase_container' + id ).remove();

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

				return false;

		});

}
