USE [JA]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Details](
	[ID] [uniqueidentifier] NULL,
	[Builder] [nvarchar](100) NULL,
	[Project] [nvarchar](250) NULL,
	[PropertyType] [nvarchar](100) NULL,
	[location] [nvarchar](250) NULL,
	[lstupdtDt] [datetime] NULL,
	[PinCode] [bigint] NULL,
	[City] [varchar](200) NULL,
	[State] [nvarchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
