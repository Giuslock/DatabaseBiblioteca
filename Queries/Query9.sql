
DELIMITER $$
CREATE PROCEDURE Recensire(IN IDUt int, IN IDPubb int, IN Cam Varchar(500))
BEGIN
insert into recensire(pubblicazioneID,utentID,Campo) values (IDPubb,IDUt,Cam);
insert into storia_utente(Descrizione,utentID,PubbID) values (`utente recensisce l'opera`,IDUt,IDPubb);
update utente set flag_attività=1 where ID=IDUt;
END $$
DELIMITER ;

CALL Recensire(1,2,'è bella')