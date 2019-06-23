--
-- Sample data for table `category`
--
INSERT INTO `category` (category_id, name)
VALUES (1, 'sample-category-1');

INSERT INTO `category` (category_id, name)
VALUES (2, 'sample-category-2');

INSERT INTO `category` (category_id, name)
VALUES (3, 'sample-category-3');

INSERT INTO `category` (category_id, name)
VALUES (4, 'sample-category-4');


--
-- Sample data for table `product`
--
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (1, 'product-1-1', 110, 'product-1-1', 1);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (2, 'product-1-2', 120, 'product-1-2', 1);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (3, 'product-1-3', 130, 'product-1-3', 1);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (4, 'product-1-4', 140, 'product-1-4', 1);

INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (5, 'product-2-1', 210, 'product-2-1', 2);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (6, 'product-2-2', 220, 'product-2-2', 2);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (7, 'product-2-3', 230, 'product-2-3', 2);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (8, 'product-2-4', 240, 'product-2-4', 2);


INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (9, 'product-3-1', 310, 'product-3-1', 3);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (10, 'product-3-2', 320, 'product-3-2', 3);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (11, 'product-3-3', 330, 'product-3-3', 3);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (12, 'product-3-4', 340, 'product-3-4', 3);


INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (13, 'product-4-1', 410, 'product-4-1', 4);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (14, 'product-4-2', 420, 'product-4-2', 4);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (15, 'product-4-3', 430, 'product-4-3', 4);
INSERT INTO `product` (product_id, `name`, price, description, category_id)
VALUES (16, 'product-4-4', 440, 'product-4-4', 4);
