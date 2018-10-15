<div class="window Hidden" id="ProductWindow">
    <div class="window-border"><h4><div class="pull-left"><i class="fa fa-cube"></i> Crear Nuevo Art&iacute;culo</div><div class="pull-right"><div id="ProductWindowClose" class="CloseWindow CloseProductWindow text-red"><i class="fa fa-times"></i></div></div></h4></div>
    <div class="window-body" style="background-color:#FFF;">
        <form id="ProductWindowForm">
            <div class="innerContainer" style="background-color:#EEE;padding-top:20px!important;">
                <div class="row form-group inline-form-custom">
                    <div class="col-xs-12 col-sm-12">
                        <label for="new_product_title">Nombre</label>
                        <?php echo Core::InsertElement('text','new_product_title','','form-control','placeholder="Nombre" validateEmpty="Ingrese un nombre."') ?>
                    </div>
                </div>
                <div class="row form-group inline-form-custom">
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_category">Categor&iacute;a</label>
                      <?php echo Core::InsertElement('select','new_product_category','','form-control chosenSelect','data-placeholder="Seleccionar Categor&iacute;a" validateEmpty="Seleccione una categor&iacute;a."',Core::Select(Category::TABLE,Category::TABLE_ID.",title","status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID]),' ','') ?>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_brand">Marca</label>
                      <?php echo Core::InsertElement('select','new_product_brand','','form-control chosenSelect','data-placeholder="Seleccionar Marca" validateEmpty="Seleccione una marca." style="width:100%!important;"',Core::Select(Brand::TABLE,Brand::TABLE_ID.",name","status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID]),' ',''); ?>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_category">Precio</label>
                      <?php echo Core::InsertElement('text','new_product_price','','form-control inputMask DecimalMask','data-inputmask="\'mask\': \'$9{+}[.9{+}]\'" placeholder="Precio"') ?>
                    </div>
                </div>
                <div class="row form-group inline-form-custom">
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_category">Ancho</label>
                      <?php echo Core::InsertElement('text','new_product_width','','form-control inputMask DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Ancho"') ?>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_brand">Alto</label>
                      <?php echo Core::InsertElement('text','new_product_height','','form-control inputMask DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Alto"') ?>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                      <label for="new_product_brand">Profundidad</label>
                      <?php echo Core::InsertElement('text','new_product_depth','','form-control inputMask DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Profundidad"') ?>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="window-border txC">
        <button type="button" class="btn btn-primary btnBlue" id="CreateProduct"><i class="fa fa-plus-circle"></i> Crear Producto</button>
        <button type="button" class="btn btn-error btnRed CloseProductWindow" id="CancelProduct"><i class="fa fa-times"></i> Cancelar</button>
    </div>
  </div>
