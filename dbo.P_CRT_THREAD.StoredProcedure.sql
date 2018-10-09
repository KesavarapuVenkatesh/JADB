USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_CRT_THREAD]    Script Date: 10/10/2018 12:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[P_CRT_THREAD]
(
@DetailId UniqueIdentifier,
@Builder nvarchar(100),
@project nvarchar(250),
@propertyType nvarchar(100),
@location nvarchar(250),
@userId uniqueIdentifier,
@Comment nvarchar(max),
@threadId uniqueIdentifier,
@commentId uniqueIdentifier
)
AS
BEGIN
	Insert into Details(Id,Builder,Project,PropertyType,location,lstupdtDt)
	Values (@DetailId,@Builder,@project,@propertyType,@location,GETDATE())

		Declare @threadUrl nvarchar(500) = @Builder+'-'+@Project+'-'+@location+'-Reviews'
		Declare @title nvarchar(200) = @Builder+' '+@Project+' '+@location+' Reviews and Rating'
	
	if exists(select 1 from Threads where threadUrl=@threadUrl)
		Begin set @threadUrl = @threadUrl+'-'+CONVERT(varchar(10), floor(rand()*1000000)) end
		
		Insert into Threads(title,threadUrl,userid,lstupddt,detailId,threadId)
		Values (@title,@threadUrl,@userId,GETDATE(),@DetailId,@threadId)
	
	insert into Comments(threadId,comment,userId,crtdt,commentId)
		values(@threadId,@Comment,@userId,GETDATE(),@commentId)

	insert into SubscribedEmailers(threadId, EmailId, updt)
		select @threadId,Emailid,getdate() from UserDetails where ID=@userId

	select thrds.title,thrds.threadUrl,dtls.Builder,dtls.Project,dtls.location,udtls.FullName,dtls.lstupdtDt,
			udtls.ID as UserId
	 from Details dtls join Threads thrds on dtls.ID=thrds.detailId
	 join UserDetails udtls on udtls.Id= thrds.userid
	  where dtls.ID=@DetailId

END

GO
