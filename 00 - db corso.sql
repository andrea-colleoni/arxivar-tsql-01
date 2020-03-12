DROP PROCEDURE IF EXISTS [sp_PrimaProcedura]
GO
DROP TABLE IF EXISTS [persone]
GO
DROP TABLE IF EXISTS [classifica]
GO
DROP FUNCTION IF EXISTS [fn_MovimentiDiOggi]
GO
DROP INDEX IF EXISTS [ix_mov] ON [movimenti_recenti] WITH ( ONLINE = OFF )
GO
DROP VIEW IF EXISTS [movimenti_recenti]
GO
DROP TABLE IF EXISTS [movimenti]
GO
DROP FUNCTION IF EXISTS [fn_AggiungiDieci]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[fn_AggiungiDieci]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [fn_AggiungiDieci]
(
	@valore int
)
RETURNS int
AS
BEGIN
	-- Return the result of the function
	RETURN @valore + 10

END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[movimenti]') AND type in (N'U'))
BEGIN
CREATE TABLE [movimenti](
	[id] [int] NULL,
	[descrizione] [varchar](10) NULL,
	[data] [datetime] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[movimenti_recenti]'))
EXEC dbo.sp_executesql @statement = N'create   view [movimenti_recenti]
with schemabinding
as
select [id], [descrizione], [data]
from dbo.movimenti' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[movimenti_recenti]') AND name = N'ix_mov')
CREATE UNIQUE CLUSTERED INDEX [ix_mov] ON [movimenti_recenti]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[fn_MovimentiDiOggi]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   FUNCTION [fn_MovimentiDiOggi] 
(	
	@limite int = 0
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT m.* 
	FROM [dbo].[movimenti] m
	where cast(m.data as date) = cast(getdate() as date)
)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[classifica]') AND type in (N'U'))
BEGIN
CREATE TABLE [classifica](
	[id] [int] NULL,
	[squadra] [varchar](50) NULL,
	[punti] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[persone]') AND type in (N'U'))
BEGIN
CREATE TABLE [persone](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[cognome] [varchar](50) NULL,
	[squadra] [int] NULL,
 CONSTRAINT [PK_persone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (1, N'Squadra A', 10)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (2, N'Squadra B', 12)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (3, N'Squadra C', 8)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (4, N'Squadra D', 19)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (5, N'Squadra E', 9)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (6, N'Squadra F', 12)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (7, N'Squadra G', 10)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (8, N'Squadra H', 11)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (9, N'Squadra I', 15)
GO
INSERT [classifica] ([id], [squadra], [punti]) VALUES (10, N'Squadra F', 12)
GO
INSERT [movimenti] ([id], [descrizione], [data]) VALUES (1, N'aaa', CAST(N'2020-03-12T20:00:00.000' AS DateTime))
GO
INSERT [movimenti] ([id], [descrizione], [data]) VALUES (2, N'bbb', CAST(N'2020-03-11T10:00:00.000' AS DateTime))
GO
INSERT [movimenti] ([id], [descrizione], [data]) VALUES (3, N'ccc', CAST(N'2020-03-12T10:00:00.000' AS DateTime))
GO
INSERT [movimenti] ([id], [descrizione], [data]) VALUES (4, N'ddd', CAST(N'2020-03-11T19:00:00.000' AS DateTime))
GO
INSERT [persone] ([id], [nome], [cognome], [squadra]) VALUES (1, N'Andrea', N'Colleoni', 1)
GO
INSERT [persone] ([id], [nome], [cognome], [squadra]) VALUES (2, N'Mario', N'Rossi', 1)
GO
INSERT [persone] ([id], [nome], [cognome], [squadra]) VALUES (300, N'Anna', N'Rossi', 2)
GO
INSERT [persone] ([id], [nome], [cognome], [squadra]) VALUES (400, N'Luigi', N'Rossi', 2)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sp_PrimaProcedura]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sp_PrimaProcedura] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER   PROCEDURE [sp_PrimaProcedura]
	@dummy varchar(10) = null,
	@dataLimite date 
AS
BEGIN

    -- Insert statements for procedure here
	SELECT m.* 
	FROM [dbo].[movimenti] m
	where m.data >= @dataLimite
END
GO
