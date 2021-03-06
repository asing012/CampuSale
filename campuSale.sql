<<<<<<< HEAD
use campuSale;


drop table if exists items;

create table items(
	id int primary key auto_increment not null, 
	price numeric(6,2), 
	sellerID int
	references seller(sellerID)
	on update CASCADE 
	on delete CASCADE, 
	description text, 
	status enum("1","0"), 
	paymentType int, 
	tagID int
	references tags(tagID)
	on update CASCADE
	on delete RESTRICT
)ENGINE=INNODB;

drop table if exists images;

create table images(
	imageID int primary key not null, 
	itemID int
	references items(id)
	on update CASCADE
	on delete RESTRICT, 
	image binary
)ENGINE=INNODB;

drop table if exists cart;

create table cart(
	cartID int primary key not null, 
	total numeric(6,2), 
	itemIDs int
);

drop table if exists tags;

create table tags(
	tagID int primary key auto_increment not null,
	tagName char(20)
);

drop table if exists ratings;

create table ratings(
	buyerId int not null
	references buyer(buyerID)
	on update CASCADE
	on delete RESTRICT, 
	sellerId int not null
	references seller(sellerID), 
	comment text, 
	rating varchar(5) not null
)ENGINE=INNODB;

drop table if exists students;

create table students(
	id int primary key not null, 
	email char(24), 
	firstName char(20), 
	lastName char(20), 
	phone int(10), 
	zip char(5)
);

drop table if exists payment;

create table payment(
	paymentID int primary key not null,
	paymentType char(10)
);

drop table if exists seller;

create table seller(
	sellerID int primary key not null 
	references students(id)
	on update CASCADE
	on delete RESTRICT
)ENGINE=INNODB;

drop table if exists buyer;

create table buyer(
	buyerID int primary key not null 
	references students(id)
	on update CASCADE
	on delete RESTRICT
)ENGINE=INNODB;
=======
USE campuSale;

DROP TABLE IF EXISTS items;
CREATE TABLE items (
  id int(11) NOT NULL AUTO_INCREMENT,
  price decimal(6,2) DEFAULT NULL,
  sellerID int(11) DEFAULT NULL,
  description text,
  status enum('1','0') DEFAULT NULL,
  paymentType int(11) DEFAULT NULL,
  tagID int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS cart;
CREATE TABLE cart (
  cartID int(11) NOT NULL,
  total decimal(6,2) DEFAULT NULL,
  itemIDs int(11) DEFAULT NULL,
  PRIMARY KEY (cartID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS images;
CREATE TABLE images (
  imageID int(11) NOT NULL,
  itemID int(11) DEFAULT NULL,
  image binary(1) DEFAULT NULL,
  PRIMARY KEY (imageID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS payment;
CREATE TABLE payment (
  paymentID int(11) NOT NULL,
  paymentType char(10) DEFAULT NULL,
  PRIMARY KEY (paymentID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
  buyerId int(11) NOT NULL,
  sellerId int(11) NOT NULL,
  comment text,
  rating varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id int(11) NOT NULL,
  email char(24) DEFAULT NULL,
  firstName char(20) DEFAULT NULL,
  lastName char(20) DEFAULT NULL,
  phone int(10) DEFAULT NULL,
  zip char(5) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS seller;
CREATE TABLE seller (
  sellerID int(11) NOT NULL,
  PRIMARY KEY (sellerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS buyer;
CREATE TABLE buyer (
  buyerID int(11) NOT NULL,
  PRIMARY KEY (buyerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
  tagID int(11) NOT NULL AUTO_INCREMENT,
  tagName char(20) DEFAULT NULL,
  PRIMARY KEY (tagID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


>>>>>>> development
