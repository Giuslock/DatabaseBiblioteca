
select p.titolo as 'Titolo Opera', pi.ISBN from pubblicazione p, pubblic_info pi 
where pi.pubblicazioneID=p.ID and pi.ISBN='979-5-2345-7436-9';

select p.titolo as 'Titolo Opera', p.descrizione_testo as 'Descrizione Opera' from pubblicazione p 
where p.titolo= 'Shining';


select p.titolo as 'Titolo Opera', p.descrizione_testo as 'Descrizione Opera', 
a.nome as 'Nome Autore', a.cognome as 'Cognome Autore' 
from pubblicazione p, autore a, scrivere s 
where p.ID=s.pubblicazioneID and a.ID=s.autorID and a.ID=2;


select p.titolo as 'Titolo Opera', p.descrizione_testo as 'Descrizione Opera', k.chiave as 'Genere', pi.ISBN 
from pubblic_info pi,pubblicazione p, keyword k, collegare c 
where p.ID=c.publicinfoID and k.chiave=c.chiave and pi.pubblicazioneID=p.ID 
and k.chiave='Giallo';



select p.titolo as 'Titolo Opera', p.descrizione_testo as 'Descrizione Opera', k.chiave as 'Genere', pi.ISBN
from pubblic_info pi, pubblicazione p, keyword k, 
collegare c, scrivere s, autore a
where p.ID=c.publicinfoID and k.chiave=c.chiave 
and pi.pubblicazioneID=p.ID and a.ID=s.autorID and p.id=s.pubblicazioneID
and pi.ISBN='978-3-4032-6634-5' and a.ID=2 and k.chiave='Fantasy' and p.titolo='Illidan'


