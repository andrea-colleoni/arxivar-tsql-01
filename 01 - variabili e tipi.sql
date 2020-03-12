use [corso_tsql-abletech]

select *
from persone

-- funzione di trasformazione SQL => f() M -> M
-- SQL è funzionale

-- T-SQL estensione (anche) procedurali

select cognome
from persone
where id = 1

-- char, nchar, varchar, nvarchar
declare 
	@var_1 char(10),
	@var_2 varchar(MAX) -- (da usare con attenzione in tabella)

set @var_1 = '123'
set @var_2 = '456
			  altra riga
			  altra riga di testo...'

print '*' + @var_1 + '*' + @var_2 + '*'

-- text, ntext (no LIKE!)

-- datetime (Jan 1, 1753	Dec 31, 9999), smalldatetime (Jan 1, 1900	Jun 6, 2079) [3ms]
-- var d = new DateTime() => datetime
-- date (Jan 1, 0001	Dec 31, 9999)
-- time (0:00:00.00000   23:59:59.999999)
-- datetime2 (Jan 1, 0001	Dec 31, 9999) [100 ns]