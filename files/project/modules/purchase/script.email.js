$( document ).ready( function()
{

		CloseEmailWindow();

		$( '#BtnCreateAndEmail' ).click( function()
		{

				ShowEmailWindow();

		});

});

function ShowEmailWindow()
{

		if( validate.validateFields( 'PurchaseForm' ) )
		{

				$( '#EmailWindow' ).removeClass( 'Hidden' );

				$( '#CompanyName' ).html( $( '#company option:selected' ).html() );

				GetReceiverEmail();

		}
}

function CloseEmailWindow()
{

		$( '.CloseEmailWindow' ).click( function()
		{

				$( '#receiver' ).val( '' );

				$( '#EmailWindow' ).addClass( 'Hidden' );

		});

}

function GetReceiverEmail()
{

		var id = $( '#agent' ).val();

		if( id == 'undefined' || id < 1 )
		{

				id = 0;

		}

		var string	= 'company=' + $( '#company' ).val() + '&agent=' + id + '&action=getcompanyemail&object=Company';

		$.ajax(
		{

	        type: 'POST',

	        url: process_url,

	        data: string,

	        cache: false,

	        success: function( data )
					{

	            if( data )
	            {

	            		$( '#receiver' ).val( data );

	            }

	        }

	  });

}

$( '#SaveAndSend' ).click( function()
{

		if( $( '#action' ).val() == 'insert' )
		{

				var action = 'crear';

		}else{

				var action = 'editar';

		}

		var element = $( '#company option:selected' ).html();

		var target	= 'list.php?msg=' + msg + params + '&emailsent=' + $( '#receiver' ).val() + '&element=' + element;

		askAndSubmit( target, role, '¿Desea ' + action + ' la cotizaci&oacute;n de <b>' + element + '</b> y enviarla por email al destinatario <b>' + $( '#receiver' ).val() + '</b>?', '', 'EmailWindowForm' );

});
