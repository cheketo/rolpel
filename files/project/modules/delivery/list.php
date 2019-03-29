<?php

    include( '../../../core/resources/includes/inc.core.php' );

    $List = new Delivery();

    $Head->SetTitle( $Menu->GetTitle() );

    $Head->SetIcon( $Menu->GetHTMLicon() );

    $Head->SetSubTitle( 'Repartos' );

    $Head->SetStyle( '../../../../vendors/datepicker/datepicker3.css' ); // Date Picker Calendar

    $Head->setHead();

    include( '../../../project/resources/includes/inc.top.php' );

    /* Body Content */

    // Search List Box
    echo $List->InsertSearchList();

    /* Footer */
    $Foot->SetScript( '../../../core/resources/js/script.core.searchlist.js' );

    $Foot->SetScript( '../../../../vendors/datepicker/bootstrap-datepicker.js' );

    include( '../../../project/resources/includes/inc.bottom.php' );

?>
