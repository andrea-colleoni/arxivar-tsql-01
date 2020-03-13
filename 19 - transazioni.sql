
begin transaction

INSERT INTO [dbo].[persone]
           ([id]
           ,[nome]
           ,[cognome]
           ,[squadra])
     VALUES
           (4
           ,'Luigi'
           ,'Bianchi'
           ,1)


INSERT INTO [dbo].[movimenti]
           ([id]
           ,[descrizione]
           ,[data])
     VALUES
           (6
           ,'tx 2'
           ,getdate())

-- commit
-- rollback

GO



