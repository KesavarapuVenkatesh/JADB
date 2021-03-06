USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_INS_COMMENT]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[P_INS_COMMENT]

(

@commentId uniqueIdentifier,

@comment nvarchar(max),

@userId uniqueidentifier,

@threadId uniqueidentifier,

@rating int =0,

@parentCommentId uniqueidentifier = null

)

As

Begin



declare @UserEmail nvarchar(400)

select @UserEmail=EmailId from UserDetails where id=@userId



insert into Comments(commentId,threadId,comment,userId,crtdt,ParentComentId)

values(@commentId,@threadId,@comment,@userId,GETDATE(),@parentCommentId)



select comment,threadId,cmnts.commentId as commentId,usr.FullName as commentedBy,cmnts.crtdt as commenetedOn,

		cmnts.userId as commentedUserId,ParentComentId as parentCommentId

from Comments cmnts left outer join 

UserDetails usr on usr.ID=cmnts.userId

where cmnts.threadId=@threadId and cmnts.commentId=@commentId



if(@rating <>0 AND @rating is not null)

begin

	if exists(select 1 from userratings where threadId=@threadId and userId=@UserId)

	begin

		update userratings set rate =@rating,updt=getdate()

		where threadId=@threadId and userId=@UserId

	end

else

	begin

		insert into userratings(threadId,userId,rate,isAnanomys,updt)

		values( @threadId,@UserId,@rating,1,getdate())

	end

end



	if not exists(select 1 from SubscribedEmailers where threadId=@threadId and emailId=@UserEmail)

		BEGIN

			insert into SubscribedEmailers(threadId,EmailId,updt)

			values(@threadId,@UserEmail,GETDATE())

		END

END
GO
