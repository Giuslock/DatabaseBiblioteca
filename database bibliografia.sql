CREATE DATABASE IF NOT EXISTS `bibliografia`;
USE `bibliografia`;


drop table if exists`autore`; 
create table `autore`(
`ID` int (15) NOT NULL AUTO_INCREMENT,
`CF` char(16) DEFAULT NULL,
`nome` varchar(30) DEFAULT NULL,
`cognome` varchar(30) DEFAULT NULL,
PRIMARY KEY (`ID`),
UNIQUE KEY `CF` (`CF`)
)
auto_increment=6;


lock tables `autore` write;

insert into `autore` values (1,'BNCOM2312ASFAF94','Omino','Bianco'),
(2,'NRMR243DSBB234C6','Maria','Neri'),
(3,'GRGCRS235F235KLD','Cristiano','Grigio'),
(4,'GRMHLL2342FSD34K','Grommash','Hellscream'),
(5,'CRSGLD325FSE245G','Cristhie','Golden');

unlock table;

drop table if exists`editore`;
create table `editore`(
`ID` int(15) NOT NULL AUTO_INCREMENT,
`nome` varchar(45) DEFAULT NULL,
`sede` varchar(35) DEFAULT NULL, 
PRIMARY KEY (`ID`),
UNIQUE KEY `nome` (`nome`,`sede`)
)
auto_increment=5;


lock tables `editore` write;

insert into `editore` values (1,'DeAgostini','Milano'),(2,'Mondadori','Roma'),(3,'IBS','Bologna'),(4,'Blizzard','California');

unlock table;


drop table if exists`utente`;
create table `utente`(
`ID` int(15) NOT NULL AUTO_INCREMENT,
`CF` char(16) NOT NULL,
`nome` varchar(25)NOT NULL,
`cognome` varchar(25)NOT NULL,
`email` varchar(30) NOT NULL,
`password` varchar(20)NOT NULL,
`flag_attività` tinyint(1) NOT NULL DEFAULT'0',
PRIMARY KEY (`ID`),
UNIQUE KEY `email` (`email`),
UNIQUE KEY `CF` (`CF`)
)
auto_increment=4;


lock tables `utente` write;
                                  
insert into `utente` values (1,'MRCZUC928DFSH45G','Marco','Zucconi','marcozucconi@gmail.com','zucco45',0),
(2,'STFDCT38452UDJGN','Stefano','Diociaiuti','stefanodioci@gmail.com','diocisalvi',0),
(3,'FBCPT238V4WBZVD6','Fabio','Capitanio','fabiocapitanio@gmail.com','fabio01',0);
                                 
unlock table;


drop table if exists`pubblicazione`;
create table `pubblicazione`(
`ID` int(15) NOT NULL AUTO_INCREMENT,
`titolo` varchar(50) DEFAULT NULL,
`descrizione_testo` varchar(400) NOT NULL,
`indice` varchar(500) DEFAULT NULL,
`#like` int(11) NOT NULL DEFAULT '0',
`UtentID` int(15) NOT NULL,
`EditorID` int(15) NOT NULL,
PRIMARY KEY (`ID`),
KEY `edit_pubblic` (`EditorID`),
constraint `edit_pubblic` foreign key (`EditorID`) references `editore`(`ID`) on update cascade,
KEY `utente_pubblic_ins` (`UtentID`),
constraint `utente_pubblic_ins` foreign key (`UtentID`) references `utente`(`ID`) on update cascade
)
auto_increment=6;

 
lock tables `pubblicazione` write;
                                          
insert into `pubblicazione` values (1,'Illidan','World of Warcraft Books',null,0,1,1),
(2,'Le avventure di Peppa Pig','Il prosciutto senza grassi',null,0,3,1),(3,'Shining','Le avventure più divertenti...',null,0,2,2),
(4,'Un caso bizzario per il commissario Carra','Il professor Arbib ha scritto un libro??',null,0,1,2), 
(5,'50 sfumature di Grigio','La frusta fa male se non sai come usarla...',null,0,3,3);
                                        
unlock tables;



