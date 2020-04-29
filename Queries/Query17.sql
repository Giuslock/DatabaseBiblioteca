select p.titolo as 'Titolo Opera', max(r.data_ristampa) as 'Data Ultima Ristampa'
from pubblicazione p, ristampe r, pubblic_info pi
where r.publicinfoID=pi.ID and pi.pubblicazioneID=p.ID group by p.titolo 