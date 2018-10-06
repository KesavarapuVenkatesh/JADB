USE [JA]
GO
/****** Object:  Table [dbo].[UserRatings]    Script Date: 10/7/2018 2:18:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRatings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[threadId] [uniqueidentifier] NULL,
	[userId] [uniqueidentifier] NULL,
	[rate] [int] NULL,
	[updt] [datetime] NULL,
	[isAnanomys] [int] NULL
) ON [PRIMARY]

GO
