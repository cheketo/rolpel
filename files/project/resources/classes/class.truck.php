<?php

class Truck
{
	use CoreSearchList,CoreCrud,CoreImage;

	const TABLE				= 'truck';
	const TABLE_ID			= 'truck_id';
	const SEARCH_TABLE		= 'view_truck_list';
	const DEFAULT_IMG		= '../../../../skin/images/trucks/default/default.png';
	const DEFAULT_IMG_DIR	= '../../../../skin/images/trucks/default/';
	const IMG_DIR			= '../../../../skin/images/trucks/';

	public function __construct($ID=0)
	{
		$this->ID = $ID;
		if($this->ID!=0)
		{
			$Data = Core::Select(self::SEARCH_TABLE,'*',self::TABLE_ID."=".$this->ID);
			$this->Data = $Data[0];
			self::SetImg($this->Data['logo']);
		}
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// SEARCHLIST FUNCTIONS ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	protected static function MakeActionButtonsHTML($Object,$Mode='list')
	{
		if($Mode!='grid') $HTML .=	'<a class="hint--bottom hint--bounce" aria-label="M&aacute;s informaci&oacute;n"><button type="button" class="btn bg-navy ExpandButton" id="expand_'.$Object->ID.'"><i class="fa fa-plus"></i></button></a> ';;
		$HTML	.= 	'<a href="edit.php?id='.$Object->ID.'" class="hint--bottom hint--bounce hint--info" aria-label="Editar"><button type="button" class="btn btnBlue"><i class="fa fa-pencil"></i></button></a>';
		if($Object->Data['status']=="A")
		{
			$HTML	.= '<a class="deleteElement hint--bottom hint--bounce hint--error" aria-label="Eliminar" process="'.PROCESS.'" id="delete_'.$Object->ID.'"><button type="button" class="btn btnRed"><i class="fa fa-trash"></i></button></a>';
			$HTML	.= Core::InsertElement('hidden','delete_question_'.$Object->ID,'&iquest;Desea eliminar el cami&oacute;n <b>'.$Object->Data['code'].'</b>?');
			$HTML	.= Core::InsertElement('hidden','delete_text_ok_'.$Object->ID,'El cami&oacute;n <b>'.$Object->Data['code'].'</b> ha sido eliminado.');
			$HTML	.= Core::InsertElement('hidden','delete_text_error_'.$Object->ID,'Hubo un error al intentar eliminar el cami&oacute;n <b>'.$Object->Data['code'].'</b>.');
		}else{
			$HTML	.= '<a class="activateElement hint--bottom hint--bounce hint--success" aria-label="Activar" process="'.PROCESS.'" id="activate_'.$Object->ID.'"><button type="button" class="btn btnGreen"><i class="fa fa-check-circle"></i></button></a>';
			$HTML	.= Core::InsertElement('hidden','activate_question_'.$Object->ID,'&iquest;Desea activar el cami&oacute;n <b>'.$Object->Data['code'].'</b>?');
			$HTML	.= Core::InsertElement('hidden','activate_text_ok_'.$Object->ID,'El cami&oacute;n <b>'.$Object->Data['code'].'</b> ha sido activado.');
			$HTML	.= Core::InsertElement('hidden','activate_text_error_'.$Object->ID,'Hubo un error al intentar activar el cami&oacute;n <b>'.$Object->Data['code'].'</b>.');
		}
		return $HTML;
	}

	protected static function MakeListHTML($Object)
	{
		$Code = $Object->Data['code']? '<span class="smallTitle hideMobile990">Nombre/C&oacute;digo: '.$Object->Data['code'].'</span>':'';
		$Truck = $Object->Data['brand'].' '.$Object->Data['model'].' '.$Object->Data['year'];
		$HTML = '<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
			<div class="listRowInner">
				<img class="img-circle hideMobile990" src="'.$Object->Img.'" alt="'.$Truck.'">
				<span class="listTextStrong">'.$Truck.'</span>
				<span class="smallTitle hideMobile990">Patente: '.$Object->Data['plate'].'</span>
				'.$Code.'
			</div>
		</div>
		<div class="col-lg-3 col-md-2 col-sm-2 col-xs-4">
			<div class="listRowInner">
				<span class="listTextStrong">Chofer</span>
				<span class="listTextStrong">
					<span class="label label-primary">'.$Object->Data['driver'].'</span><br>
				</span>
			</div>
		</div>
		<div class="col-lg-1 col-md-1 col-sm-1 hideMobile990"></div>';
		return $HTML;
	}

	protected static function MakeItemsListHTML($Object)
	{
		return $HTML;
	}

	protected static function MakeGridHTML($Object)
	{
		$Truck = $Object->Data['brand'].' '.$Object->Data['model'].' '.$Object->Data['year'];
		$ButtonsHTML = '<span class="roundItemActionsGroup">'.self::MakeActionButtonsHTML($Object,'grid').'</span>';
		$HTML = '<div class="flex-allCenter imgSelector">
		              <div class="imgSelectorInner">
		                <img src="'.$Object->Img.'" alt="'.$Object->Data['name'].'" class="img-responsive">
		                <div class="imgSelectorContent">
		                  <div class="roundItemBigActions">
		                    '.$ButtonsHTML.'
		                    <span class="roundItemCheckDiv"><a href="#"><button type="button" class="btn roundBtnIconGreen Hidden" name="button"><i class="fa fa-check"></i></button></a></span>
		                  </div>
		                </div>
		              </div>
		              <div class="roundItemText">
		                <p><b>'.$Truck.'</b></p>
										<p>('.$Object->Data['plate'].')</p>
										<p>'.$Object->Data['code'].'</p>
		              </div>
		            </div>';
		return $HTML;
	}

	public static function MakeNoRegsHTML()
	{
		$Entities = 'camiones';
		return '<div class="callout callout-info"><h4><i class="icon fa fa-info-circle"></i> No se encontraron '.$Entities.'.</h4><p>Puede crear un nuevo cami&oacute;n haciendo click <a href="new.php">aqui</a>.</p></div>';
	}

	protected function SetSearchFields()
	{
		$this->SearchFields['plate'] = Core::InsertElement('text','plate','','form-control','placeholder="Patente"');
		$this->SearchFields['brand'] = Core::InsertElement('text','brand','','form-control','placeholder="Marca"');
		$this->SearchFields['model'] = Core::InsertElement('text','model','','form-control','placeholder="Modelo"');
		$this->SearchFields['year'] = Core::InsertElement('text','year','','form-control','placeholder="A&ntilde;o" validateOnlyNumbers="Ingrese un año"');
		$this->SearchFields['capacity'] = Core::InsertElement('text','capacity','','form-control','placeholder="Capacidad" validateOnlyNumbers="Ingrese una capacidad"');
		$this->SearchFields['driver'] = Core::InsertElement('text','driver','','form-control','placeholder="Chofer"');
		$this->SearchFields['code'] = Core::InsertElement('text','code','','form-control','placeholder="Nombre/C&oacute;digo"');
	}

	protected function InsertSearchButtons()
	{
		return '<a href="new.php" class="hint--bottom hint--bounce hint--success" aria-label="Nuevo Cami&oacute;n"><button type="button" class="NewElementButton btn btnGreen animated fadeIn"><i class="fa fa-plus-square"></i></button></a>';
	}

	// public function ConfigureSearchRequest()
	// {
	// 	if($_POST['cuit']) $_POST['cuit'] = Core::FromCUITToNumber($_POST['cuit']);
	// 	if($_POST['balance_from'])
	// 	{
	// 		$Price=Core::FromMoneyToDB($_POST['balance_from']);
	// 		$this->AddWhereString(" AND balance>=".$Price);
	// 		$_POST['balance_restricted']=true;
	// 	}
	// 	if($_POST['balance_to'])
	// 	{
	// 		$Price=Core::FromMoneyToDB($_POST['balance_to']);
	// 		$this->AddWhereString(" AND balance<=".$Price);
	// 		$_POST['balance_restricted']=true;
	// 	}
	//
	// 	if($_POST['view_order_field']=="balance_from" || $_POST['view_order_field']=="balance_to")
	// 		$_POST['view_order_field'] = "balance";
	//
	// 	$this->SetSearchRequest();
	// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// PROCESS METHODS ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public function ValidateInformation()
	{
		//VALIDATIONS
		if(!$_POST['brand']) echo 'Marca incompleta';
		if(!$_POST['model']) echo 'Modelo incompleto';
		if(!$_POST['year']) echo 'Año incompleto';
		if(!$_POST['driver']) echo 'Falta chofer';
		if(!$_POST['capacity']) echo 'Capacidad incompleta';
		return true;

	}
	public function Insert()
	{
		// Validate data from POST
		$this->ValidateInformation();

		// Basic Data
		$Code 		= $_POST['code'];
		$Brand		= $_POST['brand'];
		$Model		= $_POST['model'];
		$Year			= $_POST['year'];
		$Plate		= $_POST['plate'];
		$Driver		= $_POST['driver'];
		$Capacity	= $_POST['capacity'];

		$ID				= Core::Insert(self::TABLE,'driver_id,plate,code,brand,model,year,capacity,creation_date,created_by,'.CoreOrganization::TABLE_ID,$Driver.",'".$Plate."','".$Code."','".$Brand."','".$Model."',".$Year.",".$Capacity.",NOW(),".$_SESSION[CoreUser::TABLE_ID].",".$_SESSION[CoreOrganization::TABLE_ID]);
		// echo Core::LastQuery();
	}

	public function Update()
	{
		// Validate data from POST
		$this->ValidateInformation();

		// Set Object
		$ID 	= $_POST['id'];
		$Object	= new Truck($ID);

		// Basic Data
		$Code 		= $_POST['code'];
		$Brand		= $_POST['brand'];
		$Model		= $_POST['model'];
		$Year			= $_POST['year'];
		$Plate		= $_POST['plate'];
		$Driver		= $_POST['driver'];
		$Capacity	= $_POST['capacity'];

		$Update		= Core::Update(self::TABLE,"plate='".$Plate."',driver_id=".$Driver.",code='".$Code."',brand='".$Brand."',model='".$Model."',year=".$Year.",capacity=".$Capacity.",updated_by=".$_SESSION[CoreUser::TABLE_ID],self::TABLE_ID."=".$ID);
		//echo $this->LastQuery();
	}

	public function Validate()
	{
		echo self::ValidateValue('code',$_POST['code'],$_POST['actualcode']);
	}
}
?>
