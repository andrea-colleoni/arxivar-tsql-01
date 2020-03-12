use [corso_tsql-abletech]

declare @id int
		, @nome varchar(50)
		, @cognome varchar(50)

-- definizione di un cursore
declare cursore cursor for
SELECT 
	   [id]
      ,[nome]
      ,[cognome]
FROM 
	   [dbo].[persone]


open cursore

fetch next from cursore
into @id, @nome, @cognome

print @@fetch_status

while(@@fetch_status = 0)
begin

	print 'trovato il record di ' + @nome + ' con id ' + cast(@id as varchar)
	fetch next from cursore
	into @id, @nome, @cognome
end

/*
fetch next from cursore
print @@fetch_status

fetch next from cursore
print @@fetch_status

fetch next from cursore
print @@fetch_status

fetch next from cursore
print @@fetch_status
fetch next from cursore
*/

close cursore
deallocate cursore
