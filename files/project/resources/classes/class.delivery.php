<?php

class Delivery
{

	use CoreSearchList, CoreCrud, CoreImage;

	const TABLE						= 'delivery';
	const TABLE_ID				= 'delivery_id';
	const SEARCH_TABLE		= 'delivery';
	const DEFAULT_IMG			= '../../../../skin/images/deliverys/default/default.png';
	const DEFAULT_IMG_DIR	= '../../../../skin/images/deliverys/default/';
	const IMG_DIR			= '../../../../skin/images/deliverys/';

	public function __construct( $ID = 0 )
	{

			$this->ID = $ID;

			if( $this->ID != 0 )
			{

					$Data = Core::Select( self::SEARCH_TABLE, '*', self::TABLE_ID . "=" . $this->ID, self::TABLE_ID );

					$this->Data = $Data[ 0 ];

					$this->GetTruck();

			}

	}

	public function GetTruck()
	{

			$Truck = Core::Select( Truck::SEARCH_TABLE, '*', Truck::TABLE_ID . "=" . $this->Data[ Truck::TABLE_ID ] );

			$this->Data[ 'truck' ] = $Truck[ 0 ];

	}

	public function GetOrders()
	{

			$this->Data[ 'orders' ] = Core::Select( DeliveryOrder::SEARCH_TABLE, '*', self::TABLE_ID . "=" . $this->ID, DeliveryOrder::TABLE_ID );

	}

	public function GetOrderItems()
	{

			if( !$this->Data[ 'orders' ] )
			{

					$this->GetOrders();

			}

			for( $X = 0; count( $this->Data[ 'orders' ] ) < $X; $X++ )
			{

					$this->Data[ 'orders' ][ $X ][ 'items' ] = Core::Select( DeliveryOrderItem::SEARCH_TABLE, '*', DeliveryOrder::TABLE_ID . "=" . $this->Data[ 'orders' ][ $X ][ DeliveryOrder::TABLE_ID ], DeliveryOrderItem::TABLE_ID );

			}

	}

	public function GetPurchases()
	{

			if( !$this->Data[ 'orders' ] )
			{

					$this->GetOrders();

			}

			for( $X = 0; count( $this->Data[ 'orders' ] ) < $X; $X++ )
			{

					$Purchase = Core::Select( Purchase::SEARCH_TABLE, '*', Purchase::TABLE_ID . "=" . $this->Data[ 'orders' ][ $X ][ Purchase::TABLE_ID ], Purchase::TABLE_ID );

					$this->Data[ 'orders' ][ $X ][ 'purchase' ] = $Purchase[ 0 ];

			}

	}

	public function GetPurchaseItems()
	{

			if( !$this->Data[ 'orders' ] )
			{

					$this->GetOrders();

			}

			for( $X = 0; count( $this->Data[ 'orders' ] ) < $X; $X++ )
			{

					$PurchaseItems = Core::Select( Purchase::SEARCH_TABLE, '*', Purchase::TABLE_ID . "=" . $this->Data[ 'orders' ][ $X ][ Purchase::TABLE_ID ], Purchase::TABLE_ID );

					if( $this->Data[ 'orders' ][ $X ][ 'purchase' ] )
					{

							$this->Data[ 'orders' ][ $X ][ 'purchase' ] = $PurchaseItems[ 0 ];

					}

					$this->Data[ 'orders' ][ $X ][ 'purchase' ][ 'items' ] = $PurchaseItems;

					for( $I = 0; count( $this->Data[ 'orders' ][ $X ][ 'items' ] ) < $I; $I++ )
					{

							for( $Z = 0; count( $this->Data[ 'orders' ][ $X ][ 'purchase' ][ 'items' ] ) < $Z; $Z++ )
							{

									if( $this->Data[ 'orders' ][ $X ][ 'items' ][ $I ][ 'purchase_item_id' ] == $this->Data[ 'orders' ][ $X ][ 'purchase' ][ 'items' ][ $Z ][ 'item_id' ] )
									{

											$this->Data[ 'orders' ][ $X ][ 'items' ][ $I ][ 'product' ] = $this->Data[ 'orders' ][ $X ][ 'purchase' ][ 'items' ][ $Z ][ 'product' ];

									}

							}

					}

			}

	}

