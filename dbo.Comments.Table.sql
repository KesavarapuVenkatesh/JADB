USE [JA]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/16/2018 9:44:51 PM ******/
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
	[ParentComentId] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
