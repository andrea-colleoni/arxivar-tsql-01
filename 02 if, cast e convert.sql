use [corso_tsql-abletech]

declare 
	@id		int,
	@nome	varchar(50)

-- set @id = 1
select @id = p.id, @nome = p.nome
from persone p
where p.cognome = 'Rossi'
-- order by 1 desc
-- quanti record sono restituiti dalla query?
-- quello che memorizzo in @id è l'ultimo dei valori restituiti dalla query

print 1 + 1
print '1' + '1'
-- print @nome + ' ' + @id
-- print @id + ' ' + @nome
-- CAST e CONVERT
print @nome + ' ' + CAST(@id as varchar)  -- funzione CAST()

declare @testo varchar
set @testo = CONVERT(varchar, @id)

print @nome + ' ' + CONVERT(varchar, @id) 


if @id > 1
begin
	print 'maggiore di 1'
end
else if @id < 0
begin
	print 'i è minore di zero'
end
else
begin
	print 'non è maggiore di 1'
end