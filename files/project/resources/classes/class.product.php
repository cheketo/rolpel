<?php

class Product
{
	use CoreSearchList,CoreCrud,CoreImage;

	const TABLE				= 'product';
	const TABLE_ID			= 'product_id';
	const SEARCH_TABLE		= 'view_product_list';
	const DEFAULT_IMG		= '../../../../skin/images/products/default/default.png';
	const DEFAULT_IMG_DIR	= '../../../../skin/images/products/default/';
	const IMG_DIR			= '../../../../skin/images/products/';

	public function __construct($ID=0)
	{
		$this->ID = $ID;
		$this->GetData();
		self::SetImg($this->Data['img']);
	}

	public static function GetFullCodes()
	{
		return Core::Select(Product::SEARCH_TABLE,"product_id,CONCAT(title,' ',category,' - ',brand) AS code","status='A' AND organization_id=".$_SESSION['organization_id'],'title','',10);
	}

	public static function SearchCodes()
	{
		if($_GET['category'])
			$CategoryFilter = " AND category_id=".$_GET['category'];
		$Products =  Core::Select(Product::SEARCH_TABLE,"product_id as id,CONCAT('',title,' - <b>',brand,' - ',category,'</b>') as text","status='A' ".$CategoryFilter." AND title LIKE '%".$_GET['text']."%' AND organization_id=".$_SESSION['organization_id'],'title','',100);
		if(empty($Products))
			$Products[0]=array("id"=>"","text"=>"no-result");
		else
		echo json_encode($Products,JSON_HEX_QUOT);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// SEARCHLIST FUNCTIONS ///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	protected static function MakeActionButtonsHTML($Object,$Mode='list')
	{
		if($Mode!='grid') $HTML .=	'<a class="hint--bottom hint--bounce" aria-label="M&aacute;s informaci&oacute;n"><button type="button" class="btn bg-navy ExpandButton" id="expand_'.$Object->ID.'"><i class="fa fa-plus"></i></button></a> ';;
		$HTML	.= 	'<a href="edit.php?id='.$Object->ID.'" class="hint--bottom hint--bounce hint--info" aria-label="Editar"><button type="button" class="btn btnBlue"><i class="fa fa-pencil"></i></button></a>';

		// $HTML	.= '<a class="hint--bottom hint--bounce hint--primary reactivate '.$ClassReactivated.'" aria-label="Normalizar" process="'.PROCESS.'" id="reactivate_'.$Object->ID.'"><button type="button" class="btn bg-purple"><i class="fa fa-level-up"></i></button></a>';
		// $HTML	.= '<a class="hint--bottom hint--bounce hint--error discontinue '.$ClassDiscontinued.'" aria-label="Discontinuar" process="'.PROCESS.'" id="discontinue_'.$Object->ID.'"><button type="button" class="btn bg-maroon"><i class="fa fa-level-down"></i></button></a>';
		if($Object->Data['status']=="A")
		{
			$HTML	.= '<a class="deleteElement hint--bottom hint--bounce hint--error" aria-label="Eliminar" process="'.PROCESS.'" id="delete_'.$Object->ID.'"><button type="button" class="btn btnRed"><i class="fa fa-trash"></i></button></a>';
			$HTML	.= Core::InsertElement('hidden','delete_question_'.$Object->ID,'&iquest;Desea eliminar el producto <b>'.$Object->Data['title'].'</b> ?');
			$HTML	.= Core::InsertElement('hidden','delete_text_ok_'.$Object->ID,'El producto <b>'.$Object->Data['title'].'</b> ha sido eliminado.');
			$HTML	.= Core::InsertElement('hidden','delete_text_error_'.$Object->ID,'Hubo un error al intentar eliminar el producto <b>'.$Object->Data['title'].'</b>.');

		}else{
			$HTML	.= '<a class="activateElement hint--bottom hint--bounce hint--success" aria-label="Activar" process="'.PROCESS.'" id="activate_'.$Object->ID.'"><button type="button" class="btn btnGreen"><i class="fa fa-check-circle"></i></button></a>';
			$HTML	.= Core::InsertElement('hidden','activate_question_'.$Object->ID,'&iquest;Desea activar el producto <b>'.$Object->Data['title'].'</b> ?');
			$HTML	.= Core::InsertElement('hidden','activate_text_ok_'.$Object->ID,'El producto <b>'.$Object->Data['title'].'</b> ha sido activado.');
			$HTML	.= Core::InsertElement('hidden','activate_text_error_'.$Object->ID,'Hubo un error al intentar activar el producto <b>'.$Object->Data['title'].'</b>.');
		}
		return $HTML;
	}

	protected static function MakeListHTML($Object)
	{
		if($Object->Data['width']>0)
		{
			$Size	= $Object->Data['width'];
			$Size .= $Object->Data['height']>0? "x".$Object->Data['height']:"";
			$Size .= $Object->Data['depth']>0? "x".$Object->Data['depth']:"";
		}else{
			$Size = "Medidas variables";
		}
		$HTML = '<div class="col-lg-4 col-md-5 col-sm-5 col-xs-8">
					<div class="listRowInner">
						<img class="img-circle hideMobile990" src="'.$Object->Img.'" alt="'.$Object->Data['title'].'">
						<span class="listTextStrong">'.$Object->Data['title'].'</span>
						<span class="smallTitle"><b>'.$Object->Data['brand'].'</b></span>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 hideMobile990">
					<div class="listRowInner">
						<span class="listTextStrong">Medidas</span>
						<span class="listTextStrong"><span class="label label-info">'.$Size.'</span></span>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 hideMobile990">
					<div class="listRowInner">
						<span class="listTextStrong">Categor&iacute;a</span>
						<span class="listTextStrong"><span class="label label-primary">'.$Object->Data['category'].'</span></span>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-5 hideMobile990">
					<div class="listRowInner">
						<span class="smallTitle">'.$Object->Data['description'].'</span>
					</div>
				</div>
				';
		return $HTML;
	}

	protected static function MakeItemsListHTML($Object)
	{
		$Object->Data['description'] = $Object->Data['description']? '<span class="smallDetails"><b>Descripci&oacute;n</b></span>'.$Object->Data['description']:'';
		$HTML .= '
				<div class="row bg-gray" style="padding:5px;">
					<div class="col-xs-12 showMobile990">
						<div class="listRowInner">
							<span class="smallDetails"><b>Categor&iacute;a</b></span>
							'.$Object->Data['category'].'
						</div>
					</div>
					<div class="col-xs-12 showMobile990">
						<div class="listRowInner">
						'.$Object->Data['description'].'
						</div>
					</div>
				</div>';
		return $HTML;
	}

	protected static function MakeGridHTML($Object)
	{
		$ButtonsHTML = '<span class="roundItemActionsGroup">'.self::MakeActionButtonsHTML($Object,'grid').'</span>';
		$HTML = '<div class="flex-allCenter imgSelector">
		              <div class="imgSelectorInner">
		                <img src="'.$Object->Img.'" alt="'.$Object->Data['title'].'" class="img-responsive">
		                <div class="imgSelectorContent">
		                  <div class="roundItemBigActions">
		                    '.$ButtonsHTML.'
		                    <span class="roundItemCheckDiv"><a href="#"><button type="button" class="btn roundBtnIconGreen Hidden" name="button"><i class="fa fa-check"></i></button></a></span>
		                  </div>
		                </div>
		              </div>
		              <div class="roundItemText">
		                <p><b>'.$Object->Data['title'].'</b></p>
		                <p>('.ucfirst($Object->Data['category']).')</p>
		              </div>
		            </div>';
		return $HTML;
	}

	public static function MakeNoRegsHTML()
	{
		return '<div class="callout callout-info"><h4><i class="icon fa fa-info-circle"></i> No se encontraron productos.</h4><p>Puede crear un nuevo producto haciendo click <a href="new.php">aqui</a>.</p></div>';
	}

	protected function SetSearchFields()
	{
		$this->SearchFields['title'] = Core::InsertElement('text','title','','form-control','placeholder="Nombre"');
		$this->SearchFields['brand_id'] = Core::InsertElement('select',Brand::TABLE_ID,'','form-control chosenSelect','',Core::Select(Brand::TABLE,Brand::TABLE_ID.',name',"status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID],"name"),'','Cualquier Marca');
		$this->SearchFields['category_id'] = Core::InsertElement('select',Category::TABLE_ID,'','form-control chosenSelect','',Core::Select(Category::TABLE,Category::TABLE_ID.',title',"status='A' AND ".CoreOrganization::TABLE_ID."=".$_SESSION[CoreOrganization::TABLE_ID],"title"),'','Cualquier L&iacute;nea');
	}

	protected function InsertSearchButtons()
	{
		return '<a href="new.php" class="hint--bottom hint--bounce hint--success" aria-label="Nuevo Producto"><button type="button" class="NewElementButton btn btnGreen animated fadeIn"><i class="fa fa-plus-square"></i></button></a>';
	}

	// public function ConfigureSearchRequest()
	// {
	// 	$this->SetSearchRequest();
	// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// PROCESS METHODS ///////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public function Insert()
	{
		$Title				= $_POST['title'];
		$Category			= $_POST['category'];
		$Brand				= $_POST['brand'];
		$Width				= $_POST['width']? $_POST['width']:"0.00";
		$Height				= $_POST['height']? $_POST['height']:"0.00";
		$Depth				= $_POST['depth']? $_POST['depth']:"0.00";
		$Description	= $_POST['description'];
		Core::Insert(self::TABLE,'title,'.Category::TABLE_ID.','.Brand::TABLE_ID.',width,height,depth,description,creation_date,organization_id,created_by',"'".$Title."',".$Category.",".$Brand.",".$Width.",".$Height.",".$Depth.",'".$Description."',NOW(),".$_SESSION[CoreOrganization::TABLE_ID].",".$_SESSION[CoreUser::TABLE_ID]);
		//echo $this->LastQuery();
	}

	public function Update()
	{
		$ID 					= $_POST['id'];
		$Edit					= new Product($ID);
		$Title				= $_POST['title'];
		$Category			= $_POST['category'];
		$Brand				= $_POST['brand'];
		$Width				= $_POST['width']? $_POST['width']:"0.00";
		$Height				= $_POST['height']? $_POST['height']:"0.00";
		$Depth				= $_POST['depth']? $_POST['depth']:"0.00";
		$Description	= $_POST['description'];
		Core::Update(self::TABLE,"title='".$Title."',".Category::TABLE_ID."=".$Category.",".Brand::TABLE_ID."=".$Brand.",width=".$Width.",height=".$Height.",depth=".$Depth.",description='".$Description."',updated_by=".$_SESSION[CoreUser::TABLE_ID],self::TABLE_ID."=".$ID);
		//echo $this->LastQuery();
	}

	public function Quickinsert()
	{
		$Title				=	trim($_POST['title']);
		$Category			= $_POST['category'];
		$Brand				= $_POST['brand'];
		$Description	= $_POST['brand'];
		$Width				= $_POST['width']? $_POST['width']:"0.00";
		$Height				= $_POST['height']? $_POST['height']:"0.00";
		$Depth				= $_POST['depth']? $_POST['depth']:"0.00";
		if($Title && $Category && $Brand)
			$_POST['id'] = Core::Insert(self::TABLE,'title,'.Category::TABLE_ID.','.Brand::TABLE_ID.',,creation_date,organization_id,created_by',"'".$Title."',".$Category.",".$Brand.",NOW(),".$_SESSION[CoreOrganization::TABLE_ID].",".$_SESSION[CoreUser::TABLE_ID]);
		else
			echo 402;
	}

	public function Validate()
	{
		echo self::ValidateValue("title",$_POST['title'],$_POST['actualtitle']);
	}
}
?>
