DROP DATABASE IF Exists online_site;
CREATE DATABASE online_site;



CREATE TABLE online_site.address(
addressId bigint NOT NULL auto_increment,
houseNo varchar(10) Not null,
societyName varchar(20) null,
streetNo varchar(10) not null,
landmark tinytext null,
district varchar(20) not null,
subDistrict varchar(20) not null,
city varchar(30) not null,
state varchar(20) not null,
country varchar(30) not null,
pinCode int not null,
PRIMARY KEY(addressId),
UNIQUE(addressId)
);

CREATE TABLE online_site.customer(
customerId bigint NOT NULL auto_increment,
FirstName varchar(50) NULL,
LastName varchar(50) NULL,
middleName varchar(50) NULL,
userName varchar(50) NOT NULL,
passwordHash varchar(100) NOT NULL,
mobile VARCHAR(15) NOT NULL,
staysAt bigint not null,
PRIMARY KEY(customerId),
UNIQUE(customerId),
foreign key (staysAt) references online_site.address(addressId)
ON DELETE CASCADE
);

CREATE table online_site.seller(
sellerId bigint not null auto_increment,
sellerName varchar(50) null,
storeName varchar(50) not null,
sellerPassword varchar(20) not null,
sellerRatings int null default 0,
mobile varchar(20) null,
email varchar(80) null,
sellerCode varchar(30) not null,
addressId bigint not null,
PRIMARY KEY(sellerId),
UNIQUE(sellerId),
foreign key (addressId) references online_site.address(addressId)
on delete cascade
);



CREATE table online_site.order(
orderID bigint not null auto_increment,
PlacedOn datetime default now(),
estoimatedDelivery datetime null,
deliveryStatus ENUM ('Failed','packed','shipped','out for delivery','returned','delivered','to be packed') default 'to be packed',
orderedBy bigint not null,
soldBy bigint not null,
deliverTo bigint not null,
PRIMARY KEY(OrderId),
foreign key (orderedBy) references online_site.customer(customerId)
ON DELETE CASCADE,
foreign key (soldBy) references online_site.seller(sellerId)
ON DELETE CASCADE,
foreign key (deliverTo) references online_site.address(addressId)
ON DELETE CASCADE
);










CREATE table online_site.product(
productID bigint not null auto_increment,
productName varchar(50) not null,
productDescription text null,
weight int null,
dimentions varchar(20) null,
manufacturer varchar(50),
PRIMARY KEY(productId),
UNIQUE(productId)
);




CREATE table online_site.productReview(
reviewId bigint not null auto_increment,
review text null,
reviewRating int not null,
reviewVotes int Not null default 0,
productId bigint not null,
customerId bigint not null,
PRIMARY KEY(reviewId),
Foreign key (productId) references online_site.product(productId)
on delete cascade,
Foreign key (customerId) references online_site.customer(customerId)
on delete cascade
);



CREATE TABLE online_site.sells(
productId bigint not null,
sellerID bigint not null,
foreign key (productId) references online_site.product(productId)
on delete cascade,
foreign key (sellerId) references online_site.seller(sellerId)
on delete cascade
);



Create table online_site.auction(
productId bigint not null,
manufactureYear year null,
age int null,
rarity varchar(10) null,
materialsUsed varchar(30) null,
restoration ENUM ('t','f') default 'f',
startingPrice int not null,
latestBid int not null,
authenticationCode varchar(20) null,
foreign key (productId) references online_site.product(productId)
on delete cascade,
PRIMARY KEY(productId),
unique(ProductId)
);




Create table online_site.new(
productId bigint not null,
warranty int null,
price int not null,
stock int not null default 0,
discount int not null default 0,
PRIMARY KEY(productId),
foreign key (productId) references online_site.product(productId)
on delete cascade
);




CREATE table online_site.secondHand(
productId bigint not null,
Inwarranty ENUM ('y','n') default 'n',
customerId bigint null,
dateListed datetime default now(),
manufactureYear year null,
PRIMARY KEY(productId),
foreign key (productId) references online_site.product(productId)
on delete cascade,
foreign key (customerId) references online_site.customer(customerId)
on delete cascade
);


insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (1, '2', 'Paunsford', '81275', 'Petterle', 'Northport', 'Montana', 'Goba', 'Alquízar', 'Ethiopia', '792');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (2, '2', 'Pavlishchev', '0330', 'Saint Paul', 'Transport', 'Killdeer', 'Krasnoznamensk', 'Föglö', 'Russia', '6');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (3, '23143', 'Marchington', '53', 'Mallard', 'Bay', 'Graceland', 'Hashimoto', 'Mallawī', 'Japan', '444');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (4, '06', 'Klaffs', '88', 'Sauthoff', 'Atwood', 'Caliangt', 'Misheronskiy', 'Bascaron', 'Russia', '7820');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (5, '708', 'McVicker', '1738', 'Gulseth', 'Green Ridge', 'Portage', 'Sukorejo', 'Saidpur', 'Indonesia', '99');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (6, '7378', 'Zaniolini', '11104', 'Hoard', 'Del Sol', 'Gulseth', 'Xiangrong', 'Sindang', 'China', '4406');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (7, '88282', 'Bresnahan', '8136', 'Lawn', 'Columbus', 'Erie', 'Wonopringgo', 'Hradec nad Moravici', 'Indonesia', '38');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (8, '46', 'Eriksson', '5127', 'Talmadge', 'Aberg', 'Shelley', 'Aguas Corrientes', 'Rio Branco', 'Uruguay', '9');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (9, '57', 'Wiltshier', '11193', 'Bluestem', 'Armistice', 'Lawn', 'Randu', 'Bronx', 'Indonesia', '53');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (10, '50169', 'Callander', '6103', 'Derek', 'Forest', 'Golden Leaf', 'Temenggungan', 'Gllogjan', 'Indonesia', '992');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (11, '34', 'Bevan', '70344', 'Becker', 'Carberry', 'Jenifer', 'Shijing', 'Bronx', 'China', '9016');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (12, '2202', 'Condit', '8720', 'Grim', 'Steensland', 'Toban', 'San Carlos de Bariloche', 'Ubiaja', 'Argentina', '02114');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (13, '04', 'Coat', '5465', 'Fordem', 'Vera', 'Lakewood Gardens', 'La Luz', 'Lewopao', 'Venezuela', '4652');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (14, '11909', 'Monkhouse', '82903', 'Muir', 'Summerview', 'Reindahl', 'Eldoret', 'Khasavyurt', 'Kenya', '63');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (15, '964', 'Villa', '284', 'Bultman', 'Texas', 'East', 'Dasha', 'Dubna', 'China', '9');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (16, '55', 'Rubinfajn', '87', 'Warner', 'Southridge', 'Fremont', 'Sumberjati', 'Tiandian', 'Indonesia', '58068');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (17, '3', 'Chilles', '61', 'Sullivan', 'Truax', 'Coolidge', 'Zhengcun', 'Brusartsi', 'China', '368');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (18, '56734', 'Dobrowolny', '2', 'Mcbride', 'Bartillon', 'Petterle', 'Nueva Requena', 'Osieck', 'Peru', '487');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (19, '149', 'Blues', '409', 'Thompson', 'Dexter', 'Killdeer', 'Montpellier', 'Pampamarca', 'France', '7355');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (20, '3995', 'Caplin', '0883', 'Emmet', 'Meadow Vale', 'Caliangt', 'Tengah', 'Lawrenceville', 'Indonesia', '299');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (21, '282', 'Le land', '59', 'Arrowood', 'Dapin', 'Warbler', 'Mouzourás', 'Atiquizaya', 'Greece', '5050');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (22, '7459', 'Alsina', '096', 'Heath', 'Debra', 'Namekagon', 'Montluçon', 'Brejo Santo', 'France', '03');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (23, '03742', 'Defew', '30994', 'Brentwood', 'Shopko', 'Dexter', 'Wulan Hada', 'Străşeni', 'China', '93252');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (24, '81', 'Fincher', '1', 'Kings', 'Eastlawn', 'Independence', 'Morocelí', 'Kenscoff', 'Honduras', '641');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (25, '22', 'Drinkhall', '22986', 'Johnson', 'Bayside', 'Farmco', 'Aryiropoúlion', 'Ocongate', 'Greece', '675');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (26, '9', 'McLemon', '9476', 'Vermont', 'Garrison', 'Stone Corner', 'P’rimorsk’oe', 'Al Ḩawāmidīyah', 'Georgia', '03434');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (27, '996', 'Quadri', '62', 'Garrison', 'Golden Leaf', 'Gale', 'Kipen’', 'Bergen', 'Russia', '8528');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (28, '9', 'Varrow', '20', 'Valley Edge', 'Mayfield', 'Warbler', 'Az Zuwaytīnah', 'Germiston', 'Libya', '942');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (29, '26', 'Plume', '46008', 'Springview', 'Oxford', 'Canary', 'Brody', 'Sinabang', 'Poland', '13238');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (30, '33441', 'Hoonahan', '81', 'Elka', 'Vera', 'Sauthoff', 'Uttaradit', 'Kiev', 'Thailand', '847');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (31, '1', 'Shapter', '5', 'Randy', 'Steensland', 'Brickson Park', 'Phú Khương', 'Arnhem', 'Vietnam', '3151');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (32, '431', 'Cottham', '197', 'Maryland', 'John Wall', 'Golf', 'Xinbao', 'Feikeng', 'China', '96353');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (33, '09570', 'Barkly', '1518', 'Sachs', 'Evergreen', 'Rieder', 'Tieremu', 'Luksuhin', 'China', '2047');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (34, '56', 'Riveles', '9843', 'Cascade', 'Anniversary', 'Daystar', 'Boto', 'Rio Claro', 'Indonesia', '27491');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (35, '34', 'Waterfall', '00758', 'Barnett', 'Logan', 'Upham', 'Livádion', 'Edineţ', 'Greece', '7101');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (36, '2', 'Matiashvili', '5803', 'Huxley', 'Vera', 'Coleman', 'Sapu Padidu', 'Naikoten Dua', 'Philippines', '1');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (37, '01', 'Craggs', '0', 'Pearson', 'Kingsford', 'Burrows', 'Petit Valley', 'Sansanné-Mango', 'Trinidad and Tobago', '3');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (38, '75033', 'Tomkies', '3225', 'Maple', 'Dawn', 'Melrose', 'Jizhou', 'Halat', 'China', '69');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (39, '26236', 'Drinkhall', '16034', 'Westend', 'Starling', 'Beilfuss', 'Merklín', 'Topdac', 'Czech Republic', '3586');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (40, '579', 'Biggans', '7', 'Darwin', 'David', 'Riverside', 'Iwanuma', 'Nanshui', 'Japan', '4');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (41, '9547', 'Cancellario', '4', 'Glendale', 'Nova', 'Schurz', 'Gýtheio', 'Tumpukrenteng', 'Greece', '4758');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (42, '1090', 'Jersch', '81617', 'Farmco', 'Independence', 'Eliot', 'Zambujal', 'Khotiv', 'Portugal', '1');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (43, '9', 'Putterill', '7970', 'Manufacturers', 'Gateway', 'Division', 'Wangfu', 'Paracatu', 'China', '520');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (44, '8056', 'Kaminski', '1', 'Vernon', 'Scoville', 'Killdeer', 'Bagani', 'Kořenov', 'Namibia', '264');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (45, '7562', 'Vasin', '8', 'Oak', 'Sutherland', 'Dovetail', 'Zaprudnya', 'Butubut Norte', 'Russia', '5163');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (46, '365', 'Bettis', '0', 'Bartelt', 'Carberry', 'La Follette', 'Guanting', 'Leitões', 'China', '50646');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (47, '164', 'Boliver', '958', 'Quincy', 'Lighthouse Bay', 'Hollow Ridge', 'Tomislavgrad', 'Tarbes', 'Bosnia and Herzegovina', '0599');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (48, '81780', 'Kenset', '7', 'Drewry', 'Pankratz', 'Forest Run', 'Alor Star', 'Bator', 'Malaysia', '336');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (49, '14136', 'Realff', '63625', 'Lunder', 'Logan', 'Bellgrove', 'Ljungsbro', 'Sinmak', 'Sweden', '3');
insert into online_site.address (addressId, houseNo, societyName, streetNo, landmark, district, subDistrict, city, state, country, pinCode) values (50, '0906', 'Blatcher', '99206', 'Eagle Crest', 'Hoard', 'Cherokee', 'Mayskiy', 'Kristiansand S', 'Russia', '696');



insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (1, 1, 'Kassandra', 'Cookes', 'Anderton', 'kanderton0', '$2a$04$ykcCrxH6KyvlhuVKR1FcLeRlQOp4PTq.uPl7AUU/WbZfPgJ8WqSgy', '896-927-4662');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (2, 2, 'Jenda', 'Leheude', 'Tillerton', 'jtillerton1', '$2a$04$glXTZP.prIXJFlnmeydFDO1YmedYiXz9gUA/ZiZWGWdEv0i.akFRi', '759-749-3771');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (3, 3, 'Dolly', 'Sailor', 'Reid', 'dreid2', '$2a$04$l4aWmXzycO4CU9g9gL83lenp/Av6w9M0OZMp9uEzSowWmJ1Wh3ipi', '285-301-1794');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (4, 4, 'Shay', 'Stoade', 'Procter', 'sprocter3', '$2a$04$OvBlUaDe1L0agvtfexF9MO9ZiCrs42BlVIBWfGBzGL438R2MtDP5.', '235-389-4636');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (5, 5, 'Ardelis', 'Llewellyn', 'Maytom', 'amaytom4', '$2a$04$ljLCY1OE1yWNfs35w/WiRuhTg2oDfM1DBY5fz./n0xCME3qEv3iBK', '930-343-8214');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (6, 6, 'Deeann', 'McShea', 'McPhelimy', 'dmcphelimy5', '$2a$04$bnk5/cSYIfAq3jXolDKvKO0UD0c1wx4wKyxrWfyCzkixb.3LOPzYq', '138-256-4285');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (7, 7, 'Bernie', 'Dollen', 'Sale', 'bsale6', '$2a$04$u7wHn0EzIfgbaqq0wynHAe3evfaVOfLNodgtg0vh99BSJWgTWBHkK', '287-157-2098');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (8, 8, 'Shani', 'Lottrington', 'Ainscough', 'sainscough7', '$2a$04$bjmFthZ3T2t/gNvR8owP8uaZ4rQenRgpiZc5oWUvSVY94Tz8OdkN6', '704-249-7451');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (9, 9, 'Tory', 'Guyan', 'Baldinotti', 'tbaldinotti8', '$2a$04$NMsJQh7EqyaWGqMWRuUEHOQmFhYPsQIRjfGdhVjfnY19KCJ5rE3me', '650-293-9593');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (10, 10, 'Antin', 'Blaiklock', 'Goadbie', 'agoadbie9', '$2a$04$abEZ8xekkH4My8k4WlsYKOnrg7iUT.60C.x2D0PlylMRlCTAL.DZu', '331-833-0043');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (11, 11, 'Fenelia', 'Cotter', 'Cratere', 'fcraterea', '$2a$04$2n4qIxLGWlB6PgTZAd2nKONF8gtXq2zICRwAadqChfMrNghEdQknC', '658-619-8636');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (12, 12, 'Sutherland', 'Titchen', 'Adacot', 'sadacotb', '$2a$04$A0oSMPpmKRvHlsuNZahRm.uAP70VyaKMr9FYPd.OGH6DmCA9nMibi', '219-955-1402');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (13, 13, 'Jocelin', 'Brecon', 'Gladyer', 'jgladyerc', '$2a$04$AwvoW1IH5eEhxVHZwdx99.JlOuqu.oX8zupcC2Vm0ScNd4Fd09R6O', '259-909-2315');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (14, 14, 'Kit', 'Vallender', 'Gofford', 'kgoffordd', '$2a$04$Hyq7JV/tXMblpatlopes9.PODjGwOfab4hoqgmdfj3In6HDoK24N.', '394-861-1250');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (15, 15, 'Laughton', 'Ainge', 'Churchill', 'lchurchille', '$2a$04$yBjlvJ3ixff7q2.9An5iw.636tXmyM3TbZxKNqV7USn1uWQHhkgDG', '823-426-9924');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (16, 16, 'Finn', 'Melrose', 'Cinderey', 'fcindereyf', '$2a$04$1xOziI7NRroV2rEsHH.IOukJ640h1vjWlma2Y6LJQu9FBwFQf18e.', '722-513-5853');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (17, 17, 'Clarissa', 'Gutridge', 'Ravenshear', 'cravenshearg', '$2a$04$YjoU5zH1DW8.TilO2slVEORAN/tMfrmyI.6G31L786r5rAfmp61OW', '142-167-5163');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (18, 18, 'Lemmy', 'Cockin', 'Ferrulli', 'lferrullih', '$2a$04$ogAbbMb2343oMdu57hzcgOw7cXYy5fivVEwAMGBy4oGjol/GK1uOi', '726-660-6033');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (19, 19, 'Wyn', 'Farnhill', 'Verriour', 'wverriouri', '$2a$04$7ciHNfTx4Z9bh.qarzcKB.FbR4n96smNsy6cJPHCNXpgTRCnYHNb2', '965-137-4504');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (20, 20, 'Fae', 'Buckett', 'Forshaw', 'fforshawj', '$2a$04$sTCPr6eAAyykOqb8vh0Vi.rXwRJQM8j8/poR9ij8jxAPP3FAyYL7S', '985-171-3531');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (21, 21, 'Alfi', 'Wilds', 'Damarell', 'adamarellk', '$2a$04$IHRpiM83V06osOajI1fjSexLASn8.YphfbV3XUE0HNNNqdurd98pW', '247-698-3855');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (22, 22, 'Lindie', 'Stawell', 'Mandrake', 'lmandrakel', '$2a$04$1rFPvzOixm3fg9G2M0rE0.uFcEBvXgcfy2nccGtlNApQEVZhSOOMi', '540-260-4680');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (23, 23, 'Gratia', 'Hawley', 'Chasier', 'gchasierm', '$2a$04$NOXqnZ5ySS530Tzisco2h.Ea4j5M9oMATQZhdk.2TFWtR4eeQX/7K', '583-603-3983');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (24, 24, 'Bill', 'Look', 'Eastope', 'beastopen', '$2a$04$po7BMMDv61b2lBUY9HQZwOVelFmmWE3hp4z3xfp7Ry.ix2VfKjoAO', '285-963-1051');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (25, 25, 'Aurora', 'Bellham', 'Gabey', 'agabeyo', '$2a$04$yXmLalqdos.f8UAJCIFth.uovaLV149eQEuWCx.mjOPuKkx6DdH1m', '635-277-5439');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (26, 26, 'Teddie', 'Culbard', 'Chattaway', 'tchattawayp', '$2a$04$JXHRZcZA/keovi2LphN8LOyJM2OhGoIKRslx1rEZcsZdvRnLdqrli', '526-612-8431');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (27, 27, 'Bronny', 'Moodie', 'Woodhall', 'bwoodhallq', '$2a$04$erEp28uya7g6iYTadzZIVubuqkyzzFAoIIccrUYHSZAHT72XOUtDS', '715-499-8511');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (28, 28, 'Corby', 'Schimke', 'Deshon', 'cdeshonr', '$2a$04$Z/P0olf4sf4ZBklSoMkgBeDhmNyFlgs65/y4QGn5XIGPjJDVXyBNO', '969-382-1379');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (29, 29, 'Jordon', 'Hender', 'Gelardi', 'jgelardis', '$2a$04$N2GjsC4EaYjbcT/Vb6nufue27oU.eB/QMdPtBzNL5HqIxc3eOxey2', '423-125-6463');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (30, 30, 'Langsdon', 'Geerdts', 'Channer', 'lchannert', '$2a$04$TtMlqyvK8yYjRPu4P2i.8uOZS8dG1oKPMq6Mvb9DrOaKX1NJO6ITW', '763-369-4276');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (31, 31, 'Beatrisa', 'Schober', 'Ahearne', 'bahearneu', '$2a$04$JHcSa/Rz05IuW9jit5udX.G7V6ynEHPc9ElhLNAglz2Nm9mr5g.e2', '390-782-5700');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (32, 32, 'Verge', 'Jiggen', 'Bruton', 'vbrutonv', '$2a$04$R1mm9phLc5YzX0TnCUZgYeUljyUngTF1UynYUIVfmKzvqwNacoBm2', '872-532-2602');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (33, 33, 'Wilt', 'McCauley', 'Kingerby', 'wkingerbyw', '$2a$04$nYCjbq33u/tavFpMyya1XOjdPgTnSRLkM6wp.7nd5jC1/iFsA0Yiy', '323-385-1516');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (34, 34, 'Marcela', 'Grelak', 'Schenfisch', 'mschenfischx', '$2a$04$TmO3eOkbxnXwaqez6vIuM.vYcLEpCGRoe4ajvJi.G1fwKiOToKFcO', '679-338-8277');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (35, 35, 'Lindie', 'Ottosen', 'Durdan', 'ldurdany', '$2a$04$x7I6NTElxP7q6eoP0lYD8.aflTkFP2TSuVEv5bI0.uJLf369LFrDW', '194-737-1481');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (36, 36, 'Tristan', 'Dumphrey', 'Klammt', 'tklammtz', '$2a$04$v2rkC.03Ndf1K5du0quCBei4ZLCTnEeZjd9u9MERiW1wBuPixmH4i', '820-642-2851');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (37, 37, 'Isidro', 'Dickson', 'Eliyahu', 'ieliyahu10', '$2a$04$u8Plbcjumw/gChgSA6dDjOifMT.gePlhlbcMYwueCNlEn3vBEcP8y', '402-160-9902');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (38, 38, 'Obadiah', 'Heindrick', 'Purle', 'opurle11', '$2a$04$xohS754sHb1pK4RdkwlI6.X8Mob0yeAHT.iobsrUQwR4WPgdlnWbO', '137-208-6183');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (39, 39, 'Anjela', 'Denial', 'Arkow', 'aarkow12', '$2a$04$VjJoyU4b70kFqoeL0RLVD.ssjRFwSMMRv7rqWpqBPBTBrEpMg1hEu', '188-473-3569');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (40, 40, 'Heidi', 'Buckenhill', 'Patington', 'hpatington13', '$2a$04$xLcOz8K6anIa8T8G9atT6eyVUGCwW.ry8kZgg46PVkedZS9ROH/Fa', '351-904-4102');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (41, 41, 'Wain', 'Suerz', 'Huson', 'whuson14', '$2a$04$Yd//vJB9KWn5J0d5ng5GA.RQ15aZ6xNL277r5jtjWxWV2dJbn5el6', '313-538-1530');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (42, 42, 'Burgess', 'Eakin', 'Goulston', 'bgoulston15', '$2a$04$Rt35uJIxrNWRi3o5omQCNe7emrC56aFtVJjGhe9H3orc0sRvtJHbq', '249-304-8957');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (43, 43, 'Bobbie', 'Rotter', 'Recher', 'brecher16', '$2a$04$9Zi8UoFE/u8rtVeIEb9p3eIvkalKa8p9bxiJvdwn7S8Pf0lGDFz4i', '577-977-7864');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (44, 44, 'Weston', 'Crowden', 'Arnowitz', 'warnowitz17', '$2a$04$4M7yH1eQ5UwQV2GQDVSxcOD8DsCMjIErzNobGiasNVtXlj0RYq0My', '142-118-3168');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (45, 45, 'Court', 'Manjot', 'Gooders', 'cgooders18', '$2a$04$eTkaOqb.BKT7W86olkaBCujRj.Wj4.r2q.pRzhkDDFymY8U5m7.Um', '827-727-7861');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (46, 46, 'Vinita', 'Succamore', 'Wetherby', 'vwetherby19', '$2a$04$XwmsYYVMgcOG.hK.WcgzL.esB9BlZ8DUvSqIm.0CqtY5M16JBv3Ui', '984-164-1779');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (47, 47, 'Maisie', 'Haslum', 'Strick', 'mstrick1a', '$2a$04$MS7bIzdwxbPYb5glsRcIWOX1axsfRy808kjn.Ic2ZDS/mFxj93Ww6', '110-214-9146');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (48, 48, 'Rona', 'Pleming', 'Eustace', 'reustace1b', '$2a$04$iyAbUh39MA6kNZeDzFCkJOwE6p.9.FnFn3gQ4P4cHv/rKRUgpvBsq', '455-888-9363');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (49, 49, 'Zena', 'Kremer', 'Fairfull', 'zfairfull1c', '$2a$04$f5diTNtSXhQr28qriDRAt.PKg6OnChyjGfLdEcPnPvPbGMF4puhhG', '960-659-8363');
insert into online_site.customer (customerId, staysAt, FirstName, LastName, middleName, userName, passwordHash, mobile) values (50, 50, 'Jere', 'Woodberry', 'Burnsall', 'jburnsall1d', '$2a$04$JSZjjvpa8rxeg0Tf6tma7.aOMFZsQId0tqXKZfr36cMZjkh1ZbRJS', '568-430-5827');


insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (1, 1, 'Elizabet', 'Quamba', 'gR8#VD5k,I_', 6.28, '454-299-7420', 'eleckey0@cargocollective.com', 'egibben0');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (2, 2, 'Helyn', 'Pixoboo', 'cH0|_*0|I>lt', 4.98, '554-639-6294', 'hellerey1@comsenz.com', 'hbulward1');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (3, 3, 'Bridget', 'Quimba', 'tX3~d_5,', 4.35, '759-720-4060', 'bgounin2@cafepress.com', 'bshambrooke2');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (4, 4, 'Kristan', 'Linktype', 'jB7,xWVTl06jAA', 9.89, '326-523-1917', 'kchetwin3@skype.com', 'khuntingdon3');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (5, 5, 'Joshua', 'Topdrive', 'qV5.~783G">', 3.0, '400-483-0765', 'jranyell4@ezinearticles.com', 'jcordet4');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (6, 6, 'Arne', 'Blogtag', 'eZ8($I&)9o$Ys', 3.55, '639-513-3382', 'apeak5@usda.gov', 'athompstone5');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (7, 7, 'Inness', 'Plajo', 'gA4?3k<N((E%O{l', 5.97, '747-909-3400', 'idenyukin6@wired.com', 'ipyson6');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (8, 8, 'Kimmi', 'Ntags', 'nG7$==5UPFBSa', 5.52, '636-843-4565', 'khavers7@networkadvertising.org', 'kheasly7');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (9, 9, 'Brigitta', 'Gevee', 'cL4~&654MZtD6C', 4.43, '213-453-3174', 'bkinze8@microsoft.com', 'baccomb8');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (10, 10, 'Nap', 'Eare', 'aX6>GyaY.pGn', 5.66, '963-845-5429', 'nwastell9@usa.gov', 'nriccardi9');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (11, 11, 'Devlin', 'Jaxworks', 'pX3}|oc}', 6.17, '746-855-0703', 'dleydena@mac.com', 'dlevesquea');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (12, 12, 'Ferdinande', 'Tagopia', 'lK1|_?yY"yFZ', 2.25, '759-563-3579', 'fquiggb@yellowpages.com', 'fjankowskib');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (13, 13, 'Inness', 'Tazzy', 'iF5"`y`"VU', 5.49, '778-995-7267', 'iszapiroc@gizmodo.com', 'itonkesc');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (14, 14, 'Cordey', 'Oyoloo', 'vN7+iFZ*', 8.05, '629-676-4080', 'cocahernyd@dagondesign.com', 'ckaliszewskid');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (15, 15, 'Nicolai', 'Centizu', 'pA0&yDagiw', 7.67, '147-526-2197', 'nmontillae@telegraph.co.uk', 'nschrotere');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (16, 16, 'Lyndell', 'Eabox', 'jA0@ngYPz{f', 1.91, '186-902-9281', 'lredwallf@wiley.com', 'llindoresf');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (17, 17, 'Teodorico', 'Skipfire', 'pM0&!hL(oJ`o', 1.03, '172-598-0525', 'tbwyg@ftc.gov', 'tferaghg');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (18, 18, 'Fay', 'Brainlounge', 'fR4_P*yxm">', 1.33, '209-546-5189', 'frenowdenh@vinaora.com', 'fwernerh');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (19, 19, 'Riane', 'Skynoodle', 'mS5{qWl=g', 5.54, '504-346-9994', 'rfildesi@nsw.gov.au', 'rjacqueti');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (20, 20, 'Herschel', 'Rhyzio', 'yE8<H6i%s(Qm', 7.04, '701-569-6038', 'hadnetj@netscape.com', 'hoganj');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (21, 21, 'Phillis', 'Demizz', 'gJ8*l8lz,E_{uF', 8.09, '944-686-6114', 'psaizk@nydailynews.com', 'pmacarthurk');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (22, 22, 'Gabriello', 'Realbridge', 'jA1>.CZ,', 4.99, '404-537-2914', 'gmcallenl@is.gd', 'gsidgwickl');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (23, 23, 'Briana', 'Mita', 'yP2?m~>7!Ex', 1.32, '909-748-9361', 'bkingdonm@networksolutions.com', 'bseadonm');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (24, 24, 'Marcus', 'Centizu', 'oW9!"c+0kn{C2', 3.64, '899-151-3888', 'msaffrinn@skyrock.com', 'mhirsthousen');
insert into online_site.seller (sellerId, addressId, sellerName, storeName, sellerPassword, sellerRatings, mobile, email, sellerCode) values (25, 25, 'Buffy', 'Roomm', 'oA5=~U>''\?9n(L', 5.61, '455-874-5396', 'bstroddero@samsung.com', 'bcarloso');



insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (1, '2022-12-19 17:27:07', '2023-02-26 01:30:14', 46, 12, 19);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (2, '2022-11-05 04:31:46', '2023-05-20 14:28:56', 42, 18, 14);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (3, '2022-12-05 06:28:58', '2022-10-17 23:58:35', 2, 25, 10);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (4, '2023-03-12 20:54:17', '2023-04-04 17:18:11', 7, 19, 7);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (5, '2023-02-18 04:57:12', '2023-02-19 10:33:16', 24, 2, 23);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (6, '2023-07-09 21:25:43', '2023-05-09 16:27:24', 23, 41, 24);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (7, '2023-03-13 05:50:18', '2023-08-05 09:27:09', 37, 19, 6);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (8, '2022-11-14 11:31:31', '2023-01-18 23:32:34', 21, 45, 1);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (9, '2023-04-15 19:17:38', '2023-02-02 08:29:36', 24, 9, 6);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (10, '2022-09-13 12:36:46', '2023-04-01 17:40:03', 39, 38, 5);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (11, '2023-05-17 14:49:45', '2023-07-09 19:01:28', 9, 11, 17);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (12, '2022-11-28 16:01:18', '2022-11-13 21:38:17', 5, 27, 2);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (13, '2023-01-18 07:19:31', '2023-07-31 18:27:10', 16, 33, 16);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (14, '2023-08-25 03:02:54', '2022-09-27 21:14:44', 16, 1, 14);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (15, '2022-12-12 18:20:37', '2023-03-21 15:05:57', 13, 1, 14);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (16, '2023-07-10 05:36:28', '2023-06-10 16:51:11', 1, 3, 8);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (17, '2022-10-29 21:42:16', '2023-03-08 12:29:51', 6, 27, 6);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (18, '2022-11-22 10:19:25', '2023-05-03 04:27:15', 10, 35, 9);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (19, '2023-01-17 21:22:41', '2023-06-15 10:45:38', 23, 4, 18);
insert into online_site.order (orderID, PlacedOn, estoimatedDelivery, orderedBy, deliverTo, soldBy) values (20, '2023-06-24 21:46:11', '2023-02-13 12:11:57', 25, 3, 3);




insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (1, 'Focus', 'imperdiet et commodo vulputate justo', 26, 21, 'Ford');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (2, 'Miata MX-5', 'nunc rhoncus dui vel', 8, 23, 'Mazda');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (3, '430 Scuderia', 'rutrum rutrum neque', 34, 14, 'Ferrari');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (4, '850', 'fermentum donec ut mauris', 34, 46, 'Volvo');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (5, '911', 'orci luctus et ultrices posuere cubilia curae donec', 6, 33, 'Porsche');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (6, 'Quantum', 'amet turpis elementum', 20, 47, 'Volkswagen');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (7, 'Viper', 'duis bibendum felis sed interdum venenatis turpis enim', 37, 31, 'Dodge');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (8, 'GTO', 'lacinia sapien', 3, 39, 'Pontiac');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (9, 'Century', 'molestie sed justo pellentesque viverra pede ac diam', 34, 42, 'Buick');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (10, 'Wrangler', 'eu est congue elementum in hac habitasse', 32, 50, 'Jeep');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (11, 'XJ Series', 'volutpat quam pede lobortis ligula sit amet eleifend', 28, 12, 'Jaguar');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (12, 'Compass', 'non mauris morbi non lectus aliquam', 49, 38, 'Jeep');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (13, 'C-Class', 'gravida nisi at', 8, 5, 'Mercedes-Benz');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (14, 'MKX', 'ac nulla sed vel enim sit', 20, 48, 'Lincoln');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (15, 'Tracer', 'lacus purus aliquet at feugiat non pretium', 23, 12, 'Mercury');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (16, 'C70', 'pellentesque ultrices mattis', 29, 9, 'Volvo');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (17, '2500', 'mauris ullamcorper purus sit amet nulla quisque', 20, 30, 'Chevrolet');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (18, 'M-Class', 'ac consequat metus sapien', 14, 14, 'Mercedes-Benz');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (19, 'Justy', 'id consequat in', 50, 45, 'Subaru');
insert into online_site.product (productID, productName, productDescription, weight, dimentions, manufacturer) values (20, 'NSX', 'justo aliquam', 20, 40, 'Acura');



insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (1, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 8, 0, 19, 6);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (2, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 5, 1, 18, 11);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (3, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 2, 0, 6, 9);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (4, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 9, 1, 1, 50);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (5, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, 1, 4, 13);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (6, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 6, 1, 7, 11);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (7, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1, 1, 5, 26);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (8, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 7, 1, 8, 44);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (9, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 9, 0, 20, 31);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (10, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 5, 0, 14, 8);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (11, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 7, 1, 3, 36);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (12, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1, 0, 15, 24);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (13, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 5, 0, 11, 48);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (14, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3, 0, 13, 24);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (15, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 9, 0, 4, 24);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (16, 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 3, 0, 13, 48);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (17, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 6, 0, 6, 22);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (18, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 4, 1, 12, 40);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (19, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 8, 0, 3, 13);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (20, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 5, 1, 2, 31);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (21, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 6, 1, 10, 32);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (22, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 2, 0, 4, 48);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (23, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 7, 1, 19, 14);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (24, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 7, 1, 2, 2);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (25, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 7, 0, 19, 24);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (26, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 6, 0, 20, 33);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (27, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 3, 0, 5, 13);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (28, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 9, 1, 13, 42);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (29, 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 5, 0, 10, 4);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (30, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 2, 0, 6, 28);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (31, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 2, 1, 5, 46);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (32, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 2, 0, 11, 42);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (33, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 10, 0, 12, 15);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (34, 'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 7, 1, 15, 13);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (35, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 9, 0, 16, 40);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (36, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 6, 0, 13, 31);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (37, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 6, 0, 12, 41);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (38, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 4, 1, 15, 21);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (39, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 7, 0, 15, 38);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (40, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 8, 1, 18, 25);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (41, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 10, 0, 3, 36);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (42, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 4, 0, 4, 22);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (43, 'Fusce consequat. Nulla nisl. Nunc nisl.', 3, 1, 8, 48);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (44, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 10, 1, 17, 10);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (45, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 2, 0, 9, 33);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (46, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 5, 1, 20, 6);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (47, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 2, 1, 13, 25);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (48, 'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1, 0, 16, 23);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (49, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 3, 0, 8, 29);
insert into online_site.productReview (reviewId, review, reviewRating, reviewVotes, productId, customerId) values (50, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5, 0, 15, 11);