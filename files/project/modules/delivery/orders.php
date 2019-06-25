  <?php

      include( '../../../core/resources/includes/inc.core.php' );

      $ID = $_GET[ 'id' ];

      $Edit = new Delivery( $ID );

      $Data = $Edit->GetData();

      Core::ValidateID( $Data[ Delivery::TABLE_ID ] );

      $Purchases = Core::Select( Purchase::TABLE . ' a INNER JOIN company_branch b ON ( b.branch_id = a.branch_id ) INNER JOIN company c ON ( c.company_id = a.company_id ) INNER JOIN ' . PurchaseItem::TABLE . " d ON ( d.purchase_id = a.purchase_id AND d.status <> 'F' AND ( d.quantity > ( d.quantity_reserved + d.quantity_delivered ) OR d.item_id IN ( SELECT purchase_item_id FROM delivery_order_item WHERE delivery_id = " . $ID  . ' ) ) )  ', 'DISTINCT a.purchase_id, a.*, b.address, b.lat, b.lng, c.name', "a.status = 'A'" );

      // var_dump( Core::LastQuery() );

      $PreviousItems = Core::Select( PurchaseItem::TABLE . ' a LEFT JOIN delivery_order_item b ON ( b.purchase_item_id = a.item_id AND b.delivery_id = ' . $ID . ' )', 'a.item_id, a.purchase_id, a.product_id, IF( b.position, b.position, (SELECT position FROM delivery_order_item d WHERE d.delivery_id = ' . $ID . ' AND d.purchase_id = a.purchase_id ) ) as position , b.delivery_id, b.quantity', ' a.purchase_id IN ( SELECT purchase_id FROM delivery_order_item c WHERE c.delivery_id = ' . $ID . ' ) ', 'position' );

      // $PreviousItems = Core::Select( 'delivery_order_item b LEFT JOIN ' . PurchaseItem::TABLE . ' a  ON ( a.purchase_id = b.purchase_id )', 'a.item_id, a.purchase_id, a.product_id, b.position, b.delivery_id, b.quantity', 'b.delivery_id = ' . $ID, 'a.item_id, a.product_id, b.position' );

      // var_dump( $Purchases ); die();

      $Status = $Data[ 'status' ];

      if( $Status != 'P' )
      {

          header( 'Location: list.php?status=P&error=status' );

          die();

      }

      $Title = $Data[ 'truck' ][ 'code' ] . ' ( ' . Core::DateTimeFormat( $Data[ 'delivery_date' ], 'weekday' ) . ' ' . Core::FromDBToDate( $Data[ 'delivery_date' ] ) . ')';

      $Head->SetTitle( $Title );

      $Head->SetSubTitle( $Menu->GetTitle() );

      $Head->SetIcon( $Menu->GetHTMLicon() );

      $Head->SetStyle( '../../../../vendors/datepicker/datepicker3.css' ); // Date Picker Calendar

      $Head->SetStyle( '../../../../vendors/autocomplete/jquery.auto-complete.css' ); // Autocomplete

      $Head->SetStyle('../../../../skin/css/maps.css'); // Google Maps CSS

      $Head->setHead();

      include( '../../../project/resources/includes/inc.top.php' );

      echo Core::InsertElement( 'hidden', 'action', 'associate' );

      echo Core::InsertElement( 'hidden', 'element', $Title );

      echo Core::InsertElement( 'hidden', 'delivery', $ID );

  ?>

  <div class="box animated fadeIn" style="min-width:99%">

      <div class="box-header flex-justify-center">

          <div class="innerContainer main_form" style="min-width:100%">

              <div class="row">

                  <div class="col-xs-12 col-md-5 col-lg-3">

                      <div class="" style="min-height:60em;background-color:#555;color:#EEE;">

                          <div class="txC" id="DeliveryOrdersTitle" style="padding-top:1em;font-size:24px;">

                                <strong><i class="fa fa-truck"></i> Listado de Ordenes</strong>

                          </div>

                          <div class="Hidden">

                              <?php

                                  $Date = explode( ' ', $Data[ 'delivery_date' ] );

                                  $DayOfWeek = date( 'w', strtotime( $Date[ 0 ] ) );

                                  $Days = array( 'sunday', 'monday', 'tuesday', 'wednesday','thursday','friday', 'saturday');

                                  $date = date("Y-m-d") . ' 00:00:00';

                                  foreach( $Purchases as $Key => $Purchase )
                                  {

                                      if( $Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && $date <= $Purchase[ 'delivery_date' ] )
                                      {

                                          $Purchases[ $Key ][ 'color' ] = 'green';

                                      }elseif( !$Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && $date <= $Purchase[ 'delivery_date' ] ){

                                          $Purchases[ $Key ][ 'color' ] = 'blue';

                                      }elseif( $Purchase[ $Days[ $DayOfWeek ] . '_from' ]  && $date > $Purchase[ 'delivery_date' ] ){

                                          $Purchases[ $Key ][ 'color' ] = 'pink';

                                      }else{

                                          $Purchases[ $Key ][ 'color' ] = 'red';

                                      }

                                      $PurchaseID = $Purchase[ 'purchase_id' ];

                                      $Items = Core::Select( PurchaseItem::TABLE . ' a INNER JOIN product b ON ( b.product_id = a.product_id ) LEFT JOIN delivery_order_item c ON ( c.purchase_item_id = a.item_id AND c.delivery_id = ' . $ID . ' )', 'a.*, IF( c.quantity > 0, ( ( a.quantity + c.quantity ) - ( a.quantity_delivered + a.quantity_reserved ) ), ( a.quantity - ( a.quantity_delivered + a.quantity_reserved ) ) ) as quantity_remain, b.title', "a.purchase_id = " . $PurchaseID . " AND a.status <> 'F'  " ); //AND ( a.quantity_delivered < a.quantity OR ( c.quantity + a.quantity_delivered ) < a.quantity )

                                      $Purchases[ $Key ][ 'items' ] = $Items;

                                      echo Core::InsertElement( 'text', 'purchase' . $PurchaseID, $PurchaseID, 'Hidden Purchase' );

                                      echo Core::InsertElement( 'text', 'purchase_data' . $PurchaseID,  str_replace( '"',"'", json_encode( $Purchase, JSON_HEX_QUOT ) ) );

                                      echo Core::InsertElement( 'text', 'items_data' . $PurchaseID,  str_replace( '"',"'", json_encode( $Items, JSON_HEX_QUOT ) ) );

                                      echo Core::InsertElement( 'text', 'purchase_color' . $PurchaseID, $Purchases[ $Key ][ 'color' ], 'Hidden Color' );

                                      echo '<br><br>';

                                  }

                              ?>

                          </div>

                          <div style="padding:10px;font-size:16px;height:30em;overflow-y:scroll;overflow-x:hidden;" id="PurchaseList">


                              <?php

                              $HTML = '';

                              $Position = 1;

                              $RelatedPurchase = null;

                              $SelectedPurchases = '00';

                              foreach( $PreviousItems as $Item )
                              {

                                  if( !$RelatedPurchase || $RelatedPurchase[ 'purchase_id' ] != $Item[ 'purchase_id' ] )
                                  {

                                      if( $RelatedPurchase )
                                      {

                                          $HTML .= '</div></div><br>';

                                      }

                                      foreach( $Purchases as $Purchase )
                                      {

                                          if( $Purchase[ 'purchase_id' ] == $Item[ 'purchase_id' ] )
                                          {

                                              // print_r( $RelatedPurchase ); echo '<br><br><br><br>'; print_r( $Purchase ); die();

                                              $RelatedPurchase = $Purchase;

                                              $SelectedPurchases .= ',' . $RelatedPurchase[ 'purchase_id' ];

                                              $HTML .= '<div id="purchase_container' . $Item[ 'purchase_id' ] . '" purchase="' . $Item[ 'purchase_id' ] . '" class="purchaseContainer" position="' . $Item[ 'position' ] . '">

                                                        <div class="orderTitle">

                                                            <b><i class="fa fa-map-marker text-' . $RelatedPurchase[ 'color' ] . '"></i> <span id="position' . $Item[ 'purchase_id' ] . '">' . $Item[ 'position' ] . '</span>. ' . $RelatedPurchase[ 'address' ] . '</b> <span class="orderSubTitle">(' . $RelatedPurchase[ 'name' ] . ')</span>

                                                        </div>

                                                        <div>';

                                              break;

                                          }

                                      }

                                  }

                                  foreach( $RelatedPurchase[ 'items' ] as $RelatedPurchaseItem )
                                  {

                                      if( $RelatedPurchaseItem[ 'item_id' ] == $Item[ 'item_id' ] )
                                      {

                                          $RelatedItem = $RelatedPurchaseItem;

                                          break;

                                      }

                                  }

                                  if( !$Item[ 'quantity' ] )
                                  {

                                      $Item[ 'quantity' ] = '0 ';

                                  }

                                  $HTML .= '<div class="row" id="item_' . $Item[ 'item_id' ] . '">
                                                <div class="col-xs-6"><input type="hidden" id="product_' . $Item[ 'purchase_id' ] . '_' . $Item[ 'item_id' ] . '" value="' . $Item[ 'product_id' ] . '"><span id="title_' . $Item[ 'purchase_id' ] . '_' . $Item[ 'item_id' ] . '">' . $RelatedItem[ 'title' ] . '</span><input type="hidden" id="position_' . $Item[ 'purchase_id' ] . '_' . $Item[ 'item_id' ] . '" value="' . $Item[ 'position' ] . '"></div>
                                                <div class="col-xs-6">
                                                    <input type="text" product="' . $Item[ 'product_id' ] . '" id="quantity_' . $Item[ 'purchase_id' ] . '_' . $Item[ 'item_id' ] . '" class="form-control txC ItemQuantity" value="' . trim( $Item[ 'quantity' ] ) . '" validateempty="Ingrese una cantidad." validateonlynumbers="Ingrese números únicamente." validatemaxvalue="' . $RelatedItem[ 'quantity_remain' ] . '///Ingrese una cantidad menor o igual a ' . $RelatedItem[ 'quantity_remain' ] . '" validateminvalue="0///Ingrese un n&uacute;mero entero positivo.">
                                                </div>
                                            </div>';

                                  $Position++;

                                  if( $RelatedPurchase[ 'extra' ] )
                                  {

                                      $HTML .= '<h5><i class="fa fa-user-secret"></i> Información para el cliente:<br><strong><span class="text-green">' . $RelatedPurchase[ 'extra' ] . '</span></strong></h5>';

                                  }

                                  if( $RelatedPurchase[ 'additional_information' ] )
                                  {

                                      $HTML .= '<h5><i class="fa fa-info-circle"></i> Información para el reparto:<br><strong><span class="text-warning">' . $RelatedPurchase[ 'additional_information' ] . '</span></strong></h5>';

                                  }

                              }

                              if( $HTML )
                              {

                                  echo $HTML . '</div></div><br>';

                              }

                              ?>

                          </div>

                          <div style="padding:10px;font-size:16px">

                              <?php echo Core::InsertElement( 'hidden', 'selected_purchases', $SelectedPurchases ); ?>

                              <div class="txC" id="DeliveryItemsTitle" style="padding-top:1em;font-size:24px;">

                                    <strong><i class="fa fa-cubes"></i> Total a Cargar</strong>

                              </div>

                          </div>

                          <div class="" id="DeliveryItems" style="height:15em;overflow-y:scroll;overflow-x:hidden;">

                          </div>

                      </div>

                  </div>

                  <div class="col-xs-12 col-md-7 col-lg-9">

                      <div style="min-height:60em;" class="MapWrapper">

                          <div id="gmap" class="GoogleMap" style="position:relative!important;"></div>

                      </div>

                  </div>

              </div>

              <hr>

              <div class="row txC">

                  <button type="button" class="btn btn-success btnGreen" id="BtnAssociate"><i class="fa fa-check"></i> Guardar</button>

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
