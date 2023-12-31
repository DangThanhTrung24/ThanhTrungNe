
/****** Object:  Database [J5Shop]    Script Date: 5/28/2021 7:16:52 AM ******/
CREATE DATABASE [J5Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
create DATABASE [J5Shop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J5Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J5Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J5Shop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'J5Shop', N'ON'
GO
ALTER DATABASE [J5Shop] SET QUERY_STORE = OFF
GO
USE [J5Shop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/28/2021 7:16:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[mssv] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[mark] [float] NULL,
	[major] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[mssv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/28/2021 7:16:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[gender] [bit] NOT NULL,
	[country] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ALFKI', N'alfki', N'Maria Anders', N'alfki@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ANATR', N'anatr', N'Ana Trujillo', N'anatr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ANTON', N'anton', N'Antonio Moreno', N'anton@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'AROUT', N'arout', N'Thomas Hardy', N'arout@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BERGS', N'bergs', N'Christina Berglund', N'bergs@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BLAUS', N'blaus', N'Hanna Moos', N'blaus@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BLONP', N'blonp', N'Frédérique Citeaux', N'blonp@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BOLID', N'bolid', N'Martín Sommer', N'bolid@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BONAP', N'bonap', N'Laurence Lebihan', N'bonap@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BOTTM', N'bottm', N'Elizabeth Lincoln', N'bottm@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'BSBEV', N'bsbev', N'Victoria Ashworth', N'bsbev@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CACTU', N'cactu', N'Patricio Simpson', N'cactu@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CENTC', N'centc', N'Francisco Chang', N'centc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CHOPS', N'chops', N'Yang Wang', N'chops@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'COMMI', N'commi', N'Pedro Afonso', N'commi@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'CONSH', N'consh', N'Elizabeth Brown', N'consh@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'customer', N'123', N'Nguyễn Văn Tèo', N'teonv@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'director', N'123', N'Nguyễn Chí Phèo', N'pheonc@fpt.edu.vn', N'-1407968806.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'DRACD', N'dracd', N'Sven Ottlieb', N'dracd@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'DUMON', N'dumon', N'Janine Labrune', N'dumon@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'EASTC', N'eastc', N'Ann Devon', N'eastc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ERNSH', N'ernsh', N'Roland Mendel', N'ernsh@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FAMIA', N'famia', N'Aria Cruz', N'famia@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FISSA', N'fissa', N'Diego Roel', N'fissa@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FOLIG', N'folig', N'Martine Rancé', N'folig@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FOLKO', N'folko', N'Maria Larsson', N'folko@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANK', N'frank', N'Peter Franken', N'frank@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANR', N'franr', N'Carine Schmitt', N'franr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FRANS', N'frans', N'Paolo Accorti', N'frans@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'FURIB', N'furib', N'Lino Rodriguez', N'furib@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GALED', N'galed', N'Eduardo Saavedra', N'galed@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GODOS', N'godos', N'José Pedro Freyre', N'godos@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GOURL', N'gourl', N'André Fonseca', N'gourl@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GREAL', N'greal', N'Howard Snyder', N'greal@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'GROSR', N'grosr', N'Manuel Pereira', N'grosr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HANAR', N'hanar', N'Mario Pontes', N'hanar@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HILAA', N'hilaa', N'Carlos Hernández', N'hilaa@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HUNGC', N'hungc', N'Yoshi Latimer', N'hungc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'HUNGO', N'hungo', N'Patricia McKenna', N'hungo@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ISLAT', N'islat', N'Helen Bennett', N'islat@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'KOENE', N'koene', N'Philip Cramer', N'koene@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LACOR', N'lacor', N'Daniel Tonini', N'lacor@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAMAI', N'lamai', N'Annette Roulet', N'lamai@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAUGB', N'laugb', N'Yoshi Tannamuri', N'laugb@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LAZYK', N'lazyk', N'John Steel', N'lazyk@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LEHMS', N'lehms', N'Renate Messner', N'lehms@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LETSS', N'letss', N'Jaime Yorres', N'letss@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LILAS', N'lilas', N'Carlos González', N'lilas@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LINOD', N'linod', N'Felipe Izquierdo', N'linod@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'LONEP', N'lonep', N'Fran Wilson', N'lonep@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MAGAA', N'magaa', N'Giovanni Rovelli', N'magaa@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MAISD', N'maisd', N'Catherine Dewey', N'maisd@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MEREP', N'merep', N'Jean Fresnière', N'merep@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'MORGK', N'morgk', N'Alexander Feuer', N'morgk@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NORTS', N'norts', N'Simon Crowther', N'norts@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'OCEAN', N'ocean', N'Yvonne Moncada', N'ocean@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'OLDWO', N'oldwo', N'Rene Phillips', N'oldwo@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'OTTIK', N'ottik', N'Henriette Pfalzheim', N'ottik@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'PARIS', N'paris', N'Marie Bertrand', N'paris@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'PERIC', N'peric', N'Guillermo Fernández', N'peric@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'PICCO', N'picco', N'Georg Pipps', N'picco@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'PRINI', N'prini', N'Isabel de Castro', N'prini@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'QUEDE', N'quede', N'Bernardo Batista', N'quede@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'QUEEN', N'queen', N'Lúcia Carvalho', N'queen@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'QUICK', N'quick', N'Horst Kloss', N'quick@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'RANCH', N'ranch', N'Sergio Gutiérrez', N'ranch@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'RATTC', N'rattc', N'Paula Wilson', N'rattc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'REGGC', N'reggc', N'Maurizio Moroni', N'reggc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'RICAR', N'ricar', N'Janete Limeira', N'ricar@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'RICSU', N'ricsu', N'Michael Holz', N'ricsu@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'ROMEY', N'romey', N'Alejandra Camino', N'romey@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SANTG', N'santg', N'Jonas Bergulfsen', N'santg@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SAVEA', N'savea', N'Jose Pavarotti', N'savea@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SEVES', N'seves', N'Hari Kumar', N'seves@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SIMOB', N'simob', N'Jytte Petersen', N'simob@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SPECD', N'specd', N'Dominique Perrier', N'specd@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SPLIR', N'splir', N'Art Braunschweiger', N'splir@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'staff', N'123', N'Phạm Thị Nở', N'nopt@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'SUPRD', N'suprd', N'Pascale Cartrain', N'suprd@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'THEBI', N'thebi', N'Liz Nixon', N'thebi@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'THECR', N'thecr', N'Liu Wong', N'thecr@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'TOMSP', N'tomsp', N'Karin Josephs', N'tomsp@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'TORTU', N'tortu', N'Miguel Angel Paolino', N'tortu@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'TRADH', N'tradh', N'Anabela Domingues', N'tradh@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'TRAIH', N'traih', N'Helvetius Nagy', N'traih@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'VAFFE', N'vaffe', N'Palle Ibsen', N'vaffe@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'VICTE', N'victe', N'Mary Saveley', N'victe@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'VINET', N'vinet', N'Paul Henriot', N'vinet@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WANDK', N'wandk', N'Rita Müller', N'wandk@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WARTH', N'warth', N'Pirkko Koskitalo', N'warth@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WELLI', N'welli', N'Paula Parente', N'welli@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WHITC', N'whitc', N'Karl Jablonski', N'whitc@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WILMK', N'wilmk', N'Matti Karttunen', N'wilmk@gmail.com', N'user.png', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'WOLZA', N'wolza', N'Zbyszek Piestrzeniewicz', N'wolza@gmail.com', N'user.png', 1, 1)
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'ALFKI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'ANATR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'ANTON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'AROUT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'BERGS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'BLAUS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'BLONP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'BOLID', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'BONAP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'BOTTM', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'BSBEV', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'CACTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (14, N'CENTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (15, N'CHOPS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (16, N'COMMI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (17, N'CONSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (18, N'DRACD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (19, N'DUMON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (20, N'EASTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (21, N'ERNSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'FAMIA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'FISSA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'FOLIG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (25, N'FOLKO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (26, N'FRANK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (27, N'FRANR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (28, N'FRANS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (29, N'FURIB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (30, N'GALED', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (31, N'GODOS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (32, N'GOURL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (33, N'GREAL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (34, N'GROSR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (35, N'HANAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (36, N'HILAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (37, N'HUNGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (38, N'HUNGO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (39, N'ISLAT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (40, N'KOENE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (41, N'LACOR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (42, N'LAMAI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (43, N'LAUGB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (44, N'LAZYK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (45, N'LEHMS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (46, N'LETSS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (47, N'LILAS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (48, N'LINOD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (49, N'LONEP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (50, N'MAGAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (51, N'MAISD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (52, N'MEREP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (53, N'MORGK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (55, N'NORTS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (56, N'OCEAN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (57, N'OLDWO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (58, N'OTTIK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (59, N'PARIS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (60, N'PERIC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (61, N'PICCO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (62, N'PRINI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (63, N'QUEDE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (64, N'QUEEN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (65, N'QUICK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (66, N'RANCH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (67, N'RATTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (68, N'REGGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (69, N'RICAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (70, N'RICSU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (71, N'ROMEY', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (72, N'SANTG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (74, N'SAVEA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (75, N'SEVES', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (76, N'SIMOB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (77, N'SPECD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (78, N'SPLIR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (79, N'SUPRD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (80, N'customer', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (82, N'THEBI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (83, N'THECR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (84, N'TOMSP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (85, N'TORTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (86, N'TRADH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (87, N'TRAIH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (89, N'VAFFE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (90, N'VICTE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (91, N'VINET', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (92, N'WANDK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (93, N'WARTH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (94, N'WELLI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (95, N'WHITC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (96, N'WILMK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (97, N'WOLZA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'director', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (100, N'staff', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2103, N'director', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7103, N'staff', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Máy tính xách tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Máy ảnh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Điện thoại')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Nước bông')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Nữ trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'Nón thời trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'Túi xách du lịch')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'5000', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'5001', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'5002', N'Đồng hồ đeo tay')
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100005, 10249, 1051, 42.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100006, 10250, 1041, 7.7, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100007, 10250, 1051, 42.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100008, 10250, 1065, 16.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100009, 10251, 1022, 16.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100010, 10251, 1057, 15.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100011, 10251, 1065, 16.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100012, 10252, 1020, 64.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100013, 10252, 1033, 2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100014, 10252, 1060, 27.2, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100015, 10253, 1031, 10, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100016, 10253, 1039, 14.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100017, 10253, 1049, 16, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100018, 10254, 1024, 3.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100019, 10254, 1055, 19.2, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100020, 10254, 1074, 8, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100021, 10255, 1002, 15.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100022, 10255, 1016, 13.9, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100023, 10255, 1036, 15.2, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100024, 10255, 1059, 44, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100025, 10256, 1053, 26.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100026, 10256, 1077, 10.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100027, 10257, 1027, 35.1, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100028, 10257, 1039, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100029, 10257, 1077, 10.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100030, 10258, 1002, 15.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100032, 10258, 1032, 25.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100033, 10259, 1021, 8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100034, 10259, 1037, 20.8, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100035, 10260, 1041, 7.7, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100036, 10260, 1057, 15.6, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100037, 10260, 1062, 39.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100038, 10260, 1070, 12, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100039, 10261, 1021, 8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100040, 10261, 1035, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100042, 10262, 1007, 24, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100043, 10262, 1056, 30.4, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100044, 10263, 1016, 13.9, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100045, 10263, 1024, 3.6, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100046, 10263, 1030, 20.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100047, 10263, 1074, 8, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100048, 10264, 1002, 15.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100049, 10264, 1041, 7.7, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100050, 10265, 1017, 31.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100051, 10265, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100052, 10266, 1012, 30.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100053, 10267, 1040, 14.7, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100054, 10267, 1059, 44, 70)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100055, 10267, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100056, 10268, 1029, 99, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100058, 10269, 1033, 2, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100060, 10270, 1036, 15.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100061, 10270, 1043, 36.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100062, 10271, 1033, 2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100063, 10272, 1020, 64.8, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100064, 10272, 1031, 10, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100066, 10273, 1010, 24.8, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100067, 10273, 1031, 10, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100068, 10273, 1033, 2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100069, 10273, 1040, 14.7, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100070, 10273, 1076, 14.4, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100071, 10274, 1071, 17.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100073, 10275, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100074, 10275, 1059, 44, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100075, 10276, 1010, 24.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100076, 10276, 1013, 4.8, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100077, 10277, 1028, 36.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100078, 10277, 1062, 39.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100079, 10278, 1044, 15.5, 16)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100080, 10278, 1059, 44, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100081, 10278, 1063, 35.1, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100082, 10278, 1073, 12, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100083, 10279, 1017, 31.2, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100084, 10280, 1024, 3.6, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100085, 10280, 1055, 19.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100086, 10280, 1075, 6.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100087, 10281, 1019, 7.3, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100088, 10281, 1024, 3.6, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100089, 10281, 1035, 14.4, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100090, 10282, 1030, 20.7, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100091, 10282, 1057, 15.6, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100092, 10283, 1015, 12.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100093, 10283, 1019, 7.3, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100094, 10283, 1060, 27.2, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100096, 10284, 1027, 35.1, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100097, 10284, 1044, 15.5, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100098, 10284, 1060, 27.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100099, 10284, 1067, 11.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100100, 10285, 1001, 14.4, 45)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100101, 10285, 1040, 14.7, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100102, 10285, 1053, 26.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100103, 10286, 1035, 14.4, 100)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100104, 10286, 1062, 39.4, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100105, 10287, 1016, 13.9, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100106, 10287, 1034, 11.2, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100107, 10287, 1046, 9.6, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100108, 10288, 1054, 5.9, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100109, 10288, 1068, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100110, 10289, 1003, 8, 30)

SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10249, N'TOMSP', CAST(N'1996-07-05T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10250, N'HANAR', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10251, N'VICTE', CAST(N'1996-07-08T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10252, N'SUPRD', CAST(N'1996-07-09T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10253, N'HANAR', CAST(N'1996-07-10T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10254, N'CHOPS', CAST(N'1996-07-11T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10255, N'RICSU', CAST(N'1996-07-12T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10256, N'WELLI', CAST(N'1996-07-15T00:00:00.000' AS DateTime), N'Rua do Mercado, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10257, N'HILAA', CAST(N'1996-07-16T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10258, N'ERNSH', CAST(N'1996-07-17T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10259, N'CENTC', CAST(N'1996-07-18T00:00:00.000' AS DateTime), N'Sierras de Granada 9993')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10260, N'OTTIK', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10261, N'QUEDE', CAST(N'1996-07-19T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10262, N'RATTC', CAST(N'1996-07-22T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10263, N'ERNSH', CAST(N'1996-07-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10264, N'FOLKO', CAST(N'1996-07-24T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10265, N'BLONP', CAST(N'1996-07-25T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10266, N'WARTH', CAST(N'1996-07-26T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10267, N'FRANK', CAST(N'1996-07-29T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10268, N'GROSR', CAST(N'1996-07-30T00:00:00.000' AS DateTime), N'5ª Ave. Los Palos Grandes')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10269, N'WHITC', CAST(N'1996-07-31T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10270, N'WARTH', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10271, N'SPLIR', CAST(N'1996-08-01T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10272, N'RATTC', CAST(N'1996-08-02T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10273, N'QUICK', CAST(N'1996-08-05T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10274, N'VINET', CAST(N'1996-08-06T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10275, N'MAGAA', CAST(N'1996-08-07T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10276, N'TORTU', CAST(N'1996-08-08T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10277, N'MORGK', CAST(N'1996-08-09T00:00:00.000' AS DateTime), N'Heerstr. 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10278, N'BERGS', CAST(N'1996-08-12T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10279, N'LEHMS', CAST(N'1996-08-13T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10280, N'BERGS', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Berguvsvägen  8')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10281, N'ROMEY', CAST(N'1996-08-14T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10282, N'ROMEY', CAST(N'1996-08-15T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10283, N'LILAS', CAST(N'1996-08-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10284, N'LEHMS', CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10285, N'QUICK', CAST(N'1996-08-20T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10286, N'QUICK', CAST(N'1996-08-21T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10287, N'RICAR', CAST(N'1996-08-22T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10288, N'REGGC', CAST(N'1996-08-23T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10289, N'BSBEV', CAST(N'1996-08-26T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10290, N'COMMI', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10291, N'QUEDE', CAST(N'1996-08-27T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10292, N'TRADH', CAST(N'1996-08-28T00:00:00.000' AS DateTime), N'Av. Inês de Castro, 414')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10293, N'TORTU', CAST(N'1996-08-29T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10294, N'RATTC', CAST(N'1996-08-30T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10295, N'VINET', CAST(N'1996-09-02T00:00:00.000' AS DateTime), N'59 rue de l''Abbaye')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10296, N'LILAS', CAST(N'1996-09-03T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10297, N'BLONP', CAST(N'1996-09-04T00:00:00.000' AS DateTime), N'24, place Kléber')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10298, N'HUNGO', CAST(N'1996-09-05T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10299, N'RICAR', CAST(N'1996-09-06T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10300, N'MAGAA', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10301, N'WANDK', CAST(N'1996-09-09T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10302, N'SUPRD', CAST(N'1996-09-10T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10303, N'GODOS', CAST(N'1996-09-11T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10304, N'TORTU', CAST(N'1996-09-12T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10305, N'OLDWO', CAST(N'1996-09-13T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10306, N'ROMEY', CAST(N'1996-09-16T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10307, N'LONEP', CAST(N'1996-09-17T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10308, N'ANATR', CAST(N'1996-09-18T00:00:00.000' AS DateTime), N'Avda. de la Constitución 2222')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10309, N'HUNGO', CAST(N'1996-09-19T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10310, N'THEBI', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10311, N'DUMON', CAST(N'1996-09-20T00:00:00.000' AS DateTime), N'67, rue des Cinquante Otages')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10312, N'WANDK', CAST(N'1996-09-23T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10313, N'QUICK', CAST(N'1996-09-24T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10314, N'RATTC', CAST(N'1996-09-25T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10315, N'ISLAT', CAST(N'1996-09-26T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10316, N'RATTC', CAST(N'1996-09-27T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10317, N'LONEP', CAST(N'1996-09-30T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10318, N'ISLAT', CAST(N'1996-10-01T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10319, N'TORTU', CAST(N'1996-10-02T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10320, N'WARTH', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10321, N'ISLAT', CAST(N'1996-10-03T00:00:00.000' AS DateTime), N'Garden House Crowther Way')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10322, N'PERIC', CAST(N'1996-10-04T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10323, N'KOENE', CAST(N'1996-10-07T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10324, N'SAVEA', CAST(N'1996-10-08T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10325, N'KOENE', CAST(N'1996-10-09T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10326, N'BOLID', CAST(N'1996-10-10T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10327, N'FOLKO', CAST(N'1996-10-11T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10328, N'FURIB', CAST(N'1996-10-14T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10329, N'SPLIR', CAST(N'1996-10-15T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10330, N'LILAS', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10331, N'BONAP', CAST(N'1996-10-16T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10332, N'MEREP', CAST(N'1996-10-17T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10333, N'WARTH', CAST(N'1996-10-18T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10334, N'VICTE', CAST(N'1996-10-21T00:00:00.000' AS DateTime), N'2, rue du Commerce')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10335, N'HUNGO', CAST(N'1996-10-22T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10336, N'PRINI', CAST(N'1996-10-23T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10337, N'FRANK', CAST(N'1996-10-24T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10338, N'OLDWO', CAST(N'1996-10-25T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10339, N'MEREP', CAST(N'1996-10-28T00:00:00.000' AS DateTime), N'43 rue St. Laurent')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10340, N'BONAP', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10341, N'SIMOB', CAST(N'1996-10-29T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10342, N'FRANK', CAST(N'1996-10-30T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10343, N'LEHMS', CAST(N'1996-10-31T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10344, N'WHITC', CAST(N'1996-11-01T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10345, N'QUICK', CAST(N'1996-11-04T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10346, N'RATTC', CAST(N'1996-11-05T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10347, N'FAMIA', CAST(N'1996-11-06T00:00:00.000' AS DateTime), N'Rua Orós, 92')

SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'anhntps10770@fpt.edu.vn', N'Nguyễn Tiến Anh', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'chaulnnps10835@fpt.edu.vn', N'Lê Nguyễn Ngọc Châu', 7, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'cuonglcps10817@fpt.edu.vn', N'Lý Chí Cường', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'datnvps10930@fpt.edu.vn', N'Nguyễn Vũ Đạt', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'dobps10723@fpt.edu.vn', N'Bùi Đỏ', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'ducnpps10800@fpt.edu.vn', N'Nguyễn Phúc Đức', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'duytkps10303@fpt.edu.vn', N'Trần Khánh Duy', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'huyntps10808@fpt.edu.vn', N'Nguyễn Thanh Huy', 4, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'khaihcps10763@fpt.edu.vn', N'Hoàng Cao Khải', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'luudpps10344@fpt.edu.vn', N'Đào Phong Lưu', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'manhbdps09585@fpt.edu.vn', N'Bùi Đức Mạnh', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phatltps10691@fpt.edu.vn', N'Lê Tấn Phát', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phucpbps10710@fpt.edu.vn', N'Phạm Bá Phúc', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phuongntdps09013@fpt.edu.vn', N'Nguyễn Thị Diễm Phương', 8, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangnmps10741@fpt.edu.vn', N'Nguyễn Minh Quang', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangvvtps09851@fpt.edu.vn', N'Võ Văn Thanh Quang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sangntps10356@fpt.edu.vn', N'Nguyễn Tống Sang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sonntps10858@fpt.edu.vn', N'Nguyễn Thanh Sơn', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'suotlvmps10970@fpt.edu.vn', N'Lê Vương Minh Suốt', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thachnhps10818@fpt.edu.vn', N'Nguyễn Hữu Thạch', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thangtvps10394@fpt.edu.vn', N'Trằn Văn Thắng', 9, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trangntpps10956@fpt.edu.vn', N'Nguyễn Thị Phương Trang', 4, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trungdvps10716@fpt.edu.vn', N'Đặng Văn Trung', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuanncqps10850@fpt.edu.vn', N'Nguyễn Cửu Quang Tuấn', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuannnps10819@fpt.edu.vn', N'Nguyễn Ngọc Tuấn', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'vinhptps09842@fpt.edu.vn', N'Phạm Thế Vinh', 10, 1, N'VN')
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO
