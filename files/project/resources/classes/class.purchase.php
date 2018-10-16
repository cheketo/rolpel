<?php

class Purchase
{
	use CoreSearchList,CoreCrud,CoreImage;

	const TABLE							= 'purchase';
	const TABLE_ID					= 'purchase_id';
	const SEARCH_TABLE			= 'view_purchase_list';
	const DEFAULT_FILE_DIR	= '../../../../skin/files/purchase/';
	const DEFAULT_IMG				= '../../../../skin/images/purchases/default/default.png';
	const DEFAULT_IMG_DIR		= '../../../../skin/images/purchases/default/';
	const IMG_DIR						= '../../../../skin/images/purchases/';

	public function __construct($ID=0)
	{
		$this->ID = $ID;
		if($this->ID!=0)
		{
			$Data = Core::Select(self::SEARCH_TABLE,'*',self::TABLE_ID."=".$this->ID,self::TABLE_ID);
			$this->Data = $Data[0];
			$this->Data['items'] = $Data;
		}
	}

	public function GetSentEmails()
	{
		$this->Data['emails'] = Core::Select("purchase_email","*","purchase_id=".$this->ID);
		return $this->Data['emails'];
	}

	public static function GetParams()
	{
		if($_GET['provider'] && $_GET['provider']!="undefined" )
			$Params .= '&provider='.$_GET['provider'];
		else
			$Params .= '&provider=N';
		if($_GET['customer'] && $_GET['customer']!="undefined" )
			$Params .= '&customer='.$_GET['customer'];
		else
			$Params .= '&customer=N';
		if($_GET['international'] && $_GET['international']!="undefined")
			$Params .= '&international='.$_GET['international'];
		else
			$Params .= '&international=N';
		return $Params;
	}

