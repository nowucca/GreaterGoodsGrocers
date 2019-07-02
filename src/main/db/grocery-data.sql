--
-- Sample data for table `category`
--

INSERT INTO `category` (category_id, name)
VALUES (1001, 'Fresh Produce');

INSERT INTO `category` (category_id, name)
VALUES (1002, 'Meat');

INSERT INTO `category` (category_id, name)
VALUES (1003, 'Dairy');

INSERT INTO `category` (category_id, name)
VALUES (1004, 'Bakery');

--
-- Sample data for table `product`
--
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Bell Pepper', 170, 'organic red juicy', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Broccoli', 239, 'whole with stalks', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Cauliflower', 109, 'whole, not riced', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Carrots', 176, 'baby size', 1001);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Meat Patties', 229, '2 patties (1/2 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Sausages', 349, 'organic bratwurst (1 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Chicken Drumsticks', 259, 'free range (1/2 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Pork Chops', 355, 'trimmed, reduced fat (1 lb)', 1002);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Whole Milk', 189, '1 gallon', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Cheese', 119, 'cheddar 1/2 pound', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Greek Yogurt', 115, 'plain flavor 8oz', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Ice Cream in a Cone', 239, 'sugar waffle cone, assorted flavors', 1003);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Bagels', 159, 'sliced', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Croissants', 249, '', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Doughnuts', 129, 'assorted flavors', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('Chocolate Cake', 149, 'with chocolate filling', 1004);
