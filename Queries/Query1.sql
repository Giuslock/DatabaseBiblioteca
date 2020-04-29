#quando viene creato un nuovo utente e 
#aggiunto alla tabella il corrispondente flag_Attività viene settato a 0 per deafult


#(lo zero indica che lo stato dell'utente è passivo)
#query che serve a impostare il flag_Attivita a 1
#update utente set flag_attività=1 where ID=1;



#select u.nome as `Nome Utente`, u.cognome as `Cognome Utente`, 
#u.flag_attività as `Stato Utente` 
#from utente u where ID=1;


#query che serve a impostare il flag_Attività a 1
#(l'1 indica lo stato attivo dell'utente)
update utente set flag_attività=0 where ID=1;

select u.nome as `Nome Utente`, u.cognome as `Cognome Utente`, 
u.flag_attività as `Stato Utente` 
from utente u where ID=1;