	public function GetStatus()
	{

			switch( strtoupper( $this->Data[ 'status' ] ) )
			{

					case 'P':

							$Status = 'Pendiente';

					break;

					case 'A':

							$Status = 'En Proceso';

					break;

					case 'I':

							$Status = 'Eliminado';

					break;

					case 'F':

							$Status = 'Finalizado';

					break;

			}

			return $Status;

	}

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////// SEARCHLIST FUNCTIONS ///////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	protected static function MakeActionButtonsHTML( $Object ,$Mode = 'list' )
	{

			if( $Mode != 'grid' )
		 	{

					$HTML .=	'<a class="hint--bottom hint--bounce" aria-label="M&aacute;s informaci&oacute;n"><button type="button" class="btn bg-navy ExpandButton" id="expand_' . $Object->ID . '"><i class="fa fa-plus"></i></button></a> ';;

			}

			if ( $Object->Data[ 'status' ] != 'I' )
			{

					//$HTML	.= '<a class="hint--bottom hint--bounce" aria-label="Ver Detalle" href="view.php?id=' . $Object->ID . '" id="delivery_' . $Object->ID . '"><button type="button" class="btn btn-github"><i class="fa fa-eye"></i></button></a> ';

					if( $Object->Data[ 'status' ] != 'F' )
					{

							if( $Object->Data[ 'status' ] == 'P' )
							{

									$HTML	.= '<a class="hint--bottom hint--bounce hint--warning deliveryOrder" aria-label="Empezar a Reparto" process="' . PROCESS. '" id="delivery_' . $Object->ID . '" ><button type="button" class="btn bg-brown"><i class="fa fa-truck"></i></button></a> ';

									$HTML	.= '<a class="hint--bottom hint--bounce hint--info orders" aria-label="Asignar Ordenes de Compra" href="orders.php?id=' . $Object->ID . '" process="' . PROCESS. '" id="orders_' . $Object->ID . '" ><button type="button" class="btn btn-primary"><i class="fa fa-dropbox"></i></button></a> ';

							}

							$HTML	.= '<a href="edit.php?id=' . $Object->ID . '" class="hint--bottom hint--bounce hint--info" aria-label="Editar"><button type="button" class="btn btnBlue"><i class="fa fa-pencil"></i></button></a>';

							$HTML	.= '<a class="deleteElement hint--bottom hint--bounce hint--error" aria-label="Eliminar" process="' . PROCESS . '" id="delete_' . $Object->ID . '"><button type="button" class="btn btnRed"><i class="fa fa-trash"></i></button></a>';

							$HTML	.= Core::InsertElement( 'hidden', 'delete_question_' . $Object->ID, '&iquest;Desea eliminar el reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b>?' );

							$HTML	.= Core::InsertElement( 'hidden', 'delete_text_ok_' . $Object->ID, 'El reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b> ha sido eliminado.' );

							$HTML	.= Core::InsertElement( 'hidden', 'delete_text_error_' . $Object->ID, 'Hubo un error al intentar eliminar el reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b>.' );

					}

			}else{

					$HTML	.= '<a class="activateElement hint--bottom hint--bounce hint--success" aria-label="Activar" process="' . PROCESS . '" id="activate_' . $Object->ID . '"><button type="button" class="btn btnGreen"><i class="fa fa-check-circle"></i></button></a>';

					$HTML	.= Core::InsertElement( 'hidden', 'activate_question_' . $Object->ID, '&iquest;Desea activar el reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b>?' );

					$HTML	.= Core::InsertElement( 'hidden', 'activate_text_ok_' . $Object->ID, 'El reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b> ha sido activado.' );

					$HTML	.= Core::InsertElement( 'hidden', 'activate_text_error_' . $Object->ID, 'Hubo un error al intentar activar el reparto del cami&oacute;n <b>' . $Object->Data[ 'truck' ][ 'code' ] . '</b> para el d&iacute;a <b>' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '</b>.' );

			}

			return $HTML;

	}

	protected static function MakeListHTML( $Object )
	{

			if( $Object->Data[ 'start_date' ] )
			{

					$StartDate = Core::FromDBToDate( $Object->Data[ 'start_date' ] );

			}else{


					$StartDate = 'Pendiente';

			}

			if( $Object->Data[ 'end_date' ] )
			{

					$EndDate = Core::FromDBToDate( $Object->Data[ 'end_date' ] );

			}else{


					$EndDate = 'Pendiente';

			}

			$HTML = '<div class="col-lg-3 col-md-5 col-sm-5 col-xs-3">
								<div class="listRowInner">
									<img class="img-circle hideMobile990" src="' . self::DEFAULT_IMG . '" alt="' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] ) . '">
									<span class="listTextStrong">' . Core::DateTimeFormat( $Object->Data[ 'delivery_date' ], 'weekday' ) . ' ' . Core::FromDBToDate( $Object->Data[ 'delivery_date' ] )  . '</span>
									<span class="listTextStrong"><span class="label label-primary">' . $Object->Data[ 'truck' ][ 'code' ] . '</span></span>
									<span class="smallTitle"><b>(ID: ' . $Object->Data[ 'delivery_id' ] . ')</b></span>
								</div>
							</div>
							<div class="col-lg-3 col-md-2 col-sm-2 col-xs-3">
								<div class="listRowInner">
									<span class="smallTitle">Estado</span>
									<span class="listTextStrong">
										<span class="label label-success">' . $Object->GetStatus() . '</span>
									</span>
								</div>
							</div>
							<div class="col-lg-1 col-md-2 col-sm-3 col-xs-3">
								<div class="listRowInner">
									<span class="smallTitle">Salida</span>
									<span class="listTextStrong"><span class="label label-info">
										' . $StartDate . '
									</span></span>
								</div>
							</div>
							<div class="col-lg-1 col-md-2 col-sm-3 col-xs-3">
								<div class="listRowInner">
									<span class="smallTitle">Llegada</span>
									<span class="listTextStrong"><span class="label label-info">
										' . $EndDate . '
									</span></span>
								</div>
							</div>
							<div class="col-lg-1 col-md-1 col-sm-1 hideMobile990"></div>';

			return $HTML;

	}

