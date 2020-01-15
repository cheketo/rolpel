<?php

    /****************************************\
    |                 DATABSE                |
    \****************************************/

    $DB_CONFIG[ 'type' ]     = 'Mysql';

    $DB_CONFIG[ 'name' ]     = 'rolpel';

    // $DB_CONFIG[ 'user' ]     = 'root';
    // Test comment
    // $DB_CONFIG[ 'password' ] = 'mysql';

    $DB_CONFIG[ 'user' ]     = 'homestead';

    $DB_CONFIG[ 'password' ] = 'secret';

    $DB_CONFIG[ 'host' ]     = 'localhost';

    $DB_CONFIG[ 'port' ]     = '';

    $DB_CONFIG[ 'schema' ]   = '';

    /****************************************\
    |                 SESSION                |
    \****************************************/

    $SESSION_CONFIG[ 'name' ] = 'rolpel';

    $SESSION_CONFIG[ 'time' ] = 15800;

    /****************************************\
    |               CONSTANTS                |
    \****************************************/

    define( 'PROCESS', '../../../core/resources/processes/proc.core.php' );

?>
