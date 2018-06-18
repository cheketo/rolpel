<?php
    include("../../../core/resources/includes/inc.core.php");
    $ID           = $_GET['id'];
    $Edit         = new Truck($ID);
    $Data         = $Edit->GetData();
    Core::ValidateID($Data);
    $Name = $Data['brand'].' '.$Data['model'].' '.$Data['year'];
    $Head->SetTitle($Name);
    $Head->SetSubTitle("Modificar Cami&aocute;n");
    $Head->SetIcon($Menu->GetHTMLicon());
    $Head->setHead();

    $Drivers = Core::Select('core_user a JOIN core_relation_user_group b ON (b.user_id=a.user_id) JOIN core_group c ON (c.group_id=b.group_id)',"a.user_id,CONCAT(a.last_name,' ',a.first_name) as name","c.title LIKE '%chofer%' OR c.title LIKE '%camion%'",'a.last_name,a.first_name');

    include('../../../project/resources/includes/inc.top.php');

?>
  <?php echo Core::InsertElement("hidden","action",'update'); ?>
  <?php echo Core::InsertElement("hidden","id",$ID); ?>
  <div class="ProductDetails box animated fadeIn">
    <div class="box-header flex-justify-center">

        <div class="innerContainer">
          <h4 class="subTitleB"><i class="fa fa-truck"></i> Modifique los campos para editar al cami&oacute;n <b><?php echo $Name ?></b></h4>

            <div class="row form-group inline-form-custom-2">
              <div class="col-xs-12 col-sm-4 inner">
                <label>Nombre / C&oacute;digo</label>
                <?php echo Core::InsertElement('text','code',$Data['code'],'form-control','placeholder="Ingrese un Nombre o un C&oacute;digo" validateEmpty="Ingrese un Nombre o un C&oacute;digo"'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>Marca</label>
                <?php echo Core::InsertElement('text','brand',$Data['brand'],'form-control','placeholder="Ingrese una Marca" validateEmpty="Ingrese una Marca."'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>Modelo</label>
                <?php echo Core::InsertElement('text','model',$Data['model'],'form-control','placeholder="Ingrese un Modelo" validateEmpty="Ingrese un Modelo."'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>A&ntilde;o</label>
                <?php echo Core::InsertElement('text','year',$Data['year'],'form-control','placeholder="Ingrese un A&ntilde;o" validateEmpty="Ingrese un A&ntilde;o."'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>Patente</label>
                <?php echo Core::InsertElement('text','plate',$Data['plate'],'form-control','placeholder="Ingrese una Patente" validateEmpty="Ingrese una Patente."'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>Capacidad</label>
                <?php echo Core::InsertElement('text','capacity',$Data['capacity'],'form-control','placeholder="Ingrese una Capacidad" validateEmpty="Ingrese una Capacidad."'); ?>
              </div>
              <div class="col-xs-12 col-sm-4 inner">
                <label>Chofer</label>
                <?php echo Core::InsertElement('select','driver',$Data['driver_id'],'form-control chosenSelect','validateEmpty="Seleccione un Chofer" data-placeholder="Seleccione un Chofer"',$Drivers,' ',''); ?>
              </div>

            </div><!-- inline-form -->
            <hr>
            <div class="txC">
              <button type="button" class="btn btn-success btnGreen" id="BtnCreate"><i class="fa fa-check"></i> Editar Cami&oacute;n</button>
              <button type="button" class="btn btn-error btnRed" id="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>
            </div>

        </div>

    </div>
  </div>


<?php
include('../../../project/resources/includes/inc.bottom.php');
?>
