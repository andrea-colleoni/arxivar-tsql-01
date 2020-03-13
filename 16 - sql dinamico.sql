declare @tabella varchar(100),
		@campo varchar(100),
		@id int,
		@sql nvarchar(max)

set @tabella = 'movimenti'
set @campo = '*'
-- set @id = '1 or 1 = 1' -- SQL injection!!
set @id = 2

set @sql = 'select ' + @campo + ' from ' + @tabella + ' where id = @id'
print @sql

exec sp_executesql @sql, N'@id int', @id = @id