with movimenti_cte ([id], [descrizione], [data])
as
(
	select [id], [descrizione], [data]
	from movimenti
	where LEN(descrizione) >= 3
)

select p.*, m.*
from movimenti_cte m full outer join persone p
on p.id = m.id