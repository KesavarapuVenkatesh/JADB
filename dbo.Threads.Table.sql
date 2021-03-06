USE [JA]
GO
/****** Object:  Table [dbo].[Threads]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Threads](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](250) NULL,
	[threadUrl] [nvarchar](250) NULL,
	[detailId] [uniqueidentifier] NULL,
	[userid] [nvarchar](250) NULL,
	[lstUpdDt] [datetime] NULL,
	[threadId] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
