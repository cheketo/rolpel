
-- 01/01/2019
ALTER TABLE `delivery_order_item` CHANGE `order_id` `product_id` INT(11) NOT NULL;
ALTER TABLE `delivery_order_item` ADD `position` INT(5) NOT NULL AFTER `purchase_item_id`;
ALTER TABLE `purchase_item` ADD `quantity_reserved` INT(11) NOT NULL AFTER `days`;
