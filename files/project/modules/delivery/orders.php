  <?php

      include( '../../../core/resources/includes/inc.core.php' );

      $ID = $_GET[ 'id' ];

      $Edit = new Delivery( $ID );

      $Data = $Edit->GetData();

      $Purchases = Core::Select( Purchase::TABLE . ' a INNER JOIN company_branch b ON ( b.branch_id = a.branch_id ) INNER JOIN company c ON ( c.company_id = a.company_id )', 'a.*, b.address, b.lat, b.lng, c.name', "a.status = 'A'" );

      Core::ValidateID( $Data[ Delivery::TABLE_ID ] );

      $Status = $Data[ 'status' ];

      if( $Status != 'P' )
      {

          header( 'Location: list.php?status=P&error=status' );

          die();

      }

      $Head->SetTitle( $Data[ 'truck' ][ 'code' ] . ' (' . Core::FromDBToDate( $Data[ 'delivery_date' ] ) . ')' );

      $Head->SetSubTitle( $Menu->GetTitle() );

      $Head->SetIcon( $Menu->GetHTMLicon() );

      $Head->SetStyle( '../../../../vendors/datepicker/datepicker3.css' ); // Date Picker Calendar

      $Head->SetStyle( '../../../../vendors/autocomplete/jquery.auto-complete.css' ); // Autocomplete

      $Head->SetStyle('../../../../skin/css/maps.css'); // Google Maps CSS

      $Head->setHead();

      include( '../../../project/resources/includes/inc.top.php' );

      echo Core::InsertElement( 'hidden', 'action', 'associate' );

  ?>

  <div class="box animated fadeIn" style="min-width:99%">

      <div class="box-header flex-justify-center">

          <div class="innerContainer main_form" style="min-width:100%">

              <div class="row">

                  <div class="col-xs-12 col-md-5 col-lg-3">

                      <?php echo Core::InsertElement( 'hidden', 'selected_purchases', '0' ); ?>

                      <div style="background-color:#555;color:#EEE;min-height:60em;padding:10px;" id="PurchaseList">



                      </div>

                  </div>

                  <div class="col-xs-12 col-md-7 col-lg-9">

                      <div style="min-height:60em;" class="MapWrapper">

                          <div class="Hidden">

                              <?php

                                  $Date = explode( ' ', $Data[ 'delivery_date' ] );

                                  $DayOfWeek = date( 'w', strtotime( $Date[ 0 ] ) );

                                  $Days = array( 'sunday', 'monday', 'tuesday', 'wednesday','thursday','friday', 'saturday');

                                  foreach( $Purchases as $Purchase )
                                  {

                                      if( $Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && date("Y-m-d H:i:s") <= $Purchase[ 'delivery_date' ] )
                                      {

                                          $Color = 'green';

                                      }elseif( !$Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && date("Y-m-d H:i:s") <= $Purchase[ 'delivery_date' ] ){


                                          $Color = 'blue';

                                      }elseif( $Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && date("Y-m-d H:i:s") > $Purchase[ 'delivery_date' ] ){

                                          $Color = 'pink';

                                      }else{

                                          $Color = 'red';

                                      }

                                      $ID = $Purchase[ 'purchase_id' ];

                                      echo Core::InsertElement( 'text', 'purchase' . $ID, $ID, 'Hidden Purchase' );

                                      echo Core::InsertElement( 'text', 'purchase_data' . $ID,  str_replace( '"',"'", json_encode( $Purchase, JSON_HEX_QUOT ) ) );

                                      echo Core::InsertElement( 'text', 'purchase_color' . $ID, $Color, 'Hidden Color' );

                                  }

                              ?>

                          </div>

                          <div id="gmap" class="GoogleMap" style="position:relative!important;"></div>

                      </div>

                  </div>

              </div>

              <hr>

              <div class="row txC">

                  <button type="button" class="btn btn-success btnGreen" id="BtnCreate"><i class="fa fa-check"></i> Guardar</button>

                  <button type="button" class="btn btn-error btnRed" id="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>

              </div>



          </div>

      </div><!-- box -->

  </div><!-- box -->

  <?php

      $Foot->SetScript( '../../../../vendors/autocomplete/jquery.auto-complete.min.js');

      $Foot->SetScript( '../../../../vendors/datepicker/bootstrap-datepicker.js');

      $Foot->SetScript( 'script.map.js');

      $Foot->SetScript( 'https://maps.googleapis.com/maps/api/js?key=AIzaSyCuMB_Fpcn6USQEoumEHZB_s31XSQeKQc0&libraries=places&language=es&callback=initMap', 'async defer' );

      include( '../../../project/resources/includes/inc.bottom.php');

  ?>
