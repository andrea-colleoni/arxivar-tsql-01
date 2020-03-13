SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE or alter TRIGGER trg_Classifica 
   ON  classifica 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- inserted, deleted
	SET NOCOUNT ON;

    print 'dentro al trigger'

	declare @id int,
			@squadra varchar(50)


	select @squadra = squadra
	from inserted

	select @id = MAX(c.id)
	from classifica c
	where id <> (select id from inserted)


	update classifica
	set id = ISNULL(@id, 1) + 1
	where squadra = @squadra

	select *
	from classifica

END
GO

INSERT INTO [dbo].[classifica]
           ([id]
		   ,[squadra]
           ,[punti])
     VALUES
           (20
		   ,'Squadra P'
           ,14)
GO


