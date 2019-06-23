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
VALUES ('bell pepper', 170, 'organic red juicy', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('broccoli', 239, 'whole with stalks', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('cauliflower', 109, 'whole, not riced', 1001);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('carrots', 176, 'baby size', 1001);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('meat patties', 229, '2 patties (1/2 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('sausages', 349, 'organic bratwurst (1 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('chicken drumsticks', 259, 'free range (1/2 lb)', 1002);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('pork chops', 355, 'trimmed, reduced fat (1 lb)', 1002);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('whole milk', 189, '1 gallon', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('cheese', 119, 'cheddar 1/2 pound', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('greek yogurt', 115, 'plain flavor 8oz', 1003);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('fat free sour cream', 239, 'a healthier alternative, 8oz', 1003);

INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('bagels', 159, 'sliced', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('bread', 249, 'one loaf sliced', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('doughnuts', 129, 'assorted flavors', 1004);
INSERT INTO `product` (`name`, price, description, category_id)
VALUES ('chocolate cake', 149, 'with chocolate filling', 1004);
