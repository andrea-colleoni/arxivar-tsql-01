declare 
		  @id		int
		, @testo	varchar(50)
		, @data		date

set @testo = 'testo...' -- commento

/*
commento su più righe
....
*/

set @id = 1

print 'impostata la variabile'
print @id

select *
from persone p
where p.id > @id

GO -- istruzione che termina un "batch di query"

declare @id int