	public static function SaveAndMoveFiles($PurchaseID,$FilesCount,$PrefixID="qfileid",$ProductID=0)
	{
		$IDs = "0";
		for($I=1;$I<=$FilesCount;$I++)
		{

			$FileID = $_POST[$PrefixID.'_'.$I];
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

	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// SEARCHLIST FUNCTIONS ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	protected static function MakeActionButtonsHTML($Object,$Mode='list')
	{
		if($Mode!='grid') $HTML .=	'<a class="hint--bottom hint--bounce" aria-label="M&aacute;s informaci&oacute;n"><button type="button" class="btn bg-navy ExpandButton" id="expand_'.$Object->ID.'"><i class="fa fa-plus"></i></button></a> ';;
		if($Object->Data['status']!="I")
		{
			$HTML	.= '<a class="hint--bottom hint--bounce" aria-label="Ver Detalle" href="view.php?id='.$Object->ID.'" id="payment_'.$Object->ID.'"><button type="button" class="btn btn-github"><i class="fa fa-eye"></i></button></a> ';
			if($Object->Data['status']!="F")
			{
				$HTML	.= '<a class="hint--bottom hint--bounce hint--success" aria-label="Crear Orden" process="'.PROCESS.'" id="purchase_'.$Object->ID.'" status="'.$Row->Data['status'].'"><button type="button" class="btn bg-olive"><i class="fa fa-truck"></i></button></a> ';
				$HTML	.= '<a class="hint--bottom hint--bounce hint--info storeElement" aria-label="Archivar" process="'.PROCESS.'" id="store_'.$Object->ID.'"><button type="button" class="btn btn-primary"><i class="fa fa-archive"></i></button></a>';
				$HTML	.= '<a href="edit.php?id='.$Object->ID.self::GetParams().'" class="hint--bottom hint--bounce hint--info" aria-label="Editar"><button type="button" class="btn btnBlue"><i class="fa fa-pencil"></i></button></a>';
				$HTML	.= '<a class="deleteElement hint--bottom hint--bounce hint--error" aria-label="Eliminar" process="'.PROCESS.'" id="delete_'.$Object->ID.'"><button type="button" class="btn btnRed"><i class="fa fa-trash"></i></button></a>';
				$HTML	.= Core::InsertElement('hidden','delete_question_'.$Object->ID,'&iquest;Desea eliminar la orden de compra de <b>'.$Object->Data['company'].'</b>?');
				$HTML	.= Core::InsertElement('hidden','delete_text_ok_'.$Object->ID,'La orden de compra de <b>'.$Object->Data['company'].'</b> ha sido eliminada.');
				$HTML	.= Core::InsertElement('hidden','delete_text_error_'.$Object->ID,'Hubo un error al intentar eliminar la orden de compra de <b>'.$Object->Data['company'].'</b>.');
			}
		}else{
			$HTML	.= '<a class="activateElement hint--bottom hint--bounce hint--success" aria-label="Activar" process="'.PROCESS.'" id="activate_'.$Object->ID.'"><button type="button" class="btn btnGreen"><i class="fa fa-check-circle"></i></button></a>';
			$HTML	.= Core::InsertElement('hidden','activate_question_'.$Object->ID,'&iquest;Desea activar la orden de compra de <b>'.$Object->Data['company'].'</b>?');
			$HTML	.= Core::InsertElement('hidden','activate_text_ok_'.$Object->ID,'La orden de compra de <b>'.$Object->Data['company'].'</b> ha sido activada.');
			$HTML	.= Core::InsertElement('hidden','activate_text_error_'.$Object->ID,'Hubo un error al intentar activar la orden de compra de <b>'.$Object->Data['company'].'</b>.');
		}
		return $HTML;
	}

	protected static function MakeListHTML($Object)
	{
		$HTML = '<div class="col-lg-4 col-md-5 col-sm-5 col-xs-3">
					<div class="listRowInner">
						<img class="img-circle hideMobile990" src="'.Purchase::DEFAULT_IMG.'" alt="'.$Object->Data['company'].'">
						<span class="listTextStrong">'.$Object->Data['company'].'</span>
						<span class="smallTitle"><b>(ID: '.$Object->Data['purchase_id'].')</b></span>
					</div>
				</div>
				<div class="col-lg-3 col-md-2 col-sm-2 col-xs-3">
					<div class="listRowInner">
						<span class="smallTitle">Total</span>
						<span class="listTextStrong">
							<span class="label label-brown">$ '.$Object->Data['total_purchase'].'</span>
						</span>
					</div>
				</div>
				<div class="col-lg-1 col-md-2 col-sm-3 col-xs-3">
					<div class="listRowInner">
						<span class="smallTitle">Entrega</span>
						<span class="listTextStrong"><span class="label label-info">
							'.Core::FromDBToDate($Object->Data['creation_date']).'
						</span></span>
					</div>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1 hideMobile990"></div>';
		return $HTML;
	}

	protected static function MakeItemsListHTML($Object)
	{
		foreach($Object->Data['items'] as $Item)
		{
			$RowClass = $RowClass != 'bg-gray'? 'bg-gray':'bg-gray-active';
			$HTML .= '
						<div class="row '.$RowClass.'" style="padding:5px;">
							<div class="col-lg-4 col-sm-5 col-xs-12">
								<div class="listRowInner">
									<img class=" hideMobile990" src="'.Product::DEFAULT_IMG.'" alt="'.$Item['title'].'">
									<span class="listTextStrong">'.$Item['title'].'</span>
									<span class="smallTitle hideMobile990"><b>'.$Item['category'].' ('.$Item['brand'].')</b></span>
								</div>
							</div>
							<div class="col-sm-2 col-xs-12">
								<div class="listRowInner">
									<span class="smallTitle">Precio</span>
									<span class="emailTextResp"><span class="label label-brown">$ '.$Item['price'].'</span></span>
								</div>
							</div>
							<div class="col-sm-3 col-xs-12">
								<div class="listRowInner">
									<span class="smallTitle">Cantidad</span>
									<span class="listTextStrong"><span class="label bg-navy">'.$Item['total_quantity'].'</span></span>
								</div>
							</div>
						</div>';
		}
		return $HTML;
	}

	protected static function MakeGridHTML($Object)
	{
		$ButtonsHTML = '<span class="roundItemActionsGroup">'.self::MakeActionButtonsHTML($Object,'grid').'</span>';
		$HTML = '<div class="flex-allCenter imgSelector">
		              <div class="imgSelectorInner">
		                <img src="'.$Object->Img.'" alt="'.$Object->Data['company'].'" class="img-responsive">
		                <div class="imgSelectorContent">
		                  <div class="roundItemBigActions">
		                    '.$ButtonsHTML.'
		                    <span class="roundItemCheckDiv"><a href="#"><button type="button" class="btn roundBtnIconGreen Hidden" name="button"><i class="fa fa-check"></i></button></a></span>
		                  </div>
		                </div>
		              </div>
		              <div class="roundItemText">
		                <p><b>'.$Object->Data['company'].'</b></p>
		                <p>('.$Object->Data['purchase_id'].')</p>
		              </div>
		            </div>';
		return $HTML;
	}

	public static function MakeNoRegsHTML()
	{
		return '<div class="callout callout-info"><h4><i class="icon fa fa-info-circle"></i> No se encontraron cotizaciones.</h4><p>Puede crear una nueva haciendo click <a href="new.php?'.self::GetParams().'">aqui</a>.</p></div>';
	}

	protected function SetSearchFields()
	{
		$this->SearchFields['purchase_id'] = Core::InsertElement('text','purchase_id','','form-control','placeholder="C&oacute;digo Cotiz."');
		$this->SearchFields['title'] = Core::InsertElement('text','title','','form-control','placeholder="Producto"');
		$this->SearchFields['quantity'] = Core::InsertElement('text','quantity','','form-control','placeholder="Cantidad"');
	}

	protected function InsertSearchButtons()
	{
		return '<a href="new.php?provider=Y" class="hint--bottom hint--bounce" aria-label="Nueva Orden de Compra a Proveedor"><button type="button" class="NewElementButton btn bg-brown animated fadeIn"><i class="fa fa-plus-square"></i></button></a> '
						.'<a href="new.php?customer=Y" class="hint--bottom hint--bounce hint--info" aria-label="Nueva Orden de Compra de Cliente"><button type="button" class="NewElementButton btn btn-primary animated fadeIn"><i class="fa fa-plus-square"></i></button></a>';
	}

	public function ConfigureSearchRequest()
	{
		$_POST['view_order_mode'] = $_POST['view_order_mode']? $_POST['view_order_mode']:'DESC';
		$_POST['view_order_field'] = $_POST['view_order_field']? $_POST['view_order_field']:'purchase_id';
		$this->SetSearchRequest();
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// PROCESS METHODS ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function Insert()
	{

			// Items Data

			$Total = 0;

			$Items = array();

			for( $I = 1; $I <= $_POST[ 'items' ]; $I++ )
			{

					if( $_POST[ 'item_' . $I ] )
					{

							$Total += ( substr( $_POST[ 'price_' . $I ], 1 ) * $_POST[ 'quantity_' . $I ] );

							$ItemDate = Core::FromDateToDB( $_POST[ 'date_' . $I ] );

							$Width = $_POST[ 'sizex_' . $I ] ? $_POST[ 'sizex_' . $I ] : '0.00';
							$Height = $_POST[ 'sizey_' . $I ] ? $_POST[ 'sizey_' . $I ] : '0.00';
							$Depth = $_POST[ 'sizez_' . $I ] ? $_POST[ 'sizez_' . $I ] : '0.00';

							$Items[] = array(
																	'id' => $_POST[ 'item_' . $I ],
																	'price' => substr( $_POST[ 'price_' . $I ], 1 ),
																	'width' => $Width,
																	'height' => $Height,
																	'depth' => $Depth,
																	'quantity' => $_POST[ 'quantity_' . $I ],
																	'delivery_date' => $ItemDate,
																	'days' => $_POST[ 'day_' . $I ]
															);

							if( !$Date )
							{

									$Date = $ItemDate;

							}

							if( strtotime( $ItemDate . " 00:00:00" ) > strtotime( $Date . " 00:00:00" ) )
							{

								$Date = $ItemDate;

							}

					}

			}

			// Basic Data
			$CompanyID		= $_POST[ 'company' ];

			$BranchID			= $_POST[ 'branch' ];

			$AgentID 			= $_POST[ 'agent' ]? $_POST[ 'agent' ] : 0;

			$Extra				= $_POST[ 'extra' ];

			$Additional		= $_POST[ 'additional_information' ];

			// Delivery Days Data

			$MondayFrom		= $_POST[ 'from_monday' ];

			$MondayTo			= $_POST[ 'to_monday' ];

			$TuesdayFrom	= $_POST[ 'from_tuesday' ];

			$TuesdayTo		= $_POST[ 'to_tuesday' ];

			$WensdayFrom	= $_POST[ 'from_wensday' ];

			$WensdayTo		= $_POST[ 'to_wensday' ];

			$ThursdayFrom	= $_POST[ 'from_thursday' ];

			$ThursdayTo		= $_POST[ 'to_thursday' ];

			$FridayFrom	= $_POST[ 'from_friday' ];

			$FridayTo		= $_POST[ 'to_friday' ];

			$SaturdayFrom	= $_POST[ 'from_saturday' ];

			$SaturdayTo		= $_POST[ 'to_saturday' ];

			$SundayFrom	= $_POST[ 'from_sunday' ];

			$SundayTo		= $_POST[ 'to_sunday' ];

			// Saving Data

			$Field				= $_POST[ 'company_type' ] . '_id';

			$NewID				= Core::Insert(

																		self::TABLE,

																		Company::TABLE_ID .',' .
																		$Field . ',' .
																		CompanyBranch::TABLE_ID . ',' .
																		'agent_id,total,extra,expire_date,' .
																		'monday_from,monday_to,tuesday_from,tuesday_to,wensday_from,wensday_to,thursday_from,thursday_to,friday_from,friday_to,saturday_from,saturday_to,sunday_from,sunday_to,' .
																		'status,creation_date,created_by,' .
																		CoreOrganization::TABLE_ID,

																		$CompanyID . "," .
																		$CompanyID . "," .
																		$BranchID . "," .
																		$AgentID . "," .
																		$Total . ",'" .
																		$Extra . "','" .
																		$Date . "','" .
																		$MondayFrom . "','" .
																		$MondayTo . "','" .
																		$TuesdayFrom . "','" .
																		$TuesdayTo . "','" .
																		$WensdayFrom . "','" .
																		$WensdayTo . "','" .
																		$ThursdayFrom . "','" .
																		$ThursdayTo . "','" .
																		$FridayFrom . "','" .
																		$FridayTo . "','" .
																		$SaturdayFrom . "','" .
																		$SaturdayTo . "','" .
																		$SundayFrom . "','" .
																		$SundayTo . "'," .
																		"'A',NOW()," .
																		$_SESSION[ CoreUser::TABLE_ID ] . "," .
																		$_SESSION[ 'organization_id' ]

																	);

			// Saving Items

			foreach( $Items as $Item )
			{

					$Item[ 'days' ] = $Item[ 'days' ] ? intval( $Item[ 'days' ] ) : "0";

					if( $Fields )
					{

							$Fields .= "),(";

					}

					$Fields .= 	$NewID . "," .
											$CompanyID."," .
											$BranchID . "," .
											$Item[ 'id' ] . "," .
											$Item[ 'price' ] . "," .
											$Item[ 'width' ] . "," .
											$Item[ 'height' ] . "," .
											$Item[ 'depth' ] . "," .
											$Item[ 'quantity' ] . "," .
											( $Item[ 'price' ] * $Item[ 'quantity' ] ) . ",'" .
											$Item[ 'delivery_date' ] . "'," .
											$Item[ 'days' ] .
											",NOW()," .
											$_SESSION[ CoreUser::TABLE_ID ] . "," . $_SESSION[ CoreOrganization::TABLE_ID ];

			}

			Core::Insert(
										PurchaseItem::TABLE,

										self::TABLE_ID . ',' .
										Company::TABLE_ID . ',' .
										CompanyBranch::TABLE_ID . ',' .
										Product::TABLE_ID .
										',price,width,height,depth,quantity,total,delivery_date,days,creation_date,created_by,' .
										CoreOrganization::TABLE_ID,

										$Fields

									);

			// Saving Files

			self::SaveAndMoveFiles( $ID, $_POST[ 'qfilecount' ] );

			// Send Email

			self::Sendemail( $ID, $_POST[ 'receiver' ] );

	}

	public static function Sendemail( $PID, $Receiver )
	{
			if( $Receiver )
			{

					//Create PDF file
					$PDF = new Pdf();

					$PDF->SetOutputType( 'F' );

					$Purchase = new Purchase( $PID );

					$File = $PDF->Purchase( $PID );

					//Create and send email
					$Mail = new Mailer();

					$Sender = 'ventas@rolpel.com.ar';

					//Add BCC
					$BCC = 'ventas@rolpel.com.ar';

					$Mail->AddBCC( $BCC, 'Ventas RolPel S.R.L.' );

					$Subject = 'Orden de Compra N°' . $PID;

					//Set Batch TRUE to send emails through remote server

					//$Mail->SetBatch(true);

					$Sent = $Mail->PurchaseEmail( $PID, $Receiver, $Purchase->Data[ 'company' ], $Subject, $File, $Sender );

					//Check for errors
					if( !$Sent )
					{

					    echo 'Mailer Error: ' . $Mail->ErrorInfo;

					}else{

					    //Insert Sent Email
					    Core::Insert(

									'purchase_email',

									self::TABLE_ID . ",email_from,email_to,subject,message,file,status,cc,bcc,creation_date,created_by,organization_id",

									$PID . ",'" . $Sender . "','" . $Receiver . "','" . $Subject . "','" . $Message . "','" . $File . "','P','" . $CC."','" . $BCC . "',NOW()," . $_SESSION[ CoreUser::TABLE_ID ] . "," . $_SESSION[ CoreOrganization::TABLE_ID ]

							);
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

				if(!$Date)
				{
					$Date = $ItemDate;
				}
				if(strtotime($ItemDate." 00:00:00") > strtotime($Date." 00:00:00")){
					$Date = $ItemDate;
				}
			}
		}

		// Basic Data
		$CompanyID	= $_POST['company'];
		$BranchID		= $_POST['branch'];
		$AgentID 		= $_POST['agent']? $_POST['agent']: 0;
		$Extra			= $_POST['extra'];
		$Additional		= $_POST[ 'additional_information' ];

		// Delivery Days Data

		$MondayFrom		= $_POST[ 'from_monday' ];

		$MondayTo			= $_POST[ 'to_monday' ];

		$TuesdayFrom	= $_POST[ 'from_tuesday' ];

		$TuesdayTo		= $_POST[ 'to_tuesday' ];

		$WensdayFrom	= $_POST[ 'from_wensday' ];

		$WensdayTo		= $_POST[ 'to_wensday' ];

		$ThursdayFrom	= $_POST[ 'from_thursday' ];

		$ThursdayTo		= $_POST[ 'to_thursday' ];

		$FridayFrom	= $_POST[ 'from_friday' ];

		$FridayTo		= $_POST[ 'to_friday' ];

		$SaturdayFrom	= $_POST[ 'from_saturday' ];

		$SaturdayTo		= $_POST[ 'to_saturday' ];

		$SundayFrom	= $_POST[ 'from_sunday' ];

		$SundayTo		= $_POST[ 'to_sunday' ];

		$Field			= $_POST['company_type'].'_id';
		$Update		= Core::Update(self::TABLE,Company::TABLE_ID."=".$CompanyID.",'.$Field.'='.$CompanyID.',".CompanyBranch::TABLE_ID."=".$BranchID.",agent_id=".$AgentID.",delivery_date='".$Date."',extra='".$Extra."',additional_information='".$Additional."',total=".$Total.",monday_from='".$MondayFrom."',monday_to='".$MondayTo."',tuesday_from='".$TuesdayFrom."',tuesday_to='".$TuesdayTo."',wensday_from='".$WensdayFrom."',wensday_to='".$WensdayTo."',thursday_from='".$ThursdayFrom."',thursday_to='".$ThursdayTo."',friday_from='".$FridayFrom."'friday_to='".$FridayTo."',saturday_from='".$SaturdayFrom."',saturday_to='".$SaturdayTo."',sunday_from='".$SundayFrom."',sunday_to='".$SundayTo."',updated_by=".$_SESSION[CoreUser::TABLE_ID],self::TABLE_ID."=".$ID);

		// DELETE OLD ITEMS
		PurchaseItem::DeleteItems($ID);

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

}
?>
