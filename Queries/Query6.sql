select p.titolo as 'Titolo Opera', p.descrizione_testo AS 'Descrizione Opera',
 e.nome as 'Nome Editore', a.nome as 'Nome Autore' , a.cognome AS 'Cognome Autore', 
 pi.dat_pub as 'Data Pubblicazione'
from pubblicazione p, autore a, editore e, pubblic_info pi, scrivere s 
where p.editorID=e.ID and s.autorID=a.ID 
and pi.pubblicazioneID=p.ID and s.pubblicazioneID=p.ID
group by p.titolo order by p.titolo;