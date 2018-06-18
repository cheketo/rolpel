<?php
  include('../../../core/resources/includes/inc.core.php');
  $List = new Truck();

  $Head->SetTitle("Camiones");
  $Head->SetIcon($Menu->GetHTMLicon());
  $Head->SetSubTitle("Listado de Camiones");
  $Head->setHead();

  /* Header */
  include('../../../project/resources/includes/inc.top.php');

  /* Body Content */
  // Search List Box
  $List->ConfigureSearchRequest();
  echo $List->InsertSearchList();

  /* Footer */
  $Foot->SetScript('../../../core/resources/js/script.core.searchlist.js');
  include('../../../project/resources/includes/inc.bottom.php');
?>
