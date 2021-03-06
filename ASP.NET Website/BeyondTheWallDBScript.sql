USE [master]
GO
/****** Object:  Database [BeyondTheWallDB]    Script Date: 4/7/2017 3:04:44 PM ******/
CREATE DATABASE [BeyondTheWallDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeyondTheWallDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BeyondTheWallDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BeyondTheWallDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BeyondTheWallDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BeyondTheWallDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeyondTheWallDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeyondTheWallDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeyondTheWallDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeyondTheWallDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeyondTheWallDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeyondTheWallDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BeyondTheWallDB] SET  MULTI_USER 
GO
ALTER DATABASE [BeyondTheWallDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeyondTheWallDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeyondTheWallDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeyondTheWallDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BeyondTheWallDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BeyondTheWallDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varbinary](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Stamp] [timestamp] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[tamales] [int] NOT NULL,
	[carnitas] [int] NOT NULL,
	[frijoles] [int] NOT NULL,
	[rellenos] [int] NOT NULL,
	[chilaquiles] [int] NOT NULL,
	[horchata] [int] NOT NULL,
	[jugo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK__User__1788CCAC3958779E] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [UserName], [Password]) VALUES (1, N'Bob', 0x5F4DCC3B5AA765D61D8327DEB882CF99)
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password]) VALUES (2, N'Bob', 0xD41D8CD98F00B204E9800998ECF8427E)
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password]) VALUES (3, N'alex', 0x5F4DCC3B5AA765D61D8327DEB882CF99)
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password]) VALUES (4, N'alex2', 0x8FE4C11451281C094A6578E6DDBF5EED)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [Comment]) VALUES (1, N'Hello!')
INSERT [dbo].[Comment] ([CommentID], [Comment]) VALUES (2, N'Blah')
INSERT [dbo].[Comment] ([CommentID], [Comment]) VALUES (3, N'Dude')
INSERT [dbo].[Comment] ([CommentID], [Comment]) VALUES (4, N'Hello!')
INSERT [dbo].[Comment] ([CommentID], [Comment]) VALUES (5, N'Dude')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (1, 3, 1, 2, 1, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (3, 1, 1, 2, 2, 3, 1, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (4, 1, 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (5, 1, 1, 1, 1, 1, 1, 2)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (6, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (7, 0, 2, 0, 2, 0, 0, 2)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (8, 3, 0, 1, 1, 1, 0, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (9, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (10, 1, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (11, 2, 2, 2, 1, 1, 1, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (12, 2, 2, 3, 1, 2, 2, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (13, 3, 3, 4, 2, 3, 3, 2)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (14, 4, 4, 4, 3, 3, 3, 3)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (15, 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (16, 1, 1, 1, 0, 0, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (17, 0, 0, 1, 1, 0, 1, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (18, 1, 0, 2, 2, 1, 2, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (19, 0, 0, 0, 0, 0, 0, 1)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (20, 1, 0, 1, 1, 1, 1, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (21, 1, 0, 2, 2, 1, 1, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (22, 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Order] ([OrderID], [tamales], [carnitas], [frijoles], [rellenos], [chilaquiles], [horchata], [jugo]) VALUES (23, 1, 1, 0, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [OrderID], [Name]) VALUES (1, 22, N'')
INSERT [dbo].[User] ([UserID], [OrderID], [Name]) VALUES (2, 23, N'')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [tamales]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [carnitas]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [frijoles]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [rellenos]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [chilaquiles]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [horchata]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [jugo]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [OrderID]
GO
/****** Object:  StoredProcedure [dbo].[spGetAdmin]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAdmin]
	-- Add the parameters for the stored procedure here
	@Name VARCHAR(50),
	@Password VARBINARY(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [dbo].[Admin] WHERE [Admin].[Username] = @Name AND [Admin].[Password] = @Password
	RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[spGetComments]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetComments]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT * FROM [dbo].[Comment]
END

GO
/****** Object:  StoredProcedure [dbo].[spGetLastOrder]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLastOrder]
AS
BEGIN	
	SELECT * FROM [User]
END
GO
/****** Object:  StoredProcedure [dbo].[spGetUsers]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetUsers]
AS
BEGIN
	SELECT Name, tamales, carnitas, frijoles, rellenos, chilaquiles, horchata, jugo FROM [dbo].[User]
	INNER JOIN [dbo].[Order]
	ON [dbo].[User].[OrderID]=[dbo].[Order].[OrderID]	
	ORDER BY Name;
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewAdmin]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertNewAdmin]
	-- Add the parameters for the stored procedure here
	@Name NVARCHAR(50),
	@Password VARBINARY(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Admin] (UserName, Password)
	VALUES (@Name, @Password);
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertNewComment]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertNewComment]
	-- Add the parameters for the stored procedure here
	@comment VARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Comment] (Comment)
	Values (@comment);
END

GO
/****** Object:  StoredProcedure [dbo].[spInsertNewOrder]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertNewOrder]
	@tamales int,
	@carnitas int,
	@frijoles int,
	@rellenos int,
	@chilaquiles int,
	@horchata int,
	@jugo int
AS
BEGIN
	INSERT INTO [dbo].[Order] (tamales, carnitas, frijoles, rellenos, chilaquiles, horchata, jugo)
	VALUES (@tamales, @carnitas, @frijoles, @rellenos, @chilaquiles, @horchata, @jugo);
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewUser]    Script Date: 4/7/2017 3:04:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertNewUser]
	@Name NVARCHAR(50),
	@tamales int,
	@carnitas int,
	@frijoles int,
	@rellenos int,
	@chilaquiles int,
	@horchata int,
	@jugo int
AS
BEGIN
	INSERT INTO [dbo].[Order] (tamales, carnitas, frijoles, rellenos, chilaquiles, horchata, jugo)
	VALUES (@tamales, @carnitas, @frijoles, @rellenos, @chilaquiles, @horchata, @jugo);

	INSERT INTO [dbo].[User] (Name, OrderID)
	VALUES (@Name, SCOPE_IDENTITY());
END
GO
USE [master]
GO
ALTER DATABASE [BeyondTheWallDB] SET  READ_WRITE 
GO
