declare   @testo varchar(100)
		, @pos int
		, @dataTesto varchar(20)
		, @dataData date	
set @testo = 'abcdefghijklmnopqrstuvwxyz 1234567890'


print left(@testo, 10)
print right(@testo, 10)

set @pos = CHARINDEX(' ' , @testo)
print @pos
print left (@testo, @pos)

set @dataTesto = '01/02/2020'
set @dataData = cast(@dataTesto as date)

print @dataData