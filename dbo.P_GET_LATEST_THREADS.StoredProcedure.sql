USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_LATEST_THREADS]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[P_GET_LATEST_THREADS]
as
begin
	select top 5
		dtls.ID as PropertyId,
		thrds.title,
		thrds.threadUrl,
		dtls.Builder,
		dtls.Project,
		dtls.location,
		udtls.FullName,
		thrds.lstUpdDt,
		udtls.ID as UserId,
		dtls.PropertyType,
		count(thrds.id) as commentsCount,
		vews.ViewCount
	from
		Details dtls 
		join Threads thrds on dtls.ID=thrds.detailId
		left outer join UserDetails udtls on udtls.Id= thrds.userid
		left outer Join Comments cmts on cmts.threadId=thrds.threadId
		left outer join threadInteractions vews on vews.threadid=thrds.threadId
	group by thrds.id,thrds.title,
		thrds.threadUrl,
		dtls.Builder,
		dtls.Project,
		dtls.location,
		udtls.FullName,
		thrds.lstUpdDt,
		udtls.ID,
		dtls.ID,
		dtls.PropertyType,
		vews.ViewCount
			order by thrds.id desc	
end
GO
