
#versione con ricerca tramite titolo
select p.titolo as 'Titolo Opera', p.`#like` as 'Numero di like'
from pubblicazione p where p.titolo='Le Avventure di Peppa Pig';


#versione con ricerca tramite ID per evitare omonimie derivanti dall'uso del titolo
select p.titolo as 'Titolo Opera', p.`#like` as 'Numero di like'
from pubblicazione p where p.ID=2