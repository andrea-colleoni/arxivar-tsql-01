CREATE TRIGGER trg_Classifica2
   ON  classifica
   AFTER INSERT,DELETE,UPDATE   -- INSTEAD OF
AS 
BEGIN

	select * from inserted

	select * from deleted

END
GO

INSERT INTO [dbo].[classifica]
           ([id]
		   ,[squadra]
           ,[punti])
     VALUES
           (20
		   ,'Squadra S'
           ,11)