drop table if exists`storia_utente`;
create table `storia_utente`(
`timestamp` timestamp not null default current_timestamp,
`descrizione` varchar(500) not null,
`utentID` int(15),
`pubbID` int(15),
foreign key (`utentID`) references `utente`(`ID`) on update cascade on delete cascade,
foreign key (`pubbID`) references `pubblicazione`(`ID`) on update cascade on delete cascade
 );
lock tables `storia_utente` write;
                                         
insert into `storia_utente` values ('18-07-10 20:04:34','ha recinsito una opera...',3,3),
('2014-04-24 13:00:53','ha messo un mi piace...',1,4),
('1996-05-23 18:00:23','ha tolto mi piace...',2,1),
('2016-04-06 8:30:53', 'ha recensito una opera...',3,5);      
                                        
unlock tables;


drop table if exists`pubblic_info`;
create table `pubblic_info`(
`ID` int(15) not null auto_increment,
`ISBN` char(18) not null,
`dat_pub` date Default null,
`lingua` varchar (3) default null,
`#pag` int (5) default null,
`pubblicazioneID` int(15) not null,
primary key (`ID`),
unique key (`pubblicazioneID`),
unique key (`ISBN`),
key `pub_infodata`(`pubblicazioneID`),
constraint `pub_infodata` foreign key (`pubblicazioneID`) references `pubblicazione`(`ID`) on update cascade on delete cascade
)
auto_increment=6;


lock tables `pubblic_info` write;
                                        
insert into `pubblic_info` values (1,'978-3-4032-6634-5','1956-11-07','RUS',345,1),
(2,'979-5-2345-7436-9','1982-05-07','ITA',230,2),
(3,'979-3-5634-3464-7','2011-09-11','ENG',34,3),
(4,'978-4-5745-6336-6','1820-12-24','ITA',320,4),
(5,'978-7-2355-2323-6','2012-12-31','GER',453,5);
                                       
unlock table;



drop table if exists`keyword`;
create table `keyword`(
`ID` int(15) not null auto_increment,
`chiave` char (30) not null,
`publicinfoID` int(15) not null,
primary key `keyopera` (`ID`)
)
auto_increment=6;


lock tables `keyword` write;
                                   
insert into `keyword` values (1,'Horror',3),(2,'Ragazzi',2),(3,'Fantasy',1),(4,'Giallo',4),(5,'Giallo',5);
unlock tables;



drop table if exists`ristampe`;
create table `ristampe`(
`ID` int(15) not null auto_increment,
`#stampa` int(7) default null,
`publicinfoID` int(15) not null,
`data_ristampa` date not null,
foreign key (`publicinfoID`) references `pubblic_info` (`ID`) on delete cascade on update cascade,
primary key (`ID`),
unique key `numero` (`#stampa`, `data_ristampa`)
)
auto_increment=7;


lock tables `ristampe` write;
                                    
insert into `ristampe` values (1,24,1,'2018-06-07'),
(2,2,4,'2016-02-03'),
(3,12,1,'2015-12-03'),
(4,26,4,'2018-07-03'),(5,56,5,'2004-06-04'),
(6,34,3,'1996-04-03');
                                   
unlock table;


drop table if exists`sorgenti`;
create table `sorgenti`(
`ID` int(15) not null auto_increment,
`URI` varchar(300) not null,
`descrizione` varchar(300) default null,
`formato` varchar(25) default null,
`tipo` varchar(25) default null,
`IDpublicinfo` int(15) not null,
primary key (`ID`),
unique key `URI` (`URI`),
key `localizzare` (`IDpublicinfo`),
constraint `localizzare` foreign key (`IDpublicinfo`) references `pubblic_info` (`ID`) on delete cascade on update cascade
)
auto_increment=6;

 
lock tables `sorgenti` write;
                                    
insert into `sorgenti` values (1,'https://www.google.it/immagini','copertina','jpeg','immagine',1),
(2,'https://www.kindle.it/e-books.pdf','pdf di prova gratuito','pdf','download',2),
(3,'https://www.ebay.com','gadget personaggio romanzo','oggetto','acquisto',3),
(4,'https://www.amz.com','acquista online','copertina rigida','acquisto',4),
(5,'https://www.google.it/50sfumaturedownload','libro pdf','pdf','download',5);
                                   
