-- exec [dbo].[sp_PrimaProcedura] '', '2020-03-12' -- positional parameter
/*
create table #temp (
	id int,
	testo varchar(50),
	data date
)
*/

declare @temp table  (
	id int,
	testo varchar(50),
	data date
)

INSERT INTO @temp
           ([id]
           ,[testo]
           ,[data])
exec [dbo].[sp_PrimaProcedura] @dataLimite = '2020-03-12' -- named parameter

select *
from @temp

go
