USE [JA]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 10/14/2018 11:50:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[commentId] [uniqueidentifier] NULL,
	[threadId] [uniqueidentifier] NULL,
	[comment] [nvarchar](max) NULL,
	[userId] [uniqueidentifier] NULL,
	[crtdt] [datetime] NULL,
	[ParentComentId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