	protected static function MakeItemsListHTML( $Object )
	{

			// $Object->GetOrderItems();
			// $Object->GetPurchaseItems();

			$Purchases = Core::Select( 'delivery_order_item a INNER JOIN ' . Purchase::TABLE . ' b ON ( b.purchase_id = a.purchase_id ) INNER JOIN company c ON ( c.company_id = b.company_id ) INNER JOIN company_branch d ON ( d.branch_id = b.branch_id )', 'DISTINCT a.purchase_id, a.position, c.name, d.address  ', self::TABLE_ID . ' = ' . $Object->Data[ self::TABLE_ID ], 'a.position' );
			$Items = Core::Select( 'delivery_order_item a INNER JOIN ' . PurchaseItem::TABLE . ' b ON ( b.item_id = a.purchase_item_id ) INNER JOIN ' . Product::TABLE . ' c ON ( c.product_id = a.product_id ) ', ' a.*, c.title', self::TABLE_ID . ' = ' . $Object->Data[ self::TABLE_ID ], 'a.position' );

			foreach( $Purchases as $Purchase )
			{

					$Products = '';

					foreach( $Items as $Item )
					{

							if( $Item[ Purchase::TABLE_ID ] == $Purchase[ Purchase::TABLE_ID ] )
							{

									$Products .= '<span class="listTextStrong">' . $Item[ 'title' ] . ' - ' . $Item[ 'quantity' ] . '</span>';

							}

					}

					$RowClass = $RowClass != 'bg-gray'? 'bg-gray' : 'bg-gray-active';

					$HTML .= '
								<div class="row ' . $RowClass . '" style="padding:5px;">
									<div class="col-lg-4 col-sm-5 col-xs-12">
										<div class="listRowInner txL">
											<img class=" hideMobile990" src="' . Purchase::DEFAULT_IMG . '" alt="' . $Purchase[ Purchase::TABLE_ID ] . '">
											<span class="listTextStrong">' . $Purchase[ 'position' ] . '. ' . $Purchase[ 'name' ] . ' - ' . $Purchase[ 'address' ] . '</span>
										</div>
									</div>
									<div class="col-lg-7 col-sm-2 col-xs-12">
										<div class="listRowInner">
											<span class="smallTitle">Productos</span>
											' . $Products . '
										</div>
									</div>

								</div>';
			}

			$RowClass = $RowClass != 'bg-gray'? 'bg-gray' : 'bg-gray-active';

			$Products = '';

			$Items = Core::Select( 'delivery_order_item a INNER JOIN ' . PurchaseItem::TABLE . ' b ON ( b.item_id = a.purchase_item_id ) INNER JOIN ' . Product::TABLE . ' c ON ( c.product_id = a.product_id ) ', ' SUM( a.quantity ) as quantity, c.title', self::TABLE_ID . ' = ' . $Object->Data[ self::TABLE_ID ], 'c.title', 'c.title');

			foreach( $Items as $Item )
			{

					$Products .= '<div class="listTextStrong"><i class="fa fa-cube"></i> <span class="label label-warning">' . $Item[ 'title' ] . '</span> => <span class="label label-primary">' . $Item[ 'quantity' ] . '</span></div>';

			}

			$HTML .= '
						<div class="row ' . $RowClass . '" style="padding:5px;">
							<div class="col-xs-12">
								<div class="listRowInner">
										<div class="txC" style="padding-top:1em;font-size:24px;">
	                        <strong><i class="fa fa-cubes"></i> Total a Cargar</strong>
	                  </div>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="listRowInner txL">
									' . $Products . '
								</div>
							</div>

						</div>';

			return $HTML;

	}

	public static function MakeNoRegsHTML()
	{

		return '<div class="callout callout-info"><h4><i class="icon fa fa-info-circle"></i> No se encontraron reparto.</h4><p>Puede crear uno nuevo haciendo click <a href="new.php">aqui</a>.</p></div>';

	}

	protected function SetSearchFields()
	{

			$this->SearchFields[ 'delivery_id' ] = Core::InsertElement( 'text', 'delivery_id', '', 'form-control', 'placeholder="C&oacute;digo Reparto"' );

			$this->SearchFields[ 'title' ] = Core::InsertElement( 'text', 'title', '', 'form-control', 'placeholder="Producto"' );

			$this->SearchFields[ 'quantity' ] = Core::InsertElement( 'text', 'quantity', '', 'form-control', 'placeholder="Cantidad"' );

	}

	protected function InsertSearchButtons()
	{

			return '<a href="new.php?customer=Y" class="hint--bottom hint--bounce hint--info" aria-label="Nueva Orden de Compra de Cliente"><button type="button" class="NewElementButton btn btn-primary animated fadeIn"><i class="fa fa-plus-square"></i></button></a>';

	}

