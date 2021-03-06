CREATE DATABASE [corso_tsql-abletech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'corso_tsql-abletech', FILENAME = N'C:\RDMBSData\ACOLLEONI-PRE01\corso_tsql-abletech.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ),
( NAME = N'indici_db', FILENAME = N'C:\RDMBSData\ACOLLEONI-PRE01\indici_db.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'corso_tsql-abletech_log', FILENAME = N'C:\RDMBSData\ACOLLEONI-PRE01\corso_tsql-abletech_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [corso_tsql-abletech] ADD FILEGROUP [INDICI]
GO
ALTER DATABASE [corso_tsql-abletech] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [corso_tsql-abletech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [corso_tsql-abletech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET ARITHABORT OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [corso_tsql-abletech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [corso_tsql-abletech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [corso_tsql-abletech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [corso_tsql-abletech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [corso_tsql-abletech] SET  MULTI_USER 
GO
ALTER DATABASE [corso_tsql-abletech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [corso_tsql-abletech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [corso_tsql-abletech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [corso_tsql-abletech] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [corso_tsql-abletech] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [corso_tsql-abletech] SET QUERY_STORE = OFF
GO
USE [corso_tsql-abletech]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
CREATE USER [arxivar] FOR LOGIN [arxivar] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [arxivar]
GO
CREATE SCHEMA [test]
GO
CREATE SYNONYM [test].[movimenti] FOR [corso_tsql-abletech].[dbo].[movimenti]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fn_AggiungiDieci]
(
	@valore int
)
RETURNS int
AS
BEGIN
	-- Return the result of the function
	RETURN @valore + 10

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimenti](
	[id] [int] NOT NULL,
	[descrizione] [varchar](10) NULL,
	[data] [datetime] NULL,
	[persona] [int] NULL,
 CONSTRAINT [PK_movimenti] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[movimenti_recenti]
 
as
select [id], [descrizione], [data]
from dbo.movimenti
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   FUNCTION [dbo].[fn_MovimentiDiOggi] 
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

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classifica](
	[id] [int] NOT NULL,
	[squadra] [varchar](50) NULL,
	[punti] [int] NULL,
 CONSTRAINT [PK_classifica] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persone](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[cognome] [varchar](50) NULL,
	[squadra] [int] NULL,
 CONSTRAINT [PK_persone] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [test].[persone](
	[id] [int] NULL,
	[testo] [varchar](50) NULL,
	[numero] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (1, N'Squadra A', 10)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (2, N'Squadra B', 12)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (3, N'Squadra C', 8)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (4, N'Squadra D', 19)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (5, N'Squadra E', 9)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (6, N'Squadra F', 12)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (7, N'Squadra G', 10)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (8, N'Squadra H', 11)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (9, N'Squadra I', 15)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (10, N'Squadra F', 12)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (11, N'Squadra L', 15)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (12, N'Squadra M', 7)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (13, N'Squadra N', 17)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (101, N'Squadra O', 14)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (102, N'Squadra P', 14)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (103, N'Squadra Q', 11)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (104, N'Squadra R', 11)
GO
INSERT [dbo].[classifica] ([id], [squadra], [punti]) VALUES (105, N'Squadra S', 11)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (1, N'aaa', CAST(N'2020-03-12T20:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (2, N'bbb', CAST(N'2020-03-11T10:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (3, N'ccc', CAST(N'2020-03-12T10:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (4, N'aaa', CAST(N'2020-03-11T19:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (5, N'tx 1', CAST(N'2020-03-13T12:55:38.550' AS DateTime), 3)
GO
INSERT [dbo].[movimenti] ([id], [descrizione], [data], [persona]) VALUES (6, N'aaa', CAST(N'2020-03-13T12:57:56.410' AS DateTime), 4)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (1, N'Andrea', N'Colleoni', 1)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (2, N'Mario', N'Rossi', 1)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (3, N'Mario', N'Verdi', 1)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (4, N'Luigi', N'Bianchi', 1)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (300, N'Anna', N'Rossi', 2)
GO
INSERT [dbo].[persone] ([id], [nome], [cognome], [squadra]) VALUES (400, N'Luigi', N'Rossi', 2)
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_classifica_squadra] ON [dbo].[classifica]
(
	[squadra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ix_movimenti_persona] ON [dbo].[movimenti]
(
	[persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movimenti]  WITH CHECK ADD  CONSTRAINT [FK_movimenti_persone] FOREIGN KEY([persona])
REFERENCES [dbo].[persone] ([id])
GO
ALTER TABLE [dbo].[movimenti] CHECK CONSTRAINT [FK_movimenti_persone]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_GestioneErrori] (
	@numero int
)
as 
begin
if @numero > 10
begin
	raiserror(N'hai specificato un numero troppo grande', 16, 1)  with nowait, SETERROR
end

print @numero

end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[sp_PrimaProcedura]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[trg_Classifica] 
   ON  [dbo].[classifica] 
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
ALTER TABLE [dbo].[classifica] ENABLE TRIGGER [trg_Classifica]
GO
EXEC sp_settriggerorder @triggername=N'[dbo].[trg_Classifica]', @order=N'First', @stmttype=N'INSERT'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_Classifica2]
   ON  [dbo].[classifica]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN

	select * from inserted

	select * from deleted

END
GO
ALTER TABLE [dbo].[classifica] ENABLE TRIGGER [trg_Classifica2]
GO
ALTER DATABASE [corso_tsql-abletech] SET  READ_WRITE 
GO
