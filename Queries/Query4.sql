select u.nome as `Nome Utente`, u.cognome as `Cognome Utente` ,
 count(*) as `Conteggio Attività`
from pubblicazione p join utente u on (p.UtentID=u.ID) group by u.ID 
order by count(*) desc limit 10;