<?php

class PurchaseItem
{
	use CoreSearchList,CoreCrud;//,CoreImage;

	const TABLE			= 'purchase_item';
	const TABLE_ID	= 'item_id';
	// const SEARCH_TABLE		= 'view_quotation_list';
	// const DEFAULT_IMG		= '../../../../skin/images/orders/default/default2.png';
	// const DEFAULT_IMG_DIR	= '../../../../skin/images/orders/default/';
	// const IMG_DIR			= '../../../../skin/images/orders/';

	public function __construct($ID=0)
	{
		$this->ID = $ID;
		if($this->ID!=0)
		{
			$Data = Core::Select(Purchase::SEARCH_TABLE,'*',self::TABLE_ID."=".$this->ID);
			$this->Data = $Data[0];
		}
	}

	public static function DeleteItems($PurchaseID)
	{
		return Core::Delete(self::TABLE,Purchase::TABLE_ID."=".$PurchaseID);
	}
}
