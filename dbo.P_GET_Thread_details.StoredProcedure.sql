USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_Thread_details]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_GET_Thread_details]
(
@threadUrl nvarchar(250)
)
as
begin

declare @threadId uniqueIdentifier
select @threadId= threadId from Threads where threadUrl =@threadUrl

select 
	thrds.title,
	dtls.Builder,
	dtls.Project,
	dtls.location,
	udtls.FullName,
	dtls.PropertyType,
	thrds.lstUpdDt,
	thrds.threadId as threadId,
	AVG(rtngs.rate) rating,
	isnull(interac.viewCount,1) as viewCount,
	isnull(Count(rtngs.id),0) as NumbOfRatings
from
	Details dtls 
	join Threads thrds on dtls.ID=thrds.detailId
	left outer join UserDetails udtls on udtls.Id= thrds.userid
	left outer join userratings rtngs on rtngs.threadId=thrds.threadId
	left outer join threadInteractions interac on interac.threadId=thrds.threadId
where thrds.threadId= @threadId
group by 
	thrds.title,
	dtls.Builder,
	dtls.Project,
	dtls.location,
	udtls.FullName,
	dtls.PropertyType,
	thrds.lstUpdDt,
	thrds.threadId,
	rtngs.threadId,
	interac.viewCount

select 
	cmts.commentId commentId,
	cmts.comment,
	udtls.FullName as commenetedBy,
	cmts.crtdt commenetedOn,
	udtls.ID as commentedUserId,
	cmts.ParentComentId as parentCommentId
from
	Comments cmts 
	left outer join UserDetails udtls on udtls.Id= cmts.userid
where cmts.threadId=@threadId and ParentComentId is null
order by cmts.id

select 
	cmts.commentId commentId,
	cmts.comment,
	udtls.FullName as commenetedBy,
	cmts.crtdt commenetedOn,
	udtls.ID as commentedUserId,
	cmts.ParentComentId as parentCommentId
from
	Comments cmts 
	left outer join UserDetails udtls on udtls.Id= cmts.userid
where cmts.threadId=@threadId and ParentComentId is not null
order by cmts.id

if exists(select 1 from threadInteractions where threadId=@threadId)
	update threadInteractions set viewCount = viewcount+1 where threadId=@threadId
else
	insert into threadInteractions (threadId,viewCount)
	values(@threadId,1)


end


GO
