select p.Titolo as `Titolo Opera`, r.data_ristampa as `Data Ristampa Opera` 
from ristampe r, pubblicazione p, pubblic_info pi
where r.publicinfoID=pi.ID and p.ID=pi.pubblicazioneID and r.data_ristampa
BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) and now();



#update ristampe set data_ristampa='2018-07-11' where publicinfoID=1;
#il giorno corrente è 2018-07-12
#select p.Titolo as `Titolo Opera`, r.data_ristampa as `Data Ristampa Opera` 
#from ristampe r, pubblicazione p, pubblic_info pi
#where r.publicinfoID=pi.ID and p.ID=pi.pubblicazioneID
 