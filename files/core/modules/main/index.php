<?php

// Core::
//
// if( Core::Select( Purchase::TABLE. 'COUNT(*) as total', 'purchase_id = ' . $PurchaseItem[ 'purchase_id' ] )[ 0 ][ 'total' ] == Core::Select( Purchase::TABLE. 'COUNT(*) as total', "status = 'F' purchase_id = " . $PurchaseItem[ 'purchase_id' ] )[ 0 ][ 'total' ] )
// {
//
//     Core::Update( Purchase::TABLE, "status = 'F'", 'purchase_id = ' . $PurchaseItem[ 'purchase_id' ] );
//
// }

header('Location: main.php');

?>
