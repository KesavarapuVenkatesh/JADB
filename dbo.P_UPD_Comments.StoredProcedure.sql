USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_UPD_Comments]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[P_UPD_Comments]
(
@comment nvarchar(max),
@userId uniqueidentifier,
--@threadId uniqueidentifier,
@rating int = null,
@commentId uniqueIdentifier,
@userType int
)
AS
BEGIN
	update comments
	set
	comment=isnull(@comment,comment),
	crtdt=GETDATE()
	where commentId=@commentId and (userId=@userId OR @userType=555)

	--update userratings 
	--set
	--rate=isnull(@rating,rate),
	--updt = GETDATE()
	--where threadId=@threadId and userId=@userId


	select cmnts.comment,cmnts.commentId as commentId,cmnts.threadId,cmnts.userId,Isnull(rating.rate,0) as rating,
			cmnts.crtdt as commenetedOn
	 from Comments cmnts 
					left outer join UserRatings rating on
					cmnts.threadId=rating.threadId and 
					cmnts.userId = rating.userId
				where cmnts.commentid=@commentId and cmnts.userId=@userId

END


GO
