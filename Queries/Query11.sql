DELIMITER $$
CREATE PROCEDURE AggiungiMipiace(IN IDUt int,IN IDPubb int, data_ timestamp)
BEGIN
insert into valutare(pubblicazioneID,utentID,data) values (IdPubb,IDUt,data_);
update pubblicazione set `#like`=`#Like`+1 where ID=IdPubb;
insert into storia_utente(descrizione,utentID,pubbID) values ('Ha messo "mi piace" alla opera', IDUt,IDPubb);
update utente set Flag_Attività=1 where ID=IDUt;
END $$
DELIMITER ;

CALL AggiungiMipiace(2,1, current_timestamp())



DELIMITER $$
CREATE PROCEDURE TogliMipiace(IN IDUt int,IN IDPubb int,data_ timestamp)
BEGIN
delete from valutare where pubblicazioneID=IDpubb and UtentID=IDUt;
update pubblicazione set `#like`=`#Like`-1 where ID=IdPubb;
insert into storia_utente(timestamp,descrizione,utentID,pubbID) values (data_,'Ha tolto "mi piace" alla opera', IDUt,IDPubb);
END $$
DELIMITER ;

call TogliMipiace(2,1,current_timestamp())


