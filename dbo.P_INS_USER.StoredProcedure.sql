USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_INS_USER]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[P_INS_USER]
(
@id uniqueidentifier,
@fullName nvarchar(250),
@email nvarchar(250),
@passcode nvarchar(250)
)
as
begin
if not exists(select 1 from UserDetails where EmailId=@email)
	begin
	insert into UserDetails(ID,FullName,EmailId,passcode,crtdt,userType)
			values(@id,@fullName,@email,@passcode,GETDATE(),1)

		select FullName,ID,EmailId,'newuser' as userStatus,userType from UserDetails where id=@id

	end
		select FullName,ID,EmailId,'duplicate' as userStatus,userType from UserDetails where EmailId=@email

end
GO
