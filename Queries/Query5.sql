
#VERSIONE CON DISTINZIONE TRAMITE ID 
select p.titolo as `Titolo Opera`, u.nome as `Nome Utente`,
 u.cognome as `Cognome Utente`, u.ID as ID_UTENTE
from pubblicazione p, utente u where p.UtentID=u.ID and u.id=1;

#VERSIONE CON DISTINZIONE TRAMITE CF
select p.titolo as `Titolo Opera`, u.nome as `Nome Utente`,
 u.cognome as `Cognome Utente`, u.ID as ID_UTENTE
from pubblicazione p, utente u where p.UtentID=u.ID and u.CF='MRCZUC928DFSH45G';