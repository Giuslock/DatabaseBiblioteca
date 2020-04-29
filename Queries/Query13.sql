select pubblicazioneID as 'ID Opera', utentID as 'ID Utente', 'data' as 'Data Recensione'
, campo as 'Testo Recensione', approvazione as 'Approvazione Recensione'
from recensire re
where re.approvazione=true and re.pubblicazioneID=1


