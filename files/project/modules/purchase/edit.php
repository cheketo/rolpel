

<?php

    include("../../../core/resources/includes/inc.core.php");

    $ID     = $_GET['id'];
    $Edit   = new Purchase($ID);
    $Data   = $Edit->GetData();

    // var_dump( $Data );
    // die();

    Core::ValidateID( $Data[ 'purchase_id' ] );
    $Status = $Data[ 'status' ];

    if($Status=='F')
    {
      header('Location: list.php?error=status'.Purchase::GetParams());
      die();
    }

    $Branches   = Core::Select(CompanyBranch::TABLE,CompanyBranch::TABLE_ID.",CONCAT(name,' (',address,')') AS name",Company::TABLE_ID.'='.$Data[Company::TABLE_ID]);

    $Agents     = Core::Select('company_agent','agent_id,name',CompanyBranch::TABLE_ID.'='.$Data[CompanyBranch::TABLE_ID]);

    if(empty($Agents))
    {
      $AgentClass = "warning";
      $AgentIcon = "times";
      $AgentName = "Seleccionar Contacto";
    }else{
      $AgentClass = "success";
      $AgentIcon = "male";
      foreach ($Agents as $Agent)
      {
        if($Agent[CompanyAgent::TABLE_ID]==$Data['agent_id'])
          $AgentName = $Agent['name'];
      }
    }

    $PurchaseDate = Core::FromDBToDate( $Data[ 'purchase_date' ] );


    $TotalItems = count($Data['items']);





    $RowTitleClass = 'light-blue';


    $FieldInternational = "AND international='N' ";

    $ProductCodes = Product::GetFullCodes();

    $Head->SetTitle("Orden de Compra de ".$Data['company']);
    $Head->SetSubTitle($Menu->GetTitle().$Prefix.'Cliente');
    $Head->SetStyle('../../../../vendors/datepicker/datepicker3.css'); // Date Picker Calendar
    $Head->SetStyle('../../../../vendors/dropzone/dropzone.min.css'); // Dropzone
    $Head->SetStyle('../../../../vendors/autocomplete/jquery.auto-complete.css'); // Autocomplete
    $Head->SetStyle('../../../../vendors/clockpicker/clockpicker.css'); // Color Picker CSS
    $Head->setHead();
    include('../../../project/resources/includes/inc.top.php');
?>

<?php echo Core::InsertElement("hidden","action",'update'); ?>
<?php echo Core::InsertElement("hidden","status",$Status); ?>
<?php echo Core::InsertElement("hidden","id",$ID); ?>
<?php echo Core::InsertElement("hidden","items",$TotalItems); ?>
<?php echo Core::InsertElement("hidden","company_type",'receiver'); ?>
<?php echo Core::InsertElement("hidden","creation_date",$Data['creation_date']); ?>
<?php echo Core::InsertElement('hidden','qfilecount',"0.00"); ?>

