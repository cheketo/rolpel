<?php

    include( '../../../core/resources/includes/inc.core.php' );

    $ID = $_GET[ 'id' ];

    $Delivery = new Delivery( $ID );

    $Data = $Delivery->GetData();

    Core::ValidateID( $Data[ Delivery::TABLE_ID ] );

    $Purchases = Core::Select( Purchase::TABLE . ' a INNER JOIN company_branch b ON ( b.branch_id = a.branch_id ) INNER JOIN company c ON ( c.company_id = a.company_id ) INNER JOIN ' . PurchaseItem::TABLE .' d ON ( d.purchase_id = a.purchase_id AND d.item_id IN ( SELECT purchase_item_id FROM delivery_order_item WHERE delivery_id = ' . $ID  . ' ) )  ', 'DISTINCT a.purchase_id, a.*, b.address, b.lat, b.lng, c.name', "a.status = 'A'" );

    foreach( $Purchases as $Key => $Purchase )
    {

        $Purchases[ $Key ][ 'items' ] = Core::Select( DeliveryOrderItem::TABLE . ' a INNER JOIN product b ON ( b.product_id = a.product_id )', 'a.*, b.title as product', Purchase::TABLE_ID . '=' . $Purchase[ Purchase::TABLE_ID ] . ' AND ' . Delivery::TABLE_ID . '=' . $ID );

    }

    $DeliveryItems = Core::Select( DeliveryOrderItem::TABLE . ' a INNER JOIN product b ON ( b.product_id = a.product_id )', 'a.product_id, SUM( a.quantity ) as quantity, b.title as product', Delivery::TABLE_ID . '=' . $ID, 'a.product_id', 'a.product_id' );

    // var_dump( Core::LastQuery() );

    // $Items = Core::Select( PurchaseItem::TABLE . ' a LEFT JOIN delivery_order_item b ON ( b.purchase_item_id = a.item_id AND b.delivery_id = ' . $ID . ' )', 'a.item_id, a.purchase_id, a.product_id, IF( b.position, b.position, (SELECT position FROM delivery_order_item d WHERE d.delivery_id = ' . $ID . ' AND d.purchase_id = a.purchase_id ) ) as position , b.delivery_id, b.quantity', ' a.purchase_id IN ( SELECT purchase_id FROM delivery_order_item c WHERE c.delivery_id = ' . $ID . ' ) ', 'position' );

    $Status = $Data[ 'status' ];

    if( $Status != 'A' )
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

    echo Core::InsertElement( 'hidden', 'action', 'deliver' );

    echo Core::InsertElement( 'hidden', 'element', $Title );

    echo Core::InsertElement( 'hidden', 'delivery', $ID );

    $Items = 0;

?>

