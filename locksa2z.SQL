/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : locksa2z

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2011-07-03 10:27:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cartReservedDate` varchar(255) DEFAULT NULL,
  `cartSessionId` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `cart_product`
-- ----------------------------
DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE `cart_product` (
  `cart_id` bigint(20) NOT NULL,
  `product_i` bigint(20) NOT NULL,
  PRIMARY KEY (`cart_id`,`product_i`),
  UNIQUE KEY `product_i` (`product_i`),
  KEY `FKD62ECED0BF2E70C7` (`cart_id`),
  KEY `FKD62ECED0228DBDB` (`product_i`),
  CONSTRAINT `FKD62ECED0228DBDB` FOREIGN KEY (`product_i`) REFERENCES `product` (`id`),
  CONSTRAINT `FKD62ECED0BF2E70C7` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cart_product
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `categoryDescription` varchar(255) DEFAULT NULL,
  `categoryImage` varchar(255) DEFAULT NULL,
  `categoryParentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DD211E9DC533CE` (`categoryParentId`),
  CONSTRAINT `FK6DD211E9DC533CE` FOREIGN KEY (`categoryParentId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('5', 'Key Lock', 'Needs key to unlock', null, null);
INSERT INTO `category` VALUES ('6', 'Double Key Lock', 'Needs Two keys to open single Lock', null, '5');
INSERT INTO `category` VALUES ('7', 'Electronic Lock', 'Needs digital code to open', null, null);
INSERT INTO `category` VALUES ('8', 'Digital Lock', 'Needs card to open', null, null);
INSERT INTO `category` VALUES ('9', 'Single Key Lock', 'Need only a key to open', null, '5');
INSERT INTO `category` VALUES ('10', 'Remote Lock', 'Need remote to open', null, '7');
INSERT INTO `category` VALUES ('11', 'Electronic Bottom Lock', 'Key Pad with matching code must be pressed', null, '7');
INSERT INTO `category` VALUES ('12', 'Normal Lock', 'Very normal keys', null, null);

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `shippingAddress` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'test', 'test', 'test', 'test', 'test@test.com', 'test', 'test', 'test', 'test', 'test');
INSERT INTO `customer` VALUES ('2', 'test1', 'test1', 'test1', 'test1', 'test1@test.com', 'test1', 'test1', 'test1', 'test1', 'test1');
INSERT INTO `customer` VALUES ('3', 'test3', 'test3', 'test3', 'test3', 'test3@test.com', 'test3', 'test3', 'test3', 'test3', 'test3');
INSERT INTO `customer` VALUES ('4', 'test4', 'test4', 'test4', 'test4', 'test4@email.com', 'test4', 'test4', 'test4', 'test4', 'test4');
INSERT INTO `customer` VALUES ('5', 'test5', 'test5q', 'test5', 'test5', 'test5@test.com', 'test5', 'test5', 'test5', 'test5', 'test5');
INSERT INTO `customer` VALUES ('6', 'test5', 'test5q', 'test5', 'test5', 'test5@test.com', 'test5', 'test5', 'test5', 'test5', 'test5');
INSERT INTO `customer` VALUES ('7', 'test6', 'test6', 'test6', 'test6', 'test6@test.com', 'test6', 'test6', 'test6', 'test6', 'test6');
INSERT INTO `customer` VALUES ('8', 'tttt', 'tttt', 'tttt', 'tttt', 'tttt@ttt.com', 'tttt', 'tttt', 'tttt', 'tttt', 'tttt');
INSERT INTO `customer` VALUES ('9', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr@gmail.com', 'rrrr', 'rrrr', 'rrrr', 'rrrr', 'rrrr');
INSERT INTO `customer` VALUES ('10', 'ram', 'ram', 'ram', 'ram', 'ram@mail.com', 'ram', 'ram', 'ram', 'ram', 'ram');
INSERT INTO `customer` VALUES ('11', 'test7', 'test7', 'test7', 'test7', 'test7@test.com', 'test7', 'test7', 'test7', 'test7', 'test7');
INSERT INTO `customer` VALUES ('12', 'Kusum Adhikari', 'ktm,nepal', 'bikalpa`', 'nepal', 'kusu@gmail.com', '123', '2134234', 'ktm', 'prk,nepal', 'kusu');
INSERT INTO `customer` VALUES ('13', 'Sujan Maharjan', 'ktm,Nepal', 'Bikalpa', 'Nepal', 'sujan@gmail.com', '123', '235412341234', 'Ktm', 'pkr,Nepal', 'sujan');
INSERT INTO `customer` VALUES ('14', 'test ', 'test ', 'test ', 'test ', 'test@test.com', 'test ', 'test ', 'test ', 'test ', 'test ');
INSERT INTO `customer` VALUES ('15', 'test ', 'test ', 'test ', 'test ', 'test@test.com', 'test ', 'test ', 'test ', 'test ', 'test ');
INSERT INTO `customer` VALUES ('16', 'test', 'test', 'test', 'test', 'test@test.com', 'test', 'test', 'test', 'test', 'test');
INSERT INTO `customer` VALUES ('17', 'test', 'test', 'test', 'test', 'test@test.com', '123', 'test', 'test', 'test', 'test');
INSERT INTO `customer` VALUES ('18', 'test', 'sald', 'sadlf', 'asdjfhas', 'test@test.com', 'test', 'asdf', 'asdklfj', 'askdfj', 'test');
INSERT INTO `customer` VALUES ('19', 'test1', 'test1', 'test1', 'China', 'test1@test.com', 'test1', 'test1', 'test1', 'test1', 'test1');
INSERT INTO `customer` VALUES ('20', 'test', 'testt', 'testt', 'FALSE', 'testt@test.com', 'testt', 'testt', 'testt', 'testt', 'testt');
INSERT INTO `customer` VALUES ('21', 'Sanjay Subedi', 'pokharan Nepal', 'Bikalpa', '149', 'thesanz07@gmail.com', '123', '2341234', 'Gandaki', 'Kathmandu, Nepal', 'sanj');
INSERT INTO `customer` VALUES ('22', 'Sanjay Subedi', 'pok', 'pok', 'Nepal', 'thesanz07@gmail.com', 'sanz', '2314124123', 'pok`', 'ktm', 'sanz');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `orderDate` varchar(255) DEFAULT NULL,
  `orderDeliveryAddress` varchar(255) DEFAULT NULL,
  `orderDeliveryCost` varchar(255) DEFAULT NULL,
  `orderDeliveryFirstname` varchar(255) DEFAULT NULL,
  `orderDeliveryLastName` varchar(255) DEFAULT NULL,
  `orderLastUpdate` varchar(255) DEFAULT NULL,
  `orderMemo` varchar(255) DEFAULT NULL,
  `orderStatus` varchar(255) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8D444F056C5670FE` (`userId`),
  CONSTRAINT `FK8D444F056C5670FE` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'test', 'test', 'test', null, null, 'test', null, null, 'delivered', '1');
INSERT INTO `orders` VALUES ('2', 'test2', 'test2', null, null, 'test2', null, 'test2', 'test2', 'test2', '1');
INSERT INTO `orders` VALUES ('3', 'test3', 'test3', null, 'test3', null, null, 'test3', null, 'test3', '1');
INSERT INTO `orders` VALUES ('4', 'test4', null, 'test4', null, null, 'test4', 'test4', 'test4', null, '1');

-- ----------------------------
-- Table structure for `orders_product`
-- ----------------------------
DROP TABLE IF EXISTS `orders_product`;
CREATE TABLE `orders_product` (
  `orders_id` bigint(20) NOT NULL,
  `product_i` bigint(20) NOT NULL,
  PRIMARY KEY (`orders_id`,`product_i`),
  UNIQUE KEY `product_i` (`product_i`),
  KEY `FKC2B22195228DBDB` (`product_i`),
  KEY `FKC2B221959EC20F67` (`orders_id`),
  CONSTRAINT `FKC2B22195228DBDB` FOREIGN KEY (`product_i`) REFERENCES `product` (`id`),
  CONSTRAINT `FKC2B221959EC20F67` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders_product
-- ----------------------------

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `detailName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK57F7A1EF8678BEC` (`parent_id`),
  CONSTRAINT `FK57F7A1EF8678BEC` FOREIGN KEY (`parent_id`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'ROLE_Admins', '1', 'Admins');
INSERT INTO `permission` VALUES ('2', 'ROLE_ManageAdminsUsers', '2', 'Manage Admins');
INSERT INTO `permission` VALUES ('3', 'ROLE_ManageAdminsUsersAdd', '2', 'Add Admins');
INSERT INTO `permission` VALUES ('4', 'ROLE_ManageAdminsUsersDelete', '2', 'Delete Admins');
INSERT INTO `permission` VALUES ('5', 'ROLE_ManageAdminsUsersEdit', '2', 'Edit Admins');
INSERT INTO `permission` VALUES ('6', 'ROLE_ManageOrders', '6', 'Manage Orders');
INSERT INTO `permission` VALUES ('7', 'ROLE_ManageOrdersProductList', '6', 'Product List in Orders');
INSERT INTO `permission` VALUES ('8', 'ROLE_ManageCategory', '8', 'Manage Category');
INSERT INTO `permission` VALUES ('9', 'ROLE_ManageCategoryAdd', '8', 'Add Category');
INSERT INTO `permission` VALUES ('10', 'ROLE_ManageCategoryDelete', '8', 'Delete Category');
INSERT INTO `permission` VALUES ('11', 'ROLE_ManageCategoryEdit', '8', 'Edit Category');
INSERT INTO `permission` VALUES ('12', 'ROLE_ManageProduct', '12', 'Manage Product');
INSERT INTO `permission` VALUES ('13', 'ROLE_ManageProductEdit', '12', 'Edit Product');
INSERT INTO `permission` VALUES ('14', 'ROLE_ManageProductAdd', '12', 'Add Product');
INSERT INTO `permission` VALUES ('15', 'ROLE_ManageProductDelete', '12', 'Delete Product');
INSERT INTO `permission` VALUES ('16', 'ROLE_ManageInventory', '16', 'Manage Inventory');
INSERT INTO `permission` VALUES ('17', 'ROLE_ManageInventorySave', '16', 'Save Inventory');
INSERT INTO `permission` VALUES ('18', 'ROLE_ManageRoles', '18', 'Manage Roles');
INSERT INTO `permission` VALUES ('19', 'ROLE_ManageRolesAdd', '18', 'Add Roles');
INSERT INTO `permission` VALUES ('20', 'ROLE_ManageRolesDelete', '18', 'Delete Roles');
INSERT INTO `permission` VALUES ('21', 'ROLE_ManageRolesEdit', '18', 'Edit Roles');
INSERT INTO `permission` VALUES ('22', 'ROLE_ManageOrdersDelete', '6', 'Delete Orders ');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `productAddedDate` varchar(255) DEFAULT NULL,
  `productBackSets` varchar(255) DEFAULT NULL,
  `productBarCodeId` varchar(255) DEFAULT NULL,
  `productDescription` varchar(255) DEFAULT NULL,
  `productFinishColor` varchar(255) DEFAULT NULL,
  `productGrade` varchar(255) DEFAULT NULL,
  `productImage` varchar(255) DEFAULT NULL,
  `productKeyTypes` varchar(255) DEFAULT NULL,
  `productLeverDesign` varchar(255) DEFAULT NULL,
  `productPrice` varchar(255) DEFAULT NULL,
  `productQuantity` varchar(255) DEFAULT NULL,
  `productType` varchar(255) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50C664CF66944424` (`categoryId`),
  CONSTRAINT `FK50C664CF66944424` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('4', 'lock1', null, 'test', 'test', 'test', 'test', 'test', '8667b2_lock_img.jpg', 'test', 'test', 'testt', '100', 'test', '9');
INSERT INTO `product` VALUES ('5', 'lock2', null, 'lock2', 'lock2', 'lock2', 'lock2', 'lock2', '5302b2_key_bg.png', 'lock2', 'lock2', 'lock2', '34', 'lock2', '9');
INSERT INTO `product` VALUES ('6', 'Lock3', null, 'Lock3', 'Lock3', 'Lock3', 'Lock3', 'Lock3', '2993b2_DSCF3964.JPG', 'Lock3', 'Lock3', 'Lock3', '44', 'Lock3', '9');
INSERT INTO `product` VALUES ('7', 'lock4', null, 'lock4', 'lock4', 'lock4', 'lock4', 'lock4', '9130b2_key_bg.jpg', 'lock4', 'lock4', 'lock4', 'lock4', 'lock4', '9');
INSERT INTO `product` VALUES ('8', 'Lock5', null, 'Lock5', 'Lock5', 'Lock5', 'Lock5', 'Lock5', '9395b2_images.jpg', 'Lock5', 'Lock5', 'Lock5', 'Lock5', 'Lock5', '9');
INSERT INTO `product` VALUES ('9', 'Lock6', null, 'Lock5', 'Lock5', 'Lock5', 'Lock5', 'Lock5', 'No image', 'Lock5', 'Lock5', 'Lock5', 'Lock5', 'Lock5', '9');
INSERT INTO `product` VALUES ('10', 'Lock7', null, 'Lock7', 'Lock7', 'Lock7', 'Lock7', 'Lock7', '3074b2_Vodafone.JPG', 'Lock7', 'Lock7', 'Lock7', 'Lock7', 'Lock7', '9');

-- ----------------------------
-- Table structure for `registrationmodel`
-- ----------------------------
DROP TABLE IF EXISTS `registrationmodel`;
CREATE TABLE `registrationmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of registrationmodel
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'SuperAdmin');
INSERT INTO `role` VALUES ('2', 'SubAdmin');
INSERT INTO `role` VALUES ('3', 'test');

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  KEY `FKBD40D538F03B6907` (`role_id`),
  KEY `FKBD40D53837A880A7` (`permission_id`),
  CONSTRAINT `FKBD40D53837A880A7` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FKBD40D538F03B6907` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('1', '5');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('2', '2');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('2', '4');
INSERT INTO `role_permission` VALUES ('2', '5');
INSERT INTO `role_permission` VALUES ('1', '6');
INSERT INTO `role_permission` VALUES ('1', '7');
INSERT INTO `role_permission` VALUES ('1', '8');
INSERT INTO `role_permission` VALUES ('1', '9');
INSERT INTO `role_permission` VALUES ('1', '10');
INSERT INTO `role_permission` VALUES ('1', '11');
INSERT INTO `role_permission` VALUES ('1', '12');
INSERT INTO `role_permission` VALUES ('1', '13');
INSERT INTO `role_permission` VALUES ('1', '14');
INSERT INTO `role_permission` VALUES ('1', '15');
INSERT INTO `role_permission` VALUES ('1', '16');
INSERT INTO `role_permission` VALUES ('1', '17');
INSERT INTO `role_permission` VALUES ('1', '18');
INSERT INTO `role_permission` VALUES ('1', '19');
INSERT INTO `role_permission` VALUES ('1', '20');
INSERT INTO `role_permission` VALUES ('1', '21');
INSERT INTO `role_permission` VALUES ('1', '22');
INSERT INTO `role_permission` VALUES ('3', '6');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('3', '22');
INSERT INTO `role_permission` VALUES ('3', '7');

-- ----------------------------
-- Table structure for `shopdetails`
-- ----------------------------
DROP TABLE IF EXISTS `shopdetails`;
CREATE TABLE `shopdetails` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shopAddress` varchar(255) DEFAULT NULL,
  `shopDeliveryCost` varchar(255) DEFAULT NULL,
  `shopDescription` varchar(255) DEFAULT NULL,
  `shopEmail` varchar(255) DEFAULT NULL,
  `shopPhone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shopdetails
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Suraj Poudel', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'Sanjay ', 'subadmin', 'subadmin');
INSERT INTO `user` VALUES ('3', 'purushottam', 'puru', 'puru');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK143BF46AF03B6907` (`role_id`),
  KEY `FK143BF46A95662CE7` (`user_id`),
  CONSTRAINT `FK143BF46A95662CE7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK143BF46AF03B6907` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('3', '3');
