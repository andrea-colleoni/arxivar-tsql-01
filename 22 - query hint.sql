select 
	*
from
	movimenti m inner join persone p
	on m.persona = p.id
--OPTION (MERGE JOIN);