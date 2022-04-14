#create database
CREATE DATABASE IF NOT EXISTS FetchRewards;
USE FetchRewards;

DROP TABLE brands;
DROP TABLE users;
DROP TABLE receipts;
DROP TABLE Itemslist;

#create table brands
CREATE TABLE IF NOT EXISTS brands(
brandId int(24) PRIMARY KEY,
barcode varchar(25) DEFAULT NULL,
brandCode varchar(30) DEFAULT NULL,
category varchar(30) DEFAULT NULL,
categoryCode varchar(30) DEFAULT NULL,
topBrand boolean DEFAULT NULL,
name varchar(60) DEFAULT NULL,
oid varchar(30) DEFAULT NULL,
ref varchar(10) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8MB4;

DESC brands;

#create table users
CREATE TABLE IF NOT EXISTS users(
userId int(24) PRIMARY KEY,
state varchar(3) DEFAULT NULL,
createdDate timestamp DEFAULT NULL,
lastLogin timestamp DEFAULT NULL,
role varchar(11) DEFAULT NULL,
active boolean DEFAULT NULL,
signUpSource varchar(6) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8MB4;

DESC users;

#create table receipts
CREATE TABLE IF NOT EXISTS receipts(
receiptId varchar(24) PRIMARY KEY,
FOREIGN KEY (userId) REFERENCES users(userId),
bonusPointsEarned int(5) DEFAULT NULL,
bonusPointsEarnedReason varchar(83) DEFAULT NULL,
createDate timestamp DEFAULT NULL,
dateScanned timestamp DEFAULT NULL,
finishedDate timestamp DEFAULT NULL,
modifyDate timestamp DEFAULT NULL,
pointsAwardedDate timestamp DEFAULT NULL,
pointsEarned float DEFAULT NULL,
purchaseDate timestamp DEFAULT NULL,
purchasedItemCount int(5) DEFAULT NULL,
rewardsReceiptStatus varchar(9) DEFAULT NULL,
totalSpent int(7) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8MB4;

DESC receipts;

#create table Itemslist
CREATE TABLE IF NOT EXISTS Itemslist(
FOREIGN KEY (receiptId) REFERENCES receipts(receiptId),
barcode	varchar(13) DEFAULT NULL,
description	varchar(155) DEFAULT NULL,
finalPrice float DEFAULT NULL,
itemPrice float DEFAULT NULL,
userFlaggedBarcode int(12) DEFAULT NULL,
userFlaggedDescription varchar(60) DEFAULT NULL,
userFlaggedNewItem boolean DEFAULT NULL,
userFlaggedPrice float DEFAULT NULL,
userFlaggedQuantity int(3) DEFAULT NULL,
needsFetchReview boolean DEFAULT NULL,
needsFetchReviewReason varchar(30) DEFAULT NULL,
patnerItemId int DEFAULT NULL,
pointsNotAwardedReason varchar(40) DEFAULT NULL,
pointsPayerId int(24) DEFAULT NULL,
preventTargetGapPoints boolean DEFAULT NULL,
quantityPurchased int(4) DEFAULT NULL,
rewardsGroup varchar(66) DEFAULT NULL,
rewardsProductPartnerId varchar(24) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8MB4;

DESC Itemslist;

#create table users
CREATE TABLE IF NOT EXISTS product(
barcode int(25) PRIMARY KEY,
description varchar(100) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8MB4;