<div class="box box-primary">

    <!-- <div class="box-header">

        Header

    </div> -->

    <div class="box-body">

        <!-- Order Items -->
        <div class="row">

            <!-- Orders -->
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">

                <div class="innerContainer pad0">

                    <div class="txC bg-blue">

                        <h3 class="mar0 pad10">Ordenes</h3>

                    </div>

                    <?php foreach( $Purchases as $Purchase ){ ?>

                        <div class="txC pad0" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                          <button type="button" class="btn btn-flat btn-block bg-teal PurchaseList" purchase="<?= $Purchase[ Purchase::TABLE_ID ] ?>"><?php echo $Purchase[ 'address' ] ?></button>

                        </div>

                    <?php } ?>

                </div>

            </div>

            <!-- Items -->
            <div class="col-xs-12 col-sm-6 col-md-8 col-lg-9">

                <?php foreach( $Purchases as $Purchase ){ ?>

                <div class="PurchaseItemsWrapper <?php echo $ItemClass ?>" id="PurchaseItemsWrapper<?= $Purchase[ Purchase::TABLE_ID ] ?>" purchase="<?= $Purchase[ Purchase::TABLE_ID ] ?>">

                    <div class="innerContainer pad0">


                        <div class="txC bg-purple">

                            <h3 class="mar0 pad10">Orden de <?php echo $Purchase[ 'address' ] ?></h3>

                        </div>

                        <?php foreach( $Purchase[ 'items' ] as $Item ){ ?>

                            <div class="pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                                <span><?php echo $Item[ 'quantity' ] ?></span> unidades de <strong><?php echo $Item[ 'product' ] ?></strong>

                            </div>

                        <?php } ?>



                    </div>

                    <div class="row">

                        <div class="col-xs-12 col-sm-6">

                            <div class="innerContainer pad0">

                                <div class="txC bg-green" purchase="<?= $Purchase[ Purchase::TABLE_ID ] ?>">

                                    <h3 class="mar0 pad10">Productos Entregados a <?php echo $Purchase[ 'address' ] ?></h3>

                                </div>

                                <div class="PurchaseItems" purchase="<?= $Purchase[ Purchase::TABLE_ID ] ?>" id="PurchaseItems<?= $Purchase[ Purchase::TABLE_ID ] ?>">

                                    <?php foreach( $Purchase[ 'items' ] as $Item ){ ?>

                                        <div class="pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                                            Se entregaron <?php echo Core::InsertElement( 'text', 'item_quantity_' . $Items, $Item[ 'quantity' ], ' PurchaseItem txC', 'item="' . $Items . '" product="' . $Item[ 'product_id' ] . '" purchase="' . $Item[ 'purchase_id' ] . '" validateEmpty="Ingrese un número" validateOnlyNumbers="Ingrese números únicamente" validateMaxValue="' . $Item[ 'quantity' ] . '///La cantidad máxima de productos no puede superar ' . $Item[ 'quantity' ] . '"' ); ?> unidades de <strong id="item_product_name_<?php echo $Items ?>"><?php echo $Item[ 'product' ] ?></strong>

                                            <?php echo Core::InsertElement( 'hidden', 'item_original_quantity_' . $Items, $Item[ 'quantity' ] ); ?>
                                            <?php echo Core::InsertElement( 'hidden', 'item_id_' . $Items, $Item[ 'item_id' ] ); ?>

                                        </div>

                                    <?php $Items++;} ?>

                                    <?php echo Core::InsertElement( 'hidden', 'items', $Items ); ?>

                                </div>

                            </div>

                        </div>

                        <div class="col-xs-12 col-sm-6">

                            <div class="innerContainer pad0">

                                <div class="txC bg-warning" purchase="<?= $Purchase[ Purchase::TABLE_ID ] ?>">

                                    <h3 class="mar0 pad10">Productos Sin Entregar a <?php echo $Purchase[ 'address' ] ?></h3>

                                </div>

                                <div  id="UndeliveredItems<?= $Purchase[ Purchase::TABLE_ID ] ?>">

                                    <!-- <div class="txC pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);"> -->

                                      <!-- No se entregaron <span id="<?php echo 'item_udelivered_' . $Items ?>" ><?php echo $Item[ 'quantity' ] ?></span> unidades de <strong><?php echo $Item[ 'product' ] ?></strong></div> -->

                                    <!-- </div> -->

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <?php $ItemClass = 'Hidden'; } ?>

            </div>

        </div>

    </div>

</div>

<div class="box box-default">

    <div class="box-body">

        <!-- Totals -->
        <div class="row">

            <div class="col-xs-12 col-sm-4">

                <div class="innerContainer pad0">

                    <div class="txC bg-navy">

                        <h3 class="mar0 pad10">Productos del Reparto</h3>

                    </div>

                    <div class="PurchaseItems">

                        <?php foreach( $DeliveryItems as $Item ){ ?>

                            <div class="pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                                <span><?php echo $Item[ 'quantity' ] ?></span> unidades de <strong><?php echo $Item[ 'product' ] ?></strong>

                            </div>

                        <?php } ?>

                    </div>

                </div>

            </div>

            <div class="col-xs-12 col-sm-4">

                <div class="innerContainer pad0">

                    <div class="txC bg-aqua">

                        <h3 class="mar0 pad10">Total Entregado del Reparto</h3>

                    </div>



                      <div class="PurchaseItems" id="ItemTotal">

                          <?php foreach( $DeliveryItems as $Item ){ ?>

                              <div class="pad10" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                                  <span id="item_total_<?php echo $Item[ 'product_id' ] ?>" class="text-green"><?php echo $Item[ 'quantity' ] ?></span> unidades de <strong><?php echo $Item[ 'product' ] ?></strong>

                              </div>

                          <?php } ?>

                      </div>

                </div>

            </div>

            <div class="col-xs-12 col-sm-4">

                <div class="innerContainer pad0">

                    <div class="txC bg-brown">

                        <h3 class="mar0 pad10">Total Sin Entregar del Reparto</h3>

                    </div>

                    <div id="UndeliveredTotalItems">

                        <?php foreach( $DeliveryItems as $Item ){ ?>

                            <div class="txC pad10 Hidden" style="border-top:1px solid rgba(228, 228, 228, 0.8);">

                                No se entregaron <span id="<?php echo 'item_total_undelivered_' . $Item[ 'product_id' ] ?>" class="text-red">0</span> unidades de <strong><?php echo $Item[ 'product' ] ?></strong>

                            </div>

                        <?php } ?>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="row txC pad10">

        <button type="button" class="btn btn-error btnRed" id="BtnCancel"><i class="fa fa-times"></i> Cancelar</button>

        <button type="button" class="btn btn-success btnGreen" id="BtnDeliver"><i class="fa fa-check"></i> Confirmar</button>

    </div>

</div>


<?php

    $Foot->SetScript( '../../../../vendors/datepicker/bootstrap-datepicker.js');

    include( '../../../project/resources/includes/inc.bottom.php');

?>
