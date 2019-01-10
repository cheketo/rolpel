  <?php

      include( '../../../core/resources/includes/inc.core.php' );

      $New = new Delivery();

      $Head->SetTitle( $Menu->GetTitle() );

      $Head->SetIcon( $Menu->GetHTMLicon() );

      $Head->SetStyle( '../../../../vendors/datepicker/datepicker3.css' ); // Date Picker Calendar

      $Head->SetStyle( '../../../../vendors/autocomplete/jquery.auto-complete.css' ); // Autocomplete

      $Head->setHead();

      include( '../../../project/resources/includes/inc.top.php' );

      echo Core::InsertElement( 'hidden', 'action', 'insert' );

  ?>

  <div class="box animated fadeIn" style="min-width:99%">

      <div class="box-header flex-justify-center">

          <div class="innerContainer main_form" style="min-width:100%">

              <form id="DeliveryForm">


                  <h4 class="subTitleB"><i class="fa fa-calendar"></i> Fecha <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Fecha que se har&aacute; el reparto."><i class="fa fa-question-circle "></i></span></h4>

                  <div class="row form-group inline-form-custom">

                      <div class="col-xs-12">

                          <?php echo Core::InsertElement( 'text', 'delivery_date', date( 'd/m/Y' ), 'form-control datePicker', 'validateEmpty="Seleccione una Fecha" placeholder="Seleccione una fecha"' ); ?>

                      </div>

                  </div>

                  <h4 class="subTitleB"><i class="fa fa-truck"></i> Cami&oacute;n <span class="text-info cursor-pointer hint--right hint--bounce hint--info" aria-label="Cami&oacute;n al cual se le asociará el reparto."><i class="fa fa-question-circle "></i></span></h4>

                  <div class="row form-group inline-form-custom">

                      <div class="col-xs-12">

                            <?php echo Core::InsertElement( 'select', 'truck', '', 'form-control chosenSelect', 'validateEmpty="Seleccione un Cami&oacute;n"', Core::Select( Truck::SEARCH_TABLE, 'truck_id, CONCAT( code, " (", driver ,")" )', "status='A'" ), ' ', 'Seleccionar Cami&oacute;n' ); ?>

                      </div>

                  </div>

                  <hr>

                  <div class="row txC">

                      <button type="button" class="btn btn-success btnGreen" id="BtnCreate"><i class="fa fa-plus"></i> Crear Reparto</button>

                      <button type="button" class="btn btn-error btnRed" id="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>

                  </div>

              </form>

          </div>

      </div><!-- box -->

  </div><!-- box -->

  <?php

      $Foot->SetScript( '../../../../vendors/autocomplete/jquery.auto-complete.min.js');

      $Foot->SetScript( '../../../../vendors/datepicker/bootstrap-datepicker.js');

      include( '../../../project/resources/includes/inc.bottom.php');

  ?>