unlock table;



drop table if exists`valutare`;
create table `valutare`(
`pubblicazioneID` int(15) not null,
`utentID` int(15) NOT NULL,
`data` timestamp not null default current_timestamp,
unique key `like` (`utentID`, `pubblicazioneID`),
constraint `like-utente` foreign key (`utentID`) references `utente` (`ID`) on delete cascade on update cascade,
constraint `like-pubblicazione` foreign key (`pubblicazioneID`) references `pubblicazione` (`ID`) on update cascade on delete cascade
);
lock tables `valutare` write;
                       
                                   
unlock table;


drop table if exists`recensire`;
create table `recensire`(
`pubblicazioneID` int(15) not null,
`utentID` int(15) NOT NULL,
`data` timestamp not null default current_timestamp,
`campo` varchar(400) not null,
`approvazione` tinyint(1) not null default '0',
unique key `like` (`utentID`, `pubblicazioneID`),
constraint `recensione-utente` foreign key (`utentID`) references `utente` (`ID`) on delete cascade on update cascade,
constraint `recensione-pubblicazione` foreign key (`pubblicazioneID`) references `pubblicazione` (`ID`) on update cascade on delete cascade
);
lock tables `recensire` write;
                                     
insert into `recensire` values (1,2,'2017-06-10 12:10:55','Questo testo è davvero bello!',0),
(2,3,'2008-01-06 21:14:56','Questo testo è davvero brutto',0),(3,1,'2002-07-11 07:30:45','Non è male, ma neanche bello',0);
                                    
unlock table;


drop table if exists`scrivere`;
create table `scrivere` (
`pubblicazioneID` int(15) not null,
`autorID` int(15) NOT NULL,
`approvazione` tinyint(1) not null default '0',
key `scrivere-utente` (`autorID`),
key `scrivere-pubblicazione` (`pubblicazioneID`),
constraint `scrivere-autore` foreign key (`autorID`) references `autore` (`ID`) on delete cascade on update cascade,
constraint `scrivere-pubblicazione` foreign key (`pubblicazioneID`) references `pubblicazione` (`ID`) on update cascade on delete cascade
);

lock tables `scrivere` write;
                                        
insert into `scrivere` values (1,2,'0'),(2,1,'0'),(5,3,'0'),(3,2,'0'),(4,3,'0');
                                   
unlock table;


drop table if exists `collegare`; 
create table `collegare` (
`publicinfoID` int(15) not null,
`IDchiave` int(15) not null,
foreign key (`publicinfoID`) references `pubblic_info` (`ID`) on delete cascade on update cascade,
foreign key (`IDchiave`) references `keyword` (`ID`) on delete cascade on update cascade
);


DELIMITER $$
CREATE PROCEDURE Recensire(IN IDUt int, IN IDPubb int, IN Cam Varchar(500))
BEGIN
insert into recensire(pubblicazioneID,utentID,Campo) values (IDPubb,IDUt,Cam);
insert into storia_utente(Descrizione,utentID,PubbID) values (`utente recensisce l'opera`,IDUt,IDPubb);
update utente set flag_attività=1 where ID=IDUt;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE AggiungiMipiace(IN IDUt int,IN IDPubb int, data_ timestamp)
BEGIN
insert into valutare(pubblicazioneID,utentID,data) values (IdPubb,IDUt,data_);
update pubblicazione set `#like`=`#Like`+1 where ID=IdPubb;
insert into storia_utente(descrizione,utentID,pubbID) values ('Ha messo "mi piace" alla opera', IDUt,IDPubb);
update utente set Flag_Attività=1 where ID=IDUt;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE TogliMipiace(IN IDUt int,IN IDPubb int,data_ timestamp)
BEGIN
delete from valutare where pubblicazioneID=IDpubb and UtentID=IDUt;
update pubblicazione set `#like`=`#Like`-1 where ID=IdPubb;
insert into storia_utente(timestamp,descrizione,utentID,pubbID) values (data_,'Ha tolto "mi piace" alla opera', IDUt,IDPubb);
END $$
DELIMITER ;

