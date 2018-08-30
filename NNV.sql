USE [master]
GO
/****** Object:  Database [NNV]    Script Date: 30-Aug-18 10:51:45 ******/
CREATE DATABASE [NNV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NNV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NNV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NNV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\NNV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NNV] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NNV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NNV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NNV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NNV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NNV] SET ARITHABORT OFF 
GO
ALTER DATABASE [NNV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NNV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NNV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NNV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NNV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NNV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NNV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NNV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NNV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NNV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NNV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NNV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NNV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NNV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NNV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NNV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NNV] SET RECOVERY FULL 
GO
ALTER DATABASE [NNV] SET  MULTI_USER 
GO
ALTER DATABASE [NNV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NNV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NNV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NNV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NNV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NNV', N'ON'
GO
ALTER DATABASE [NNV] SET QUERY_STORE = OFF
GO
USE [NNV]
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
USE [NNV]
GO
/****** Object:  Table [dbo].[Clanovi]    Script Date: 30-Aug-18 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clanovi](
	[ClanID] [int] IDENTITY(1,1) NOT NULL,
	[Ime_Prezime] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[Korisnicko_Ime] [nvarchar](50) NOT NULL,
	[Sifra] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Clanovi] PRIMARY KEY CLUSTERED 
(
	[ClanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prilozi]    Script Date: 30-Aug-18 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prilozi](
	[SednicaID] [int] NOT NULL,
	[PrilogID] [int] NOT NULL,
	[DokumentID] [int] NOT NULL,
	[Poslato] [bit] NULL,
	[Datum_Slanja] [date] NULL,
	[Prilog_Putanja] [nvarchar](50) NULL,
	[Naziv_Priloga] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prilozi_1] PRIMARY KEY CLUSTERED 
(
	[PrilogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prisustvo]    Script Date: 30-Aug-18 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisustvo](
	[ClanId] [int] NOT NULL,
	[SednicaID] [int] NOT NULL,
	[Prisutan] [bit] NOT NULL,
	[Opravdano] [bit] NULL,
 CONSTRAINT [PK_Prisustvo] PRIMARY KEY CLUSTERED 
(
	[ClanId] ASC,
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sednice]    Script Date: 30-Aug-18 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sednice](
	[SednicaID] [int] NOT NULL,
	[Datum_Vreme] [datetime] NOT NULL,
	[Ucionica] [nvarchar](50) NULL,
	[Tip_Sednice] [nvarchar](50) NOT NULL,
	[Zapisnik] [nvarchar](max) NULL,
	[Poziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sednice] PRIMARY KEY CLUSTERED 
(
	[SednicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vrsta Dokumenata]    Script Date: 30-Aug-18 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vrsta Dokumenata](
	[DokumentID] [int] NOT NULL,
	[Naziv_Dokumenta] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Vrsta Dokumenata] PRIMARY KEY CLUSTERED 
(
	[DokumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 75) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clanovi] ON 

INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [email], [Korisnicko_Ime], [Sifra], [Status]) VALUES (1, N'Milan Stevanovic', N'millan_stevanovic@yahoo.com', N'Chemilan', N'cetcet', 1)
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [email], [Korisnicko_Ime], [Sifra], [Status]) VALUES (3, N'Nebojsa Lukacev', N'nebojsalukacev@gmail.com', N'Nebojsa', N'cetobuka', 1)
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [email], [Korisnicko_Ime], [Sifra], [Status]) VALUES (4, N'Jelena Sundek', N'jelena.sundek@gmail.com', N'Jeca', N'jecasund', 1)
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [email], [Korisnicko_Ime], [Sifra], [Status]) VALUES (5, N'Jasmin', N'jasminjasmi@jasmin.com', N'Jasmin', N'jasmin', 1)
INSERT [dbo].[Clanovi] ([ClanID], [Ime_Prezime], [email], [Korisnicko_Ime], [Sifra], [Status]) VALUES (6, N'Djanfranko Zola', N'zoladogola@gmail.com', N'zolgol', N'djanizol', 0)
SET IDENTITY_INSERT [dbo].[Clanovi] OFF
INSERT [dbo].[Prilozi] ([SednicaID], [PrilogID], [DokumentID], [Poslato], [Datum_Slanja], [Prilog_Putanja], [Naziv_Priloga]) VALUES (1, 1, 1, 1, CAST(N'1986-01-28' AS Date), NULL, NULL)
INSERT [dbo].[Prilozi] ([SednicaID], [PrilogID], [DokumentID], [Poslato], [Datum_Slanja], [Prilog_Putanja], [Naziv_Priloga]) VALUES (2, 2, 3, 1, CAST(N'2018-01-30' AS Date), N'C:\Users\Obuka\Desktop\Nebojsa', NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (1, 2, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (3, 1, 0, 1)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (3, 2, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (4, 1, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (4, 2, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (5, 1, 1, NULL)
INSERT [dbo].[Prisustvo] ([ClanId], [SednicaID], [Prisutan], [Opravdano]) VALUES (5, 2, 0, 1)
INSERT [dbo].[Sednice] ([SednicaID], [Datum_Vreme], [Ucionica], [Tip_Sednice], [Zapisnik], [Poziv]) VALUES (1, CAST(N'1986-02-13T16:00:00.000' AS DateTime), N'RAF 3', N'Redovna', N'Sve tacke dnevnog reda su jednoglasno izglasane.', N'Poziv na 1. sednicu NNV-a. ')
INSERT [dbo].[Sednice] ([SednicaID], [Datum_Vreme], [Ucionica], [Tip_Sednice], [Zapisnik], [Poziv]) VALUES (2, CAST(N'1986-08-16T17:00:00.000' AS DateTime), N'RAF 1', N'Redovna', N'Sednica je uspela.', N'Позив на 2. седницу ННВ-а')
INSERT [dbo].[Sednice] ([SednicaID], [Datum_Vreme], [Ucionica], [Tip_Sednice], [Zapisnik], [Poziv]) VALUES (3, CAST(N'1986-12-31T15:00:00.000' AS DateTime), N'RAF 13', N'Vanredna', N'Rebalans budzeta', N'Poziv na 3. sednicu NNV-a. ')
INSERT [dbo].[Sednice] ([SednicaID], [Datum_Vreme], [Ucionica], [Tip_Sednice], [Zapisnik], [Poziv]) VALUES (4, CAST(N'1987-02-13T17:00:00.000' AS DateTime), N'RAF 368', N'1', N'Usvojen plan prosirenja fakulteta ', N'Poziv na 3. sednicu NNV-a. ')
INSERT [dbo].[Vrsta Dokumenata] ([DokumentID], [Naziv_Dokumenta]) VALUES (1, N'Diplomski rad')
INSERT [dbo].[Vrsta Dokumenata] ([DokumentID], [Naziv_Dokumenta]) VALUES (2, N'Doktorska disertacija')
INSERT [dbo].[Vrsta Dokumenata] ([DokumentID], [Naziv_Dokumenta]) VALUES (3, N'Finansijski izvestaj')
INSERT [dbo].[Vrsta Dokumenata] ([DokumentID], [Naziv_Dokumenta]) VALUES (4, N'Rezultati prijemnog ispita ')
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FK_Prilozi_Sednice] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FK_Prilozi_Sednice]
GO
ALTER TABLE [dbo].[Prilozi]  WITH CHECK ADD  CONSTRAINT [FK_Prilozi_Vrsta Dokumenata] FOREIGN KEY([DokumentID])
REFERENCES [dbo].[Vrsta Dokumenata] ([DokumentID])
GO
ALTER TABLE [dbo].[Prilozi] CHECK CONSTRAINT [FK_Prilozi_Vrsta Dokumenata]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_Prisustvo_Clanovi] FOREIGN KEY([ClanId])
REFERENCES [dbo].[Clanovi] ([ClanID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_Prisustvo_Clanovi]
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD  CONSTRAINT [FK_Prisustvo_Sednice] FOREIGN KEY([SednicaID])
REFERENCES [dbo].[Sednice] ([SednicaID])
GO
ALTER TABLE [dbo].[Prisustvo] CHECK CONSTRAINT [FK_Prisustvo_Sednice]
GO
ALTER TABLE [dbo].[Clanovi]  WITH CHECK ADD  CONSTRAINT [Sifra] CHECK  ((len([Sifra])>=(6)))
GO
ALTER TABLE [dbo].[Clanovi] CHECK CONSTRAINT [Sifra]
GO
USE [master]
GO
ALTER DATABASE [NNV] SET  READ_WRITE 
GO
