USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_LOGIN_DETAILS]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[P_GET_LOGIN_DETAILS]
(
@email nvarchar(250),
@passcode nvarchar(250)
)
As
begin

select FullName,ID,EmailId,userType from UserDetails where EmailId=@email and passcode=@passcode

end

GO
