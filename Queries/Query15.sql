select timestamp as 'Data Recensione', descrizione as 'Testo Recensione',
titolo as 'Titolo Opera', nome as 'Nome Utente', cognome as 'Cognome Utente'
from storia_utente sto, pubblicazione p, utente u
where sto.pubbID=p.ID and sto.utentID=u.ID;

#Versione che utilizza la ricerca tramite il titolo della pubblicazione 
select timestamp as 'Data Recensione', descrizione as 'Testo Recensione',
titolo as 'Titolo Opera', nome as 'Nome Utente', cognome as 'Cognome Utente' ,pubbID AS 'ID Opera'
from storia_utente sto, pubblicazione p, utente u 
where sto.pubbID=p.ID and sto.utentID=u.ID and p.titolo='Illidan';

#versione che utilizza la ricerca tramite ID 
#(per evitare omonimie che si potrebbero incontrare con il titolo)

select timestamp as 'Data Recensione', descrizione as 'Testo Recensione',
titolo as 'Titolo Opera', nome as 'Nome Utente', cognome as 'Cognome Utente', pubbID AS 'ID Opera'
from storia_utente sto, pubblicazione p, utente u 
where sto.pubbID=p.ID and sto.utentID=u.ID and p.ID=1;
