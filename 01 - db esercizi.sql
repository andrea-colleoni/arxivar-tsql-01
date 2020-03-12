/****** Object:  Database [arxivar_corso]    Script Date: 12/03/2020 18:13:16 ******/
CREATE DATABASE [arxivar_corso]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'arxivar_corso', FILENAME = N'C:\RDMBSData\ACOLLEONI-PRE01\arxivar_corso.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'arxivar_corso_log', FILENAME = N'C:\RDMBSData\ACOLLEONI-PRE01\arxivar_corso_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [arxivar_corso] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [arxivar_corso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [arxivar_corso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [arxivar_corso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [arxivar_corso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [arxivar_corso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [arxivar_corso] SET ARITHABORT OFF 
GO
ALTER DATABASE [arxivar_corso] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [arxivar_corso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [arxivar_corso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [arxivar_corso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [arxivar_corso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [arxivar_corso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [arxivar_corso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [arxivar_corso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [arxivar_corso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [arxivar_corso] SET  DISABLE_BROKER 
GO
ALTER DATABASE [arxivar_corso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [arxivar_corso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [arxivar_corso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [arxivar_corso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [arxivar_corso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [arxivar_corso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [arxivar_corso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [arxivar_corso] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [arxivar_corso] SET  MULTI_USER 
GO
ALTER DATABASE [arxivar_corso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [arxivar_corso] SET DB_CHAINING OFF 
GO
ALTER DATABASE [arxivar_corso] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [arxivar_corso] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [arxivar_corso] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [arxivar_corso] SET QUERY_STORE = OFF
GO
USE [arxivar_corso]
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
/****** Object:  UserDefinedFunction [dbo].[fn_Tabella]    Script Date: 12/03/2020 18:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fn_Tabella] 
(
)
RETURNS 
@result TABLE 
(
	id int,
	nome varchar(50)
)
AS
BEGIN
	insert into @result (id, nome)
	values (1, 'ciao')

	-- print 'yololo'

	RETURN 
END
GO
/****** Object:  Table [dbo].[persone_2]    Script Date: 12/03/2020 18:13:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persone_2](
	[id] [int] NULL,
	[nome] [varchar](50) NULL,
	[cognome] [varchar](50) NULL,
	[dataNascita] [date] NULL,
	[citta] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Palindromi]    Script Date: 12/03/2020 18:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[fn_Palindromi]
(	
)
RETURNS TABLE 
AS
RETURN 
(

	SELECT [id]
      ,[nome]
      ,[cognome]
      ,[dataNascita]
      ,[citta]
	FROM [dbo].[persone_2]
	WHERE REVERSE([nome]) = [nome]

)
GO
/****** Object:  Table [dbo].[persone]    Script Date: 12/03/2020 18:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persone](
	[id] [int] NULL,
	[nominativo] [varchar](100) NULL,
	[dataNascita] [varchar](20) NULL,
	[citta] [varchar](30) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[persone] ([id], [nominativo], [dataNascita], [citta]) VALUES (1, N'Andrea Colleoni', N'1973-08-30', N'Bergamo')
GO
INSERT [dbo].[persone] ([id], [nominativo], [dataNascita], [citta]) VALUES (2, N'Mario Rossi', N'1980-05-06', N'Milano')
GO
INSERT [dbo].[persone] ([id], [nominativo], [dataNascita], [citta]) VALUES (3, N'Luigi Verdi', N'1960-09-07', N'Brescia')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (1, N'Andrea ', N' Colleoni', CAST(N'1973-08-30' AS Date), N'Bergamo')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (2, N'Mario ', N' Rossi', CAST(N'1980-05-06' AS Date), N'Milano')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (3, N'Luigi ', N' Verdi', CAST(N'1960-09-07' AS Date), N'Brescia')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (4, N'Anna', N'Verdi', CAST(N'1970-05-04' AS Date), N'Milano')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (5, N'Rosa*', N'Bianchi', CAST(N'1968-03-12' AS Date), N'Milano')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (6, N'Antonio*', N'Neri', CAST(N'1988-03-12' AS Date), N'Milano')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (7, N'Otto', N'Merkel', CAST(N'1988-04-12' AS Date), N'Milano')
GO
INSERT [dbo].[persone_2] ([id], [nome], [cognome], [dataNascita], [citta]) VALUES (8, N'Ada', N'Verdi', CAST(N'1978-05-07' AS Date), N'Perugia')
GO
/****** Object:  StoredProcedure [dbo].[sp_Compleanno]    Script Date: 12/03/2020 18:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_Compleanno]
as
begin
	
	declare @id int

	declare pers cursor for
	select id
	from persone_2 p
	where day(getdate()) = day(p.dataNascita) and MONTH(getdate()) = MONTH(p.dataNascita)

	open pers

	fetch next from pers into @id

	while @@FETCH_STATUS = 0
	begin

		UPDATE [dbo].[persone_2]
		SET [nome] = [nome] + '*'
		WHERE id = @id

		fetch next from pers into @id
	end

	close pers
	deallocate pers

end
GO
/****** Object:  StoredProcedure [dbo].[sp_InserisciPersona]    Script Date: 12/03/2020 18:13:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[sp_InserisciPersona] (
	@nome varchar(50),
	@cognome varchar(50),
	@dataNascita date,
	@citta varchar(30)
)
as
begin

	declare @id int

	select @id = MAX(p.id)
	from persone_2 p

	INSERT INTO [dbo].[persone_2]
           ([id]
           ,[nome]
           ,[cognome]
           ,[dataNascita]
           ,[citta])
     VALUES
           (
		   ISNULL(@id, 0) + 1
           ,@nome
           ,@cognome
           ,@dataNascita
           ,@citta
		   )
	
	select *
	from persone_2
	where id = (ISNULL(@id, 0) + 1)
end
GO
ALTER DATABASE [arxivar_corso] SET  READ_WRITE 
GO
