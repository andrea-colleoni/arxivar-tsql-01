USE [corso_tsql-abletech]
GO
ALTER INDEX [PK_classifica] ON [dbo].[classifica] REORGANIZE  WITH ( LOB_COMPACTION = ON )
GO
USE [corso_tsql-abletech]
GO
ALTER INDEX [ix_classifica_squadra] ON [dbo].[classifica] REORGANIZE  WITH ( LOB_COMPACTION = ON )
GO
