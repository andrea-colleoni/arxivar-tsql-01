dbcc show_statistics (classifica, squadra)

update statistics persone

select *
from classifica c
where 
	c.punti between 10 and 18
	and squadra > 'Squadra F'