<?php

// Main Include
include( '../../../core/resources/includes/inc.core.php' );

// Delivery Data

$ID = $_GET[ 'id' ];

$Edit = new Delivery( $ID );

$Delivery = $Edit->GetData();

Core::ValidateID( $Delivery[ Delivery::TABLE_ID ] );

// Purchases Data

$Purchases = Core::Select( 'delivery_order_item a INNER JOIN ' . Purchase::TABLE . ' b ON ( b.purchase_id = a.purchase_id ) INNER JOIN company c ON ( c.company_id = b.company_id ) INNER JOIN company_branch d ON ( d.branch_id = b.branch_id )', 'DISTINCT a.purchase_id, a.position, b.additional_information, b.extra, c.name, d.address  ', Delivery::TABLE_ID . ' = ' . $Delivery[ Delivery::TABLE_ID ], 'a.position' );

$Items = Core::Select( 'delivery_order_item a INNER JOIN ' . PurchaseItem::TABLE . ' b ON ( b.item_id = a.purchase_item_id ) INNER JOIN ' . Product::TABLE . ' c ON ( c.product_id = a.product_id ) ', ' a.*, c.title', Delivery::TABLE_ID . ' = ' . $Delivery[ Delivery::TABLE_ID ], 'a.position' );

/////////////////////////////////////////////////////////////////////////////////////////////////

// Include the main TCPDF library (search for installation path).
require_once( '../../../../vendors/tcpdf/tcpdf.php' );

// create new PDF document
$pdf = new TCPDF( PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false );

// set document information
$pdf->SetCreator( 'RolPel S.R.L.' );
$pdf->SetAuthor( 'RolPel S.R.L.' );
$pdf->SetTitle( 'Reparto Nº' . $ID . ' • RolPel' );
$pdf->SetSubject( 'Reparto RolPel' );
$pdf->SetKeywords( 'RolPel, PDF, reparto, orden, cartón');

// set default header data
$pdf->SetHeaderData( '', 50, 'Reparto Nº' . $ID, 'Camión: ' . $Delivery[ 'truck' ][ 'code' ] .  ' - Fecha: ' . Core::FromDBToDate( $Delivery[ 'delivery_date' ] ) . ' (' . Core::DateTimeFormat( $Delivery[ 'delivery_date' ], 'weekday' ) . ')', array(0,64,255), array(0,64,128) );
$pdf->setFooterData( array( 0, 64, 0 ), array( 0, 64, 128 ) );

// set header and footer fonts
$pdf->setHeaderFont( Array( PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN ) );
$pdf->setFooterFont( Array( PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA ) );

// set default monospaced font
$pdf->SetDefaultMonospacedFont( PDF_FONT_MONOSPACED );

// set margins
$pdf->SetMargins( PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT );
$pdf->SetHeaderMargin( PDF_MARGIN_HEADER );
$pdf->SetFooterMargin( PDF_MARGIN_FOOTER );

// set auto page breaks
$pdf->SetAutoPageBreak( TRUE, PDF_MARGIN_BOTTOM );

// set image scale factor
$pdf->setImageScale( PDF_IMAGE_SCALE_RATIO );

// set some language-dependent strings (optional)
// if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
// 	require_once(dirname(__FILE__).'/lang/eng.php');
// 	$pdf->setLanguageArray($l);
// }

// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting( true );

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont( 'dejavusans', '', 11, '', true );

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow( array( 'enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array( 196, 196, 196 ), 'opacity' => 1, 'blend_mode' => 'Normal' ) );

// Creating Delivery HTML

$HTML = '<div>&nbsp;</div>';

$HTML .= '<h3 style="text-align:center;">RECORRIDO</h3>';

$HTML .= '<table width="100%" border="1">
              <tr style="line-height:50px;font-weight:bold;">

                  <td align="center">ORDEN</td>
                  <td align="center">CLIENTE</td>
                  <td align="center">DIRECCIÓN</td>

              </tr>';


foreach( $Purchases as $Purchase )
{

    $HTML .= '<tr style="line-height:20px;">
                  <td align="center" style="">' . $Purchase[ 'position' ] . '</td>
                  <td align="center" style="font-style:italic;">' . $Purchase[ 'name' ] . '</td>
                  <td align="center" style="color:green;font-weight:bold;">' . $Purchase[ 'address' ] . '</td>
              </tr>';

}

$HTML .= '</table>';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell( 0, 0, '', '', $HTML, 0, 1, 0, true, '', true );

// ---------------------------------------------------------

$BgColor = 'EEE';

// Add a page
// This method has several options, check the source code documentation for more information.
// $pdf->AddPage();

// set text shadow effect
$pdf->setTextShadow( array( 'enabled' => true, 'depth_w' => 0.2, 'depth_h' => 0.2, 'color' => array( 196, 196, 196 ), 'opacity' => 1, 'blend_mode' => 'Normal' ) );

// Creating Delivery HTML

$HTML = '<div>&nbsp;</div>';
$HTML .= '<h3 style="text-align:center;">TOTAL A CARGAR</h3>';

$HTML .= '<table width="100%" border="1">
              <tr style="line-height:30px;font-weight:bold;">

                  <td align="center">PRODUCTO</td>
                  <td align="center">CANTIDAD</td>

              </tr>';
$TotalItems = [];

foreach( $Items as $Item )
{

    if( $TotalItems[ $Item[ 'title' ] ] )
    {

        $TotalItems[ $Item[ 'title' ] ] += $Item[ 'quantity' ];

    }else{

        $TotalItems[ $Item[ 'title' ] ] = $Item[ 'quantity' ];

    }

}

foreach( $TotalItems as $Key => $Value)
{

    $HTML .= '<tr style="line-height:20px;">
                  <td align="center" style="font-style:italic;">' . $Key . '</td>
                  <td align="center" style="">' . $Value . '</td>
              </tr>';

}

$HTML .= '</table>';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell( 0, 0, '', '', $HTML, 0, 1, 0, true, '', true );

// ---------------------------------------------------------

foreach( $Purchases as $Purchase )
{

    // $pdf->AddPage();



    $HTML = '';
    $HTML .= '<div>&nbsp;</div>';
    $HTML .= '<h3 style="text-align:center;color:green">' . $Purchase[ 'position' ] . ' - ' . $Purchase[ 'name' ] . ' ';
    // $HTML .= '<div align="center"><img style="width:50px;height:50px;" src="' . Purchase::DEFAULT_IMG . '"></div>';
    $HTML .= '(' . $Purchase[ 'address' ] . ')</h3>';
    $HTML .= '<div>&nbsp;</div>';

    $HTML .= '<table width="100%" border="1">
                  <tr style="line-height:30px;font-weight:bold;">

                      <td align="center">PRODUCTO</td>
                      <td align="center">CANTIDAD</td>

                  </tr>';

    foreach( $Items as $Item )
    {

        if( $Item[ Purchase::TABLE_ID ] == $Purchase[ Purchase::TABLE_ID ] )
        {

          $HTML .= '<tr style="line-height:20px;">

                        <td align="center" style="font-style:italic;">' . $Item[ 'title' ] . '</td>
                        <td align="center" style="">' . $Item[ 'quantity' ] . '</td>

                    </tr>';

        }

    }

    $HTML .= '</table>';

    // if( $Purchase[ 'additional_information' ] )
    // {
    //
    //     $HTML .= '<div>&nbsp;</div>';
    //
    //     $HTML .= '<hr><h3 align="center">Detalles de ' . $Purchase[ 'name' ] . '</h3><hr>';
    //
    //     $HTML .= '<div>&nbsp;</div>';
    //
    //     $HTML .= '<div>' . $Purchase[ 'additional_information' ] . '</div>';
    //
    // }

    if( $Purchase[ 'extra' ] )
    {

        $HTML .= '<div>&nbsp;</div>';

        $HTML .= '<hr><h3 align="center">Información para el cliente ' . $Purchase[ 'name' ] . '</h3><hr>';

        $HTML .= '<div style="color:purple">' . $Purchase[ 'extra' ] . '</div>';

    }

    // Print text using writeHTMLCell()
    $pdf->writeHTMLCell( 0, 0, '', '', $HTML, 0, 1, 0, true, '', true );

}

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output( 'reparto_001.pdf', 'I' );
