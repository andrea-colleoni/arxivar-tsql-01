use [arxivar_corso]

declare
		@id int
      , @nominativo varchar(100)
      , @dataNascita varchar(20)
      , @citta varchar(30)

declare @pos int

declare pers cursor for
SELECT [id]
      ,[nominativo]
      ,[dataNascita]
      ,[citta]
FROM [dbo].[persone]

delete from [persone_2]

open pers

fetch next from pers
into @id, @nominativo, @dataNascita, @citta

while @@FETCH_STATUS = 0
begin
	set @pos = CHARINDEX(' ' , @nominativo)
	-- inserisco i dati nella nuova tabella
	INSERT INTO [dbo].[persone_2]
           ([id]
           ,[nome]
           ,[cognome]
           ,[dataNascita]
           ,[citta])
     VALUES
           (@id
           ,left(@nominativo, @pos)
           ,SUBSTRING(@nominativo, @pos, 100)
           ,cast(@dataNascita as date)
           ,@citta)

	fetch next from pers
	into @id, @nominativo, @dataNascita, @citta
end

close pers
deallocate pers