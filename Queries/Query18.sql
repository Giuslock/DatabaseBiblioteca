select p.titolo as 'Titolo Opera', a.nome as 'Nome Autore'
from pubblicazione p, autore a, scrivere s
where p.ID=s.pubblicazioneID and a.ID=s.autorID
and a.nome=(select a.nome from autore a join scrivere s on (a.ID=s.autorID) join 
pubblicazione p on (s.pubblicazioneID=p.ID) and p.titolo='Illidan');