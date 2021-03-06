USE [JA]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[ID] [uniqueidentifier] NULL,
	[FullName] [nvarchar](250) NULL,
	[EmailId] [nvarchar](250) NULL,
	[passcode] [nvarchar](250) NULL,
	[crtdt] [datetime] NULL,
	[userType] [int] NULL
) ON [PRIMARY]

GO
