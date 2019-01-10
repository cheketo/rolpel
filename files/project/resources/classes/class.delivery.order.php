<?php

class DeliveryOrder
{

	use CoreSearchList, CoreCrud, CoreImage;

	const TABLE						= 'delivery_order';
	const TABLE_ID				= 'delivery_id';
	const SEARCH_TABLE		= 'delivery_order';
	const DEFAULT_IMG			= '../../../../skin/images/purchase/default/default.png';
	const DEFAULT_IMG_DIR	= '../../../../skin/images/purchase/default/';
	const IMG_DIR			= '../../../../skin/images/purchase/';

	public function __construct( $ID = 0 )
	{

			$this->ID = $ID;

			if( $this->ID != 0 )
			{

					$Data = Core::Select( self::SEARCH_TABLE, '*', self::TABLE_ID . "=" . $this->ID, self::TABLE_ID );

					$this->Data = $Data[ 0 ];

					$this->Data[ 'items' ] = Core::Select( DeliveryOrderItem::SEARCH_TABLE, '*', self::TABLE_ID . "=" . $this->ID, DeliveryOrderItem::TABLE_ID );

			}

	}

}

?>
