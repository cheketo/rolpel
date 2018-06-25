<?php
    include("../../../core/resources/includes/inc.core.php");
    $ID = $_GET['id'];
    $Edit = new Product($ID);
    $Data = $Edit->Data;

    $Head->SetTitle($Data['title']);
    $Head->SetSubTitle($Menu->GetTitle());
    $Head->SetIcon($Menu->GetHTMLicon());
    $Head->setHead();



    $Category = new Category();
    include('../../../project/resources/includes/inc.top.php');

    // HIDDEN ELEMENTS
    echo Core::InsertElement("hidden","id",$ID);
    echo Core::InsertElement("hidden","action",'update');

?>
  <div class="ProductDetails box animated fadeIn">
    <div class="box-header flex-justify-center">
      <div class="col-md-8">
        <div class="innerContainer">
          <h4 class="subTitleB"><i class="fa fa-cube"></i> Detalles del Producto</h4>
            <div class="form-group">
              <label for="title">Nombre</label>
              <?php echo Core::InsertElement('text','title',$Data['title'],'form-control','placeholder="Nombre del Producto" validateEmpty="Ingrese un nombre de Producto." validateFromFile="'.PROCESS.'///El producto ya existe///actualtitle:='.$Data['title'].'///action:=validate///object:=Product"') ?>
            </div>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12 col-sm-8">
                <label for="category">Categoría</label>
                <?php echo Core::InsertElement('select','category',$Data[Category::TABLE_ID],'form-control chosenSelect','data-placeholder="Seleccionar Categor&iacute;a" validateEmpty="Seleccione una categor&iacute;a."',Core::Select(Category::TABLE,Category::TABLE_ID.",title","status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID]),'',' ') ?>
              </div>
              <div class="col-xs-12 col-sm-4">
                <label for="brand">Marca</label>
                <?php echo Core::InsertElement('select','brand',$Data['brand_id'],'form-control  chosenSelect','validateEmpty="Ingrese una marca."',Core::Select(Brand::TABLE,Brand::TABLE_ID.",name","status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID])) ?>
              </div>
            </div>

            <br>
            <h4  class="subTitleB"><i class="fa fa-arrows"></i> Medidas</h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12 col-sm-4">
                <label for="width">Ancho</label>
                <?php echo Core::InsertElement('text','width',$Data['width'],'form-control txC','validateOnlyNumbers="Ingrese &uacute;nicamente n&uacute;meros." placeholder="Ancho"') ?>
              </div>
              <div class="col-xs-12 col-sm-4">
                <label for="height">Alto</label>
                <?php echo Core::InsertElement('text','height',$Data['height'],'form-control txC','validateOnlyNumbers="Ingrese &uacute;nicamente n&uacute;meros." placeholder="Alto"') ?>
              </div>
              <div class="col-xs-12 col-sm-4">
                <label for="depth">Profundidad</label>
                <?php echo Core::InsertElement('text','depth',$Data['depth'],'form-control txC','validateOnlyNumbers="Ingrese &uacute;nicamente n&uacute;meros." placeholder="Profundidad"') ?>
              </div>
            </div>

            <br>
            <h4  class="subTitleB"><i class="fa fa-info-circle"></i> Descripci&oacute;n</h4>
            <!-- Description (Character Counter)-->
            <div class="form-group textWithCounter">
              <?php echo Core::InsertElement('textarea','description',$Data['description'],'text-center','placeholder="Descripción del producto" rows="4" maxlength="150"'); ?>
              <div class="indicator-wrapper">
                <p>Caracteres restantes</p>
                <div class="indicator"><span class="current-length">150</span></div>
              </div>
            </div>



            <div class="txC">
              <button type="button" class="btn btn-success btnGreen" id="BtnEdit"><i class="fa fa-check"></i> Finalizar Edici&oacute;n</button>
              <button type="button" class="btn btn-error btnRed" id="BtnCancel" name="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>
            </div>
        </div>
      </div>
    </div><!-- box -->
  </div><!-- box -->

  <!-- //////////////// END SECOND SCREEN /////////////// -->

  <!-- Help Modal -->
<?php
$Foot->SetScript('../../../../vendors/bootstrap-switch/script.bootstrap-switch.min.js');
$Foot->SetScript('../../../../vendors/jquery-mask/src/jquery.mask.js');
$Foot->SetScript('../../../../vendors/inputmask3/jquery.inputmask.bundle.min.js');

include('../../../project/resources/includes/inc.bottom.php');
?>
