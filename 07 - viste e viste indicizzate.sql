create or alter view movimenti_recenti
with schemabinding
as
select [id], [descrizione], [data]
from dbo.movimenti

create unique clustered index ix_mov on dbo.movimenti_recenti ([id])