	public function ConfigureSearchRequest()
	{

			$_POST[ 'view_order_mode' ] = $_POST[ 'view_order_mode' ]? $_POST[ 'view_order_mode' ] : 'DESC';

			$_POST[ 'view_order_field' ] = $_POST[ 'view_order_field' ]? $_POST[ 'view_order_field' ] : 'delivery_id';

			$this->SetSearchRequest();

	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// PROCESS METHODS ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function Insert()
	{

			// Basic Data
			$TruckID			= $_POST[ 'truck' ];

			$DeliveryDate = Core::FromDateToDB( $_POST[ 'delivery_date' ] );

			// Saving Data

			$NewID				= Core::Insert(

													self::TABLE,

													Truck::TABLE_ID . ',delivery_date, status, creation_date, created_by,' . CoreOrganization::TABLE_ID,

													$TruckID . ",'" . $DeliveryDate . "', 'P', NOW()," . $_SESSION[ CoreUser::TABLE_ID ] . "," . $_SESSION[ 'organization_id' ]

											);

	}

	public function Associate()
	{

			// Basic Data

			$DeliveryID			= $_POST[ 'delivery' ];

			$Items = array();

			foreach( $_POST as $Key => $Value)
			{

					$IDs = explode( '_', $Key );

					if( $IDs[ 0 ] == 'quantity' && $IDs[ 1 ] && $IDs[ 2 ] )
					{

							$PurchaseID = $IDs[ 1 ];

							$ItemID = $IDs[ 2 ];

							$Items[] = [ 'purchase_id' => $PurchaseID, 'item_id' => $ItemID, 'quantity' => $Value, 'position' => $_POST[ 'position_' . $PurchaseID . '_' . $ItemID ], 'product' => $_POST[ 'product_' . $PurchaseID . '_' . $ItemID ] ];

					}

			}

			// Saving & Updating Data

			$DeprecatedItems = Core::Select( 'delivery_order_item', '*', 'delivery_id =' . $DeliveryID );

			foreach( $Items as $Key => $Item )
			{

					$DeprecatedItem = null;

					foreach( $DeprecatedItems as $Key => $Deprecated )
					{

							if( $Deprecated[ 'purchase_item_id' ] == $Item[ 'item_id' ] )
							{

										$DeprecatedItem = $Deprecated;

										if( $Item[ 'quantity' ] > 0 )
										{

												$DeprecatedItems[ $Key ][ 'must_remain' ] = true;

										}

										break;

							}

					}

					// $PurchaseItem = Core::Select( 'purchase_item', '*', 'item_id =' . $Item[ 'item_id' ] )[0];

					if( $DeprecatedItem )
					{

							Core::Update( 'delivery_order_item', 'quantity = ' . $Item[ 'quantity' ] . ', position = ' . $Item[ 'position' ] . ', updated_by = ' . $_SESSION[ CoreUser::TABLE_ID ], 'item_id = ' . $DeprecatedItem[ 'item_id' ] );

							$QuantityDifference = abs( $Item[ 'quantity' ] - $DeprecatedItem[ 'quantity' ] );

							if( $DeprecatedItem[ 'quantity' ] < $Item[ 'quantity' ] )
							{

									Core::Update( PurchaseItem::TABLE, 'quantity_reserved = quantity_reserved + ' . $QuantityDifference, 'item_id=' . $Item[ 'item_id' ] );

							}else{

									Core::Update( PurchaseItem::TABLE, 'quantity_reserved = quantity_reserved - ' . $QuantityDifference, 'item_id=' . $Item[ 'item_id' ] );

							}

					}elseif( $Item[ 'quantity' ] > 0 ){

							Core::Insert(

									'delivery_order_item',

									Delivery::TABLE_ID . ',' . Purchase::TABLE_ID . ', purchase_item_id, product_id, position, quantity, creation_date, created_by,' . CoreOrganization::TABLE_ID,

									$DeliveryID . "," . $Item[ 'purchase_id' ] . "," . $Item[ 'item_id' ] . "," . $Item[ 'product' ] . "," . $Item[ 'position' ] . "," . $Item[ 'quantity' ] . ", NOW()," . $_SESSION[ CoreUser::TABLE_ID ] . "," . $_SESSION[ 'organization_id' ]

							);

							Core::Update( PurchaseItem::TABLE, 'quantity_reserved = quantity_reserved + ' . $Item[ 'quantity' ], 'item_id=' . $Item[ 'item_id' ] );

					}

			}

			// Deleting items that no longer are in delivery
			foreach( $DeprecatedItems as $Item)
			{

					if( !$Item[ 'must_remain' ]  )
					{

							// $PurchaseItem = Core::Select( 'purchase_item', '*', 'item_id =' . $Item[ 'item_id' ] )[0];

							Core::Delete( 'delivery_order_item', 'item_id=' . $Item[ 'item_id' ] );

							Core::Update( PurchaseItem::TABLE, 'quantity_reserved = quantity_reserved - ' . $Item[ 'quantity' ], 'item_id=' . $Item[ 'item_id' ] );

					}

			}

	}

	public function Delete()
	{

			$DeliveryID = $_POST[ 'id' ];

			$Delivery = Core::Select( self::TABLE, '*', self::TABLE_ID . ' = ' . $DeliveryID )[0];

			if( $Delivery[ 'status' ] == 'P' )
			{

					Core::Update( PurchaseItem::TABLE . ' a ', 'a.quantity_reserved = a.quantity_reserved - ( SELECT b.quantity FROM delivery_order_item b WHERE b.purchase_item_id = a.item_id AND ' . Delivery::TABLE_ID . ' = ' . $DeliveryID . ' )', 'a.item_id IN ( SELECT c.purchase_item_id FROM delivery_order_item c WHERE c.' . self::TABLE_ID . ' = ' . $DeliveryID . ' )' );

					Core::Delete( 'delivery_order_item', self::TABLE_ID . ' = ' . $DeliveryID );

					Core::Delete( self::TABLE, self::TABLE_ID . ' = ' . $DeliveryID );

			}else{

					if( !$Delivery )
					{

							// echo "El ya reparto no existe.";

					}else{

							echo "No se puede eliminar un reparto que ya ha sido empezado.";

					}

			}

	}



	public function Update()
	{
		$ID 	= $_POST['id'];
		$Edit	= new Purchase($ID);

		// ITEMS DATA
		$Total = 0;
		$Items = array();
		for($I=1;$I<=$_POST['items'];$I++)
		{
			if($_POST['item_'.$I])
			{
				$Price = substr( $_POST[ 'price_' . $I ], 1 );
				$Total += ($Price*$_POST['quantity_'.$I]);
				$ItemDate = Core::FromDateToDB($_POST['date_'.$I]);
				$CreationDate = $_POST['creation_date_'.$I]? "'".$_POST['creation_date_'.$I]."'":'NOW()';

				// $Items[] = array('id'=>$_POST['item_'.$I],'price'=>$_POST['price_'.$I],'quantity'=>$_POST['quantity_'.$I], 'delivery_date'=>$ItemDate,'creation_date'=>$CreationDate,'days'=>$_POST['day_'.$I]);

				$Width = $_POST[ 'sizex_' . $I ] ? $_POST[ 'sizex_' . $I ] : '0.00';
				$Height = $_POST[ 'sizey_' . $I ] ? $_POST[ 'sizey_' . $I ] : '0.00';
				$Depth = $_POST[ 'sizez_' . $I ] ? $_POST[ 'sizez_' . $I ] : '0.00';

				$Items[] = array(
														'id' => $_POST[ 'item_' . $I ],
														'price' => $Price,
														'width' => $Width,
														'height' => $Height,
														'depth' => $Depth,
														'quantity' => $_POST[ 'quantity_' . $I ],
														'delivery_date' => $ItemDate,
														'days' => $_POST[ 'day_' . $I ]
												);

				if(!$DeliveryDate)
				{
					$DeliveryDate = $ItemDate;
				}
				if(strtotime($ItemDate." 00:00:00") > strtotime($DeliveryDate." 00:00:00")){
					$DeliveryDate = $ItemDate;
				}
			}
		}

		// Basic Data
		$CompanyID		= $_POST['company'];

		$BranchID			= $_POST['branch'];

		$AgentID 			= $_POST['agent']? $_POST['agent']: 0;

		$Extra				= $_POST['extra'];

		$Additional		= $_POST[ 'additional_information' ];

		$RealDate 	= Core::FromDateToDB( $_POST[ 'real_date' ] );

		$Field				= $_POST['company_type'].'_id';

		$Update		= Core::Update( self::TABLE, Company::TABLE_ID . "=" . $CompanyID . "," . $Field . "=" . $CompanyID . "," . CompanyBranch::TABLE_ID . "=" . $BranchID . ",agent_id=" . $AgentID . ",purchase_date='" . $RealDate . "',delivery_date='" . $DeliveryDate . "',extra='" . $Extra . "',additional_information='" . $Additional . "',total=" . $Total . ",status='A',updated_by=" . $_SESSION[CoreUser::TABLE_ID],self::TABLE_ID."=".$ID);

		// DELETE OLD ITEMS
		PurchaseItem::DeleteItems( $ID );

		// INSERT ITEMS
		foreach($Items as $Item)
		{
			$Item['days'] = $Item['days']?intval($Item['days']):"0";
			if($Fields)
				$Fields .= "),(";
			$Fields .= $ID.",".$CompanyID.",".$BranchID.",".$Item['id'].",".$Item['price'].",".$Item[ 'width' ] . "," .
			$Item[ 'height' ] . "," .
			$Item[ 'depth' ] . "," .$Item['quantity'].",".($Item['price']*$Item['quantity']).",'".$Item['delivery_date']."',".$Item['days'].",NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID];
		}
		Core::Insert(PurchaseItem::TABLE,self::TABLE_ID.','.Company::TABLE_ID.','.CompanyBranch::TABLE_ID.','.Product::TABLE_ID.',price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,'.CoreOrganization::TABLE_ID,$Fields);

		// INSERT FILES
		self::SaveAndMoveFiles($ID,$_POST['qfilecount']);

		// SEND EMAIL
		self::Sendemail($ID,$_POST['receiver']);
	}

	public function Store()
	{

			$ID	= $_POST['id'];

			$Purchase = new Purchase( $ID );

			$Total = $Purchase->Data[ 'total_purchase' ];

			Core::Update(self::TABLE,"status = 'F'",self::TABLE_ID."=".$ID);

	}

	public function Addnewfile()
	{

		if(count($_FILES['file'])>0)
		{
			$ProductID = $_REQUEST['product']?$_REQUEST['product']:0;
			$FileDir = self::DEFAULT_FILE_DIR."new/";
			$FileName = explode(".",preg_replace('#[^A-Za-z0-9\. -]+#', '',str_replace(' ', '-',$_FILES['file']['name'])));
			$Ext = $FileName[count($FileName)-1];
			unset($FileName[count($FileName)-1]);
			$FileName = implode(".",$FileName);
			$File = new CoreFileData($_FILES['file'],$FileDir,$FileName);
			if($Ext!="jpg" || $Ext!="jpeg" || $Ext!="png" || $Ext!="bmp")
			{
				$File->SaveFile();
				$FileURL = $FileDir.$FileName.".".$File->GetExtension();
			}else{
				$FileURL = $File	-> BuildImage(200,200);
			}

			$FID = Core::Insert('purchase_file_new',"product_id,name,url,creation_date,created_by,organization_id",$ProductID.",'".$FileName."','".$FileURL."',NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID]);
			$File = array("id"=>$FID,"name"=>$FileName,"url"=>$FileURL,"ext"=>$Ext);
			echo json_encode($File,JSON_HEX_QUOT);
		}
	}

	public function Removenewfile()
	{
		$FileID = $_GET['fid'];
		Core::Update('purchase_file_new',"status='I',updated_by=".$_SESSION[CoreUser::TABLE_ID],"file_id=".$FileID);
	}

	public function Newpurchase()
	{
		$ProductID = $_POST['product'];
		$Days = $_POST['tday'];
		$Date = Core::FromDateToDB($_POST['tdate']);
		$Price = $_POST['tprice'];
		$Quantity = $_POST['tquantity'];
		$CompanyID = $_POST['tprovider'];

		$Extra = $_POST['textra'];
		$FilesCount = $_POST['filecount'];
		$IDs = "0";
		$Total = $Price*$Quantity;

		// $International = Core::Select(Company::TABLE,'international',Company::TABLE_ID."=".$CompanyID)[0]['international'];

		$PurchaseID = Core::Insert(self::TABLE,"company_id,sender_id,total,status,purchase_date,extra,creation_date,created_by,organization_id",$CompanyID.",".$CompanyID.",".$Total.",'A','".$Date."','".$Extra."',NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID]);
		$Field = $PurchaseID.",".$CompanyID.",".$ProductID.",".$Price.",".$Quantity.",".$Total.",".$Days.",NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID];
		Core::Insert(PurchaseItem::TABLE,self::TABLE_ID.','.Company::TABLE_ID.','.Product::TABLE_ID.',price,quantity,total,days,creation_date,created_by,'.CoreOrganization::TABLE_ID,$Field);
		for($I=1;$I<=$FilesCount;$I++)
		{

			$FileID = $_POST['fileid_'.$I];
			if($FileID)
			{
				$IDs .= ",".$FileID;
			}
		}
		$Files = Core::Select("purchase_file_new","*","status='A' AND file_id IN (".$IDs.")");
		$FilePath = '../../../../skin/files/purchase/'.$PurchaseID.'/';
		foreach($Files as $File)
		{
			$FileObj = new CoreFileData($File['url']);
			$FileObj->MoveFileTo($FilePath);
			$NewUrl = $FileObj->GetFile();

			$Field = $File['file_id'].",".$PurchaseID.",".$ProductID.",'".$File['name']."','".$NewUrl."',NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID];
			$Fields .= $Fields? "),(".$Field:$Field;
		}
		if($Fields)
			Core::Insert("purchase_file","new_id,purchase_id,product_id,name,url,creation_date,created_by,organization_id",$Fields);
		Core::Delete("purchase_file_new","status='A' AND DATEDIFF(CURDATE(),creation_date)>0");
		echo json_encode(array("id"=>$PurchaseID,"filepath"=>$FilePath),JSON_HEX_QUOT);
	}

	public function Fillproviderpurchases()
	{
		$ProductID = $_POST['product'];
		$Purchases = Core::Select(self::SEARCH_TABLE,"*","receiver_id=0 AND ".Product::TABLE_ID."=".$ProductID,'purchase_date DESC,creation_date DESC,purchase_id DESC');
		foreach($Purchases as $Purchase)
		{
			$FilesHTML = "";
			$Files = Core::Select('purchase_file',"*",self::TABLE_ID."=".$Purchase[self::TABLE_ID]);
			if(count($Files)>0)
			{
				foreach($Files as $File)
				{
					$IconURL = Core::GetFileIcon($File['url']);
					$FilesHTML .= '<div><a href="'.$File['url'].'" target="_blank"><img src="'.$IconURL.'" width="32" height="32"> '.$File['name'].'</a></div>';
				}
			}
			$HTML .= '<tr class="ClearWindow">
										<td>'.Core::FromDBToDate($Purchase['purchase_date']).'</td>
										<td>'.$Purchase['company'].'</td>
										<td><span class="label label-success">$ '.$Purchase['price'].'</span></td>
										<td>'.$Purchase['quantity'].'</td>
										<td>$ '.$Purchase['total_item'].'</td>
										<td>'.$Purchase['days'].' D&iacute;as</td>
										<td>'.$Purchase['extra'].'</td>
										<td>'.$FilesHTML.'</td>
									</tr>';
		}
		echo $HTML;
	}

	public function Fillcustomerpurchases()
	{
		$ProductID = $_POST['product'];
		$CompanyID = $_POST['company'];
		$Purchases = Core::Select(self::SEARCH_TABLE,"*","sender_id=0 AND ".Company::TABLE_ID."=".$CompanyID." AND ".Product::TABLE_ID."=".$ProductID,'purchase_date DESC,creation_date DESC,purchase_id DESC');
		foreach($Purchases as $Purchase)
		{
			$HTML .= '<tr class="ClearWindow">
						<td><span class="label label-default">'.Core::FromDBToDate($Purchase['purchase_date']).'</span></td>
										<td><span class="label label-success">$ '.$Purchase['price'].'</span></td>
										<td>'.$Purchase['quantity'].'</td>
										<td><span class="label label-success">$ '.$Purchase['total_item'].'</span></td>
										<td><span class="label label-warning">'.$Purchase['days'].' D&iacute;as</span></td>
										<td>
											<button type="button" class="btn btn-github SeePurchase hint--bottom hint--bounce" aria-label="Ver Orden de Compra" style="margin:0px;" item="'.$Purchase[self::TABLE_ID].'"><i class="fa fa-eye"></i></button>
										</td>
									</tr>';
		}
		echo $HTML;
	}

	public function Additem()
	{

		$ID = $_POST['item'];
		$HistoryButton = '<button type="button" id="HistoryItem'.$ID.'" class="btn btn-github HistoryItem hint--bottom hint--bounce Hidden" aria-label="Trazabilidad" style="margin:0px;" item="'.$ID.'"><i class="fa fa-book"></i></button>';
		$TotalPrice = "$ 0.00";
		if($ID % 2 != 0)
			$BgClass = "bg-gray";
		else
			$BgClass = "bg-gray-active";
		$HTML = '
			<div id="item_row_'.$ID.'" item="'.$ID.'" class="row form-group inline-form-custom ItemRow '.$BgClass.'" style="margin-bottom:0px!important;padding:10px 0px!important;">
								<form id="item_form_'.$ID.'">
								<div class="col-xs-4 txC">
									<span id="Item'.$ID.'" class="Hidden ItemText'.$ID.'"></span>
									'.Core::InsertElement("autocomplete","item_".$ID,'','ItemField'.$ID.' itemSelect txC form-control','item="'.$ID.'" validateEmpty="Seleccione un Art&iacute;culo" placeholder="Ingrese un c&oacute;digo" placeholderauto="C&oacute;digo no encontrado" iconauto="cube"','Product','SearchCodes').'
									<div class="row">

											<div class="col-xs-12 col-sm-4">

													'.Core::InsertElement('text','sizex_'.$ID,'','ItemField'.$ID.' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Ancho" disabled="disabled"').'

											</div>

											<div class="col-xs-12 col-sm-4">

													'.Core::InsertElement('text','sizey_'.$ID,'','ItemField'.$ID.' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Alto"  disabled="disabled"').'

											</div>

											<div class="col-xs-12 col-sm-4">

												'.Core::InsertElement('text','sizez_'.$ID,'','ItemField'.$ID.' form-control txC inputMask smallFont DecimalMask','data-inputmask="\'mask\': \'9{+}[.9{+}]\'" placeholder="Profundidad" disabled="disabled"').'

											</div>

									</div>
								</div>
								<div class="col-xs-1 txC">
									<span id="Price'.$ID.'" class="Hidden ItemText'.$ID.'"></span>
									'.Core::InsertElement('text','price_'.$ID,'','ItemField'.$ID.' form-control txC calcable inputMask DecimalMask smallFont','disabled="disabled" data-inputmask="\'mask\': \'$9{+}[.9{+}]\'" placeholder="Precio" validateEmpty="Ingrese un precio"').'
								</div>
								<div class="col-xs-1 txC">
									<span id="Quantity'.$ID.'" class="Hidden ItemText'.$ID.'"></span>
									'.Core::InsertElement('text','quantity_'.$ID,'','ItemField'.$ID.' form-control txC calcable QuantityItem inputMask smallFont','disabled="disabled" data-inputmask="\'mask\': \'9{+}\'" placeholder="Cantidad" validateEmpty="Ingrese una cantidad"').'
								</div>
								<div class="col-xs-2 txC">
									<span id="Date'.$ID.'" class="Hidden ItemText'.$ID.' OrderDate"></span>
									'.Core::InsertElement('text','date_'.$ID,'','ItemField'.$ID.' form-control txC delivery_date','disabled="disabled" placeholder="Fecha de Entrega" validateEmpty="Ingrese una fecha"').'
								</div>
								 <div class="col-xs-1 txC">
									<span id="Day'.$ID.'" class="Hidden ItemText'.$ID.' OrderDay"></span>
									'.str_replace("00","0",Core::InsertElement('text','day_'.$ID,'00','ItemField'.$ID.' form-control txC DayPicker','disabled="disabled" placeholder="D&iacute;as de Entrega" validateEmpty="Ingrese una cantidad de d&iacute;as"')).'
								</div>
								<div  id="item_number_'.$ID.'" class="col-xs-1 txC item_number" total="0" item="'.$ID.'">'.$TotalPrice.'</div>
								<div class="col-xs-2 txC">
					<!--<button type="button" id="SaveItem'.$ID.'" class="btn btnGreen SaveItem" style="margin:0px;" item="'.$ID.'"><i class="fa fa-check"></i></button>-->
					<button type="button" id="EditItem'.$ID.'" class="btn btnBlue EditItem Hidden" style="margin:0px;" item="'.$ID.'"><i class="fa fa-pencil"></i></button>
					'.$HistoryButton.'
					<button type="button" id="DeleteItem'.$ID.'" class="btn btnRed DeleteItem" style="margin:0px;" item="'.$ID.'"><i class="fa fa-trash"></i></button>
				</div>
				</form>
						</div>';
						echo $HTML;
	}

	public function Getitemprices()
	{
		$Prices = array();
		if($_POST['items'])
		{
			$Items = explode(",",$_POST['items']);
			foreach($Items as $Item)
			{
				$Product	= new Product($Item);
				$Prices[] = $Product->Data['price'];
			}
		}
		echo implode(",",$Prices);
	}

	public static function Createfromquotation( $Quotation = null )
	{
			if( $Quotation == null )
			{

					return null;

			}

			if( !is_object( $Quotation ) )
			{

					$Quotation = new Quotation( $Quotation );

					$Quotation = $Quotation->GetData();

			}

			$QuotationID 	= $Quotation[ 'quotation_id' ];
			$CompanyID 		= $Quotation[ 'company_id' ];
			$BranchID 		= $Quotation[ 'branch_id' ];
			$SenderID 		= $Quotation[ 'sender_id' ];
			$ReceiverID 	= $Quotation[ 'receiver_id' ];
			$AgentID 			= $Quotation[ 'agent_id' ];
			$CurrencyID 	= $Quotation[ 'currency_id' ];
			$Total 				= $Quotation[ 'total_quotation' ];
			$Date 				= $Quotation[ 'quotation_date' ];
			$DeliveryDate	= $Quotation[ 'delivery_date' ];
			$Extra 				= $Quotation[ 'extra' ];
			$Additional		= $Quotation[ 'additional_information' ];
			$CreatedBy 		= $_SESSION[ CoreUser::TABLE_ID ];
			$Organization = $_SESSION[ CoreOrganization::TABLE_ID ];

			// INSERT ORDER
			$PurchaseID = Core::Insert
			(
					self::TABLE,

					Quotation::TABLE_ID . ',' .
					Company::TABLE_ID . ',' .
					CompanyBranch::TABLE_ID . ',' .
					'sender_id,receiver_id,agent_id,currency_id,total,extra,additional_information,purchase_date,delivery_date,status,creation_date,created_by,' .
					CoreOrganization::TABLE_ID,

					$QuotationID . "," .
					$CompanyID . "," .
					$BranchID . "," .
					$SenderID . "," .
					$ReceiverID . "," .
					$AgentID . "," .
					'0,' .
					$Total . ",'" .
					$Extra . "','" .
					$Additional . "','" .
					$Date . "','" .
					$DeliveryDate . "'," .
					"'P',NOW()," .
					$CreatedBy . "," .
					$Organization
			);

			// INSERT ITEMS
			if( $PurchaseID )
			{

					foreach( $Quotation[ 'items' ] as $Item )
					{



					}

					foreach( $Quotation[ 'items' ] as $Item )
					{

							if( $Fields )
							{

									$Fields .= '),(';

							}

							$Fields .=
							$PurchaseID . ',' .
							$CompanyID . ',' .
							$BranchID . ',' .
							$Item[ 'product_id' ] . ',' .
							$Item[ 'price' ] . ',' .
							$Item[ 'width' ] . ',' .
							$Item[ 'height' ] . ',' .
							$Item[ 'depth' ] . ',' .
							$Item[ 'quantity' ] . ',' .
							$Item[ 'total_item' ] . ",'" .
							$Item[ 'delivery_date' ] . "'," .
							$Item[ 'days' ] .
							",NOW()," .
							$_SESSION[ CoreUser::TABLE_ID ] . ',' .
							$_SESSION[ CoreOrganization::TABLE_ID ];
					}

					Core::Insert
					(

							PurchaseItem::TABLE,

							self::TABLE_ID . ',' .
							Company::TABLE_ID . ',' .
							CompanyBranch::TABLE_ID . ',' .
							Product::TABLE_ID . ',' .
							'price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,' .
							CoreOrganization::TABLE_ID,

							$Fields

					);

					return $PurchaseID;

			}else{

					return null;

			}

	}

}

?>
