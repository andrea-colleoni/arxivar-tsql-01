use [corso_tsql-abletech]

declare   @num int
		, @data date
		, @ricerca varchar(max)

-- date
set @data = '2020-03-01'

print dateadd(dd, -2, @data) -- datepart => dd, mm, yy, hh, mi, ss
print datediff(dd, @data, getdate())

-- stringhe 
set @ricerca = 'rossi'

select replace(p.nome, 'o', '0')
from persone p
where ltrim(rtrim(lower(p.cognome))) = rtrim(ltrim(lower(@ricerca)))

-- Tipologie di funzioni:
-- scalari: da un valore (record) => un solo valore

-- aggregazione: AVG, SUM, MIN, MAX, COUNT
-- da un vettore (insieme di record) => un valore

-- tabella:
-- restituiscono più valori (una matrice di valori)