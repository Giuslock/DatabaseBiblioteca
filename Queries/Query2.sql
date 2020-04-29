

#select p.titolo as `Titolo Opera`
#from pubblicazione p

#select  pi.dat_pub as `Data Pubblicazione Opera`
#from pubblic_info pi

select p.titolo as `Titolo Opera`, pi.dat_pub as `Data Pubblicazione Opera`
from pubblic_info pi, pubblicazione p 
where p.ID=pi.pubblicazioneID
order by dat_pub
desc limit 10;
