$(document).ready(function(){
	CloseProductWindow();
	CreateProduct();
	$("#BtnCreateProduct").click(function(){
		ShowProductWindow();
	});
});


function ShowProductWindow()
{

	$("#ProductWindow").removeClass('Hidden');
}


function CreateProduct()
{
    $("#CreateProduct").click(function()
    {
        if(validate.validateFields('ProductWindowForm'))
	    {
            alertify.confirm(utf8_decode('¿Desea crear el producto <b>'+$("#new_product_title").val()+'</b>?'), function(e)
            {
                if(e)
                {
                    var string	=   'object=Product&action=Quickinsert&title='+$("#new_product_title").val()
                                    +'&brand='+$("#new_product_brand").val()
                                    +'&category='+$("#new_product_category").val()
																		+'&price='+$("#new_product_price").val()
																		+'&width='+$("#new_product_width").val()
																		+'&height='+$("#new_product_height").val()
																		+'&depth='+$("#new_product_depth").val()
                                    ;
                    $.ajax(
                    {
                        type: "POST",
                        url: process_url,
                        data: string,
                        cache: false,
                        success: function(data)
                        {
                            if(data)
                            {
                                notifyError("Ha ocurrido un error al intentar crear el producto.");
                                console.log(data);
                            }else{
                                notifySuccess("El producto <b>"+$("#new_product_title").val()+"</b> ha sido creado correctamente.");
                                $("#ProductWindow").addClass('Hidden');
		                        ResetProductForm();
                            }
                        }
                    });
                }
            });
	    }
    });
}

function CloseProductWindow()
{
	$(".CloseProductWindow").click(function(){
		$("#ProductWindow").addClass('Hidden');
		ResetProductForm();
	});
}

function ResetProductForm()
{
    $("#new_product_title").val('');
    $("#new_product_brand").val('0');
    $("#new_product_category").val('0');
}
