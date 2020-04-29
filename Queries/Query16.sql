
select p.titolo as 'Titolo Opera', sourc.URI  
from pubblicazione p, pubblic_info pi, sorgenti sourc
where pi.pubblicazioneID=p.ID and sourc.IDpublicinfo=pi.ID and sourc.tipo= 'download';