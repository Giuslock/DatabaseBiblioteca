select p.titolo as 'Titolo Opera', p.descrizione_testo as 'Descrizione Testo', 
pi.ISBN, pi.dat_pub as 'Data Pubblicazione Opera', 
pi.lingua as 'Lingua Opera' , a.nome as 'Nome Autore' , a.cognome as 'Cognome Autore',
e.nome as Editore
from pubblicazione p, pubblic_info pi, autore a, editore e, scrivere s, utente u
where p.editorID=e.ID and p.UtentID=u.ID and pi.pubblicazioneID=p.ID 
and s.autorID=a.ID and s.pubblicazioneID=p.ID and p.ID=2;
#query per l'estrapolazione dei dati della pubblicazione con ID 2











