<?php
  include('../../../core/resources/includes/inc.core.php');
  $List = new Purchase();
  $Head->SetTitle($Menu->GetTitle());
  $Head->SetIcon($Menu->GetHTMLicon());
  $Head->SetSubTitle('Ordenes de Compra');
  $Head->setHead();
  include('../../../project/resources/includes/inc.top.php');

  /* Body Content */
  // Search List Box
  echo $List->InsertSearchList();

  /* Footer */
  $Foot->SetScript('../../../core/resources/js/script.core.searchlist.js');
  include('../../../project/resources/includes/inc.bottom.php');
?>
