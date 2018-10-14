USE [JA]
GO
/****** Object:  Table [dbo].[threadInteractions]    Script Date: 10/14/2018 11:50:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[threadInteractions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [uniqueidentifier] NULL,
	[viewCount] [int] NULL
) ON [PRIMARY]

GO