<?php include_once('../product/window.traceability.php'); ?>
<?php include_once('../product/window.product.php'); ?>
<?php include_once('../agent/window.agent.php'); ?>
<?php include_once('window.email.php'); ?>

  <div class="box animated fadeIn" style="min-width:99%">
    <div class="box-header flex-justify-center">
      <div class="innerContainer main_form" style="min-width:100%">
            <form id="PurchaseForm">

            <h4 class="subTitleB"><i class="fa fa-users"></i> Cliente <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Cliente a cual se le asociará la orden de compra."><i class="fa fa-question-circle "></i></span></h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                  <?php
                    echo Core::InsertElement('select','company',$Data['company_id'],'form-control chosenSelect','validateEmpty="Seleccione un cliente" data-placeholder="Seleccione un cliente."',Core::Select(Company::TABLE,Company::TABLE_ID.',name',"customer= 'Y' ".$FieldInternational." AND status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID],'name'));
                  ?>
              </div>
            </div>
            <h4 class="subTitleB"><i class="fa fa-building"></i> Sucursal <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Sucursal del cliente seleccionado a la cual se le asociará la orden de compra."><i class="fa fa-question-circle "></i></span></h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                  <div id="branch-wrapper">
                    <?php echo Core::InsertElement('select','branch',$Data['branch_id'],'form-control chosenSelect','validateEmpty="Seleccione una Sucursal"', $Branches); ?>
                  </div>
              </div>
            </div>

            <!--<h4 class="subTitleB"><i class="fa fa-male"></i> Contacto</h4>-->
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                  <div id="agent-wrapper">
                    <?php //echo Core::InsertElement('select','agent','','form-control chosenSelect','validateEmpty="Seleccione un Contacto" disabled="disabled"','','0','Sin Contacto'); ?>
                    <?php echo Core::InsertElement("hidden","agent",$Data['agent_id']); ?>
                    <strong><button type="button" class="btn btn-lg btn-<?php echo $AgentClass ?>" id="ShowAgentBtn"><i class="fa fa-<?php echo $AgentIcon ?>"></i> <?php echo $AgentName ?></button></strong> <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Persona que trabaja en la empresa del cliente y es la responsable por la orden de compra. No es obligatorio seleccionar un contacto."><i class="fa fa-question-circle "></i></span>
                  </div>
              </div>
            </div>

            <h4 class="subTitleB"><i class="fa fa-calendar"></i> Fecha de Orden de Compra <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Fecha en la cual quedará registrada la creación de la orden de compra."><i class="fa fa-question-circle "></i></span></h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                <?php echo Core::InsertElement('text','real_date',$PurchaseDate,'form-control delivery_date','validateEmpty="Seleccione una Fecha" placeholder="Seleccione una fecha"'); ?>
              </div>
            </div>

            <?php
                $SentEmails = $Edit->GetSentEmails();
                if(count($SentEmails)>0)
                {
            ?>

            <h4 class="subTitleB"><i class="fa fa-envelope"></i> Emails Enviados</h4>
            <?php

              foreach($SentEmails as $SentEmail)
              {
                switch ($SentEmail['status'])
                {
                  case 'P':
                    $LabelClass = 'warning';
                    $LabelText = 'ENVIADO';
                  break;
                  case 'A':
                    $LabelClass = 'success';
                    $LabelText = 'ABIERTO';
                  break;
                  default:
                    $LabelClass = 'default';
                  break;
                }
            ?>

            <div class="row form-group inline-form-custom">
              <div class="col-xs-12 col-sm-3 txC">
                <?php echo $SentEmail['email_to']?>
              </div>
              <div class="col-xs-12 col-sm-3 txC">
                <span class="label label-<?php echo $LabelClass ?>"><?php echo $LabelText ?></span>
              </div>
              <div class="col-xs-12 col-sm-3 txC">
                <h4><a href="<?php echo $SentEmail['file']?>" style="color:#000" class="hint--bottom hint--bounce" aria-label="Descargar PDF"><span class="fa fa-download"></span></a></h4>
              </div>
            </div>
            <br>
            <?php } }  ?>

            <!-- Delivery Date and Time -->

            <?php
                $MondayChecked = $Data['monday_from']? 'checked="checked"' : '';
                $TuesdayChecked = $Data['tuesday_from']? 'checked="checked"' : '';
                $WensdayChecked = $Data['wensday_from']? 'checked="checked"' : '';
                $ThursdayChecked = $Data['thursday_from']? 'checked="checked"' : '';
                $FridayChecked = $Data['friday_from']? 'checked="checked"' : '';
                $SaturdayChecked = $Data['saturday_from']? 'checked="checked"' : '';
                $SundayChecked = $Data['sunrday_from']? 'checked="checked"' : '';

                $MondayDisabled = $Data['monday_from']? '"' : 'disabled="disabled"';
                $TuesdayDisabled = $Data['tuesday_from']? '"' : 'disabled="disabled"';
                $WensdayDisabled = $Data['wensday_from']? '"' : 'disabled="disabled"';
                $ThursdayDisabled = $Data['thursday_from']? '"' : 'disabled="disabled"';
                $FridayDisabled = $Data['friday_from']? '"' : 'disabled="disabled"';
                $SaturdayDisabled = $Data['saturday_from']? '"' : 'disabled="disabled"';
                $SundayDisabled = $Data['sunday_from']? '"' : 'disabled="disabled"';
            ?>
            <div id="DeliveryDateTime" class="">
              <h4 class="subTitleB"><i class="fa fa-clock-o"></i> Horarios de recepción <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Días y horarios de recepción del cliente. Se carga por defecto con la información de la sucursal seleccionada."><i class="fa fa-question-circle "></i></span></h4>

                <div class="row">

                    <!-- Monday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>
                                        <input type="checkbox" <?php echo $MondayChecked; ?> class="iCheckbox DayCheck" name="monday" id="monday" value="1" > <span>Lunes</span>
                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_monday',$Data['monday_from'],'form-control clockPicker inputMask',$MondayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_monday',$Data['monday_to'],'form-control clockPicker inputMask',$MondayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Tuesday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $TuesdayChecked; ?> class="iCheckbox DayCheck" name="tuesday" id="tuesday" value="1" > <span>Martes</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_tuesday',$Data['tuesday_from'],'form-control clockPicker inputMask',$TuesdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_tuesday',$Data['tuesday_to'],'form-control clockPicker inputMask',$TuesdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Wensday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $WensdayChecked; ?> class="iCheckbox DayCheck" name="wensday" id="wensday" value="1" > <span>Mi&eacute;rcoles</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_wensday',$Data['wensday_from'],'form-control clockPicker inputMask',$WensdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"');?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_wensday',$Data['wensday_to'],'form-control clockPicker inputMask',$WensdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"');?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Thursday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $ThursdayChecked; ?> class="iCheckbox DayCheck" name="thursday" id="thursday" value="1" > <span>Jueves</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_thursday',$Data['thursday_from'],'form-control clockPicker inputMask',$ThursdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_thursday',$Data['thursday_to'],'form-control clockPicker inputMask',$ThursdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Friday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $FridayChecked ?> class="iCheckbox DayCheck" name="friday" id="friday" value="1" > <span>Viernes</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_friday',$Data['friday_from'],'form-control clockPicker inputMask',$FridayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_friday',$Data['friday_to'],'form-control clockPicker inputMask',$FridayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Saturday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $SaturdayChecked; ?> class="iCheckbox DayCheck DayCheck" name="saturday" id="saturday" value="1" > <span>S&aacute;bado</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_saturday',$Data['saturday_from'],'form-control clockPicker inputMask',$SaturdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_saturday',$Data['saturday_to'],'form-control clockPicker inputMask',$SaturdayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                    <!-- Sunday -->
                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                        <div class="row form-group inline-form-custom">

                            <div class="col-xs-12 col-sm-12 col-md-4">

                                <div class="checkbox icheck">

                                    <label>

                                        <input type="checkbox" <?php echo $SundayChecked; ?> class="iCheckbox DayCheck" name="sunday" id="sunday" value="1" > <span>Domingo</span>

                                    </label>

                                </div>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario inicial"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','from_sunday',$Data['sunday_from'],'form-control clockPicker inputMask',$SundayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-4 margin-top1em">

                                <span class="input-group">

                                    <span class="input-group-addon"><span class="hint--bottom hint--bounce" aria-label="Horario final"><i class="fa fa-clock-o"></i></span></span>

                                    <?php echo Core::InsertElement('text','to_sunday',$Data['sunday_to'],'form-control clockPicker inputMask',$SundayDisabled.' data-inputmask="\'mask\': \'99[:99]\'" placeholder="00:00"'); ?>

                                </span>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- Monday -->













            </div>


            <!-- Products -->
            <h4 class="subTitleB"><i class="fa fa-cubes"></i> Productos <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Productos que integran la orden de compra."><i class="fa fa-question-circle "></i></span></h4>
            <div style="margin:0px 10px; min-width:90%;">
              <div class="row form-group inline-form-custom bg-light-blue" style="margin-bottom:0px!important;">

                <div class="col-xs-4 txC">
                  <strong>Producto y Medidas</strong>
                </div>
                <div class="col-xs-1 txC">
                  <strong>Precio</strong>
                </div>
                <div class="col-xs-1 txC">
                  <strong>Cantidad</strong>
                </div>
                <div class="col-xs-2 txC">
                  <strong>Fecha de Entrega</strong>
                </div>
                <div class="col-xs-1 txC">
                  <strong>D&iacute;as</strong>
                </div>
                <div class="col-xs-1 txC"><strong>Costo</strong></div>
                <div class="col-xs-2 txC">
                  <strong>Acciones</strong>
                </div>
              </div>
              <hr style="margin-top:0px!important;margin-bottom:0px!important;">
              <!--- ITEMS --->
              <div id="ItemWrapper">
                <?php
                foreach($Data['items'] as $Key => $Item)
                {
                    $Item['days'] = $Item['days']?$Item['days']:"00";
                    $I = $Key + 1;
                ?>
                <!--- ITEM <?php echo $I  ?> --->
                <div id="item_row_<?php echo $I  ?>" item="<?php echo $I  ?>" class="row form-group inline-form-custom ItemRow bg-gray" style="margin-bottom:0px!important;padding:10px 0px!important;">
                  <form id="item_form_<?php echo $I  ?>" name="item_form_<?php echo $I  ?>">
                  <div class="col-xs-4 txC">
                    <span id="Item1" class="Hidden ItemText1"></span>

                    <?php echo Core::InsertElement("autocomplete","item_".$I,$Item['product_id'].','.$Item['title'].' - '.$Item['brand'].' - '.$Item['category'],'ItemField' . $I . ' txC form-control itemSelect','validateEmpty="Seleccione un Producto" placeholder="Ingrese un producto" placeholderauto="Producto no encontrado" item="' . $I . '" iconauto="cube"','Product','SearchCodes');?>
                    <div class="row">

                        <div class="col-xs-12 col-sm-4">

                            <?php echo Core::InsertElement('text','sizex_'.$I,$Item['width'],'ItemField' . $I . ' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Ancho"'); ?>

                        </div>

                        <div class="col-xs-12 col-sm-4">

                            <?php echo Core::InsertElement('text','sizey_'.$I,$Item['height'],'ItemField' . $I . ' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Alto"'); ?>

                        </div>

                        <div class="col-xs-12 col-sm-4">

                          <?php echo Core::InsertElement('text','sizez_'.$I,$Item['depth'],'ItemField' . $I . ' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Profundidad"'); ?>

                        </div>

                    </div>

                    <?php //echo Core::InsertElement("text","item_1",'','Hidden',''); ?>
                  </div>
                  <div class="col-xs-1 txC">
                    <span id="Price<?php echo $I  ?>" class="Hidden ItemText<?php echo $I  ?>"></span>
                    <?php echo Core::InsertElement('text','price_'.$I,$Item['price'],'ItemField'.$I.' form-control txC calcable inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'$9{+}[.9{+}]\'" placeholder="Precio" validateEmpty="Ingrese un precio"'); ?>
                  </div>
                  <div class="col-xs-1 txC">
                    <span id="Quantity<?php echo $I  ?>" class="Hidden ItemText<?php echo $I  ?>"></span>
                    <?php echo Core::InsertElement('text','quantity_'.$I,$Item['quantity'],'ItemField'.$I.' form-control txC calcable QuantityItem inputMask smallFont','data-inputmask="\'mask\': \'9{+}\'" placeholder="Cantidad" validateEmpty="Ingrese una cantidad"'); ?>
                  </div>
                  <div class="col-xs-2 txC">
                    <span id="Date<?php echo $I  ?>" class="Hidden ItemText<?php echo $I  ?> OrderDate"></span>
                    <?php echo Core::InsertElement('text','date_'.$I,'','ItemField'.$I.' form-control txC delivery_date','disabled="disabled" placeholder="Fecha de Entrega" validateEmpty="Ingrese una fecha"'); ?>
                  </div>
                  <div class="col-xs-1 txC">
                    <span id="Day<?php echo $I  ?>" class="Hidden ItemText<?php echo $I  ?> OrderDay"></span>
                    <?php echo str_replace("00","0",Core::InsertElement('text','day_'.$I,$Item['days'],'ItemField'.$I.' form-control txC DayPicker inputMask','placeholder="D&iacute;as" data-inputmask="\'mask\': \'9{+}\'" validateEmpty="Ingrese una cantidad de d&iacute;as"')); ?>
                  </div>
                  <div id="item_number_<?php echo $I  ?>" class="col-xs-1 txC item_number" total="<?php echo $Item[ 'total_item' ]  ?>" item="<?php echo $I  ?>">$ <?php echo $Item[ 'total_item' ]  ?></div>
                  <div class="col-xs-2 txC">
  									  <!-- <button type="button" id="SaveItem1" class="btn btnGreen SaveItem" style="margin:0px;" item="1"><i class="fa fa-check"></i></button> -->
  									  <!-- <button type="button" id="EditItem1" class="btn btnBlue EditItem Hidden" style="margin:0px;" item="1"><i class="fa fa-pencil"></i></button> -->
  									  <button type="button" id="HistoryItem<?php echo $I  ?>" class="btn btn-github HistoryItem hint--bottom hint--bounce Hidden" aria-label="Trazabilidad" style="margin:0px;" item="<?php echo $I  ?>"><i class="fa fa-book"></i></button>
  									  <!--<button type="button" id="DeleteItem1" class="btn btnRed DeleteItem" style="margin:0px;" item="1"><i class="fa fa-trash"></i></button>-->
  								</div>
  								</form>
                </div>
                <!--- ITEM <?php echo $I  ?> --->
                <?php } ?>
              </div>
              <!--- TOTALS --->
              <hr style="margin-top:0px!important;">
              <div class="row form-group inline-form-custom bg-light-blue">
                <div class="col-xs-4 txC">
                  Productos Totales: <strong id="TotalItems" >><?php echo $TotalItems ?></strong>
                </div>
                <div class="col-xs-3 txC">
                  Cantidad Total: <strong id="TotalQuantity" >0</strong>
                </div>
                <div class="col-xs-3 txC">
                  Costo Total: <strong  id="TotalPrice">$ 0.00</strong> <span class="text-danger">(Sin IVA)</span>
                  <?php echo Core::InsertElement("hidden","total_price","0"); ?>
                </div>
              </div>
              <!--- TOTALS --->
            </div>


            <div class="row">
              <div class="col-sm-6 col-xs-12 txC">
                <button type="button" id="add_purchase_item" class="btn btn-warning"><i class="fa fa-plus"></i> <strong>Agregar Producto</strong></button>
                <button type="button" id="BtnCreateProduct" class="btn btn-info"><i class="fa fa-cube"></i> <strong>Crear Producto</strong></button>
                <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Si no encuentra el producto, puede crear uno nuevo en esta misma pantalla."><i class="fa fa-question-circle "></i></span>
              </div>
              <div class="col-sm-6 col-xs-12 txC">

                <div class="input-group">
                <div class="input-group-btn">
                  <button type="button" id="ChangeDays" class="btn bg-teal cursor-pointer hint--bottom hint--bounce hint--info" aria-label="Modificar de forma masiva la fecha de entrega (en días)." style="margin:0px;"><i class="fa fa-flash"></i></button>
                </div>
                <!-- /btn-group -->
                <?php echo Core::InsertElement('text','change_day','','form-control inputMask','data-inputmask="\'mask\': \'9{+}\'" placeholder="Modificar los d&iacute;as de todos los productos"'); ?>
              </div>
              </div>
            </div>

            <h4 class="subTitleB"><i class="fa fa-info-circle"></i> Informaci&oacute;n Extra para Uso Interno <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Aquí se puede cargar la información que se requiera."><i class="fa fa-question-circle "></i></span></h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                  <?php echo Core::InsertElement('textarea','additional_information',$Data['additional_information'],'form-control',' placeholder="Datos adicionales para uso interno"'); ?>
              </div>
            </div>
            <h4 class="subTitleB"><i class="fa fa-info-circle"></i> Informaci&oacute;n Extra para el cliente <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Aquí se puede cargar la informaición que necesite el cliente."><i class="fa fa-question-circle "></i></span></h4>
            <div class="row form-group inline-form-custom">
              <div class="col-xs-12">
                  <?php echo Core::InsertElement('textarea','extra',$Data['extra'],'form-control',' placeholder="Datos adicionales para el cliente"'); ?>
              </div>
            </div>
          <hr>
          <div class="row txC">
            <button type="button" class="btn btn-success btnGreen" id="BtnEdit"><i class="fa fa-pencil"></i> Editar Orden de Compra</button>
            <button type="button" class="btn btn-success btnBlue" id="BtnCreateAndEmail"><i class="fa fa-envelope"></i> Editar y Enviar por Email</button>
            <button type="button" class="btn btn-error btnRed" id="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>
          </div>
        </form></div>
    </div><!-- box -->
  </div><!-- box -->
<?php
$Foot->SetScript('../../../../vendors/inputmask3/jquery.inputmask.bundle.min.js');
$Foot->SetScript('../../../../vendors/autocomplete/jquery.auto-complete.min.js');
$Foot->SetScript('../../../../vendors/datepicker/bootstrap-datepicker.js');
$Foot->SetScript('../../../../vendors/dropzone/dropzone.min.js');
$Foot->SetScript('../../../../vendors/clockpicker/clockpicker.js');
$Foot->SetScript('script.dropzone.js');
$Foot->SetScript('../agent/script.agent.js');
$Foot->SetScript('../product/script.traceability.js');
$Foot->SetScript('script.email.js');
$Foot->SetScript('../product/script.product.js');
include('../../../project/resources/includes/inc.bottom.php');
?>
