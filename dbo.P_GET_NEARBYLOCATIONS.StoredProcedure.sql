USE [JA]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_NEARBYLOCATIONS]    Script Date: 12/16/2018 9:44:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[P_GET_NEARBYLOCATIONS]
(
@threadUrl nvarchar(500)
)
AS
BEGIN

Declare @location as table
(
location varchar(500)
)
Declare @count int, @District varchar(200),@pincode bigint

	select @pincode= dtls.pincode from Threads thrds Join details dtls on dtls.ID=thrds.detailId  where threadUrl=@threadUrl
	select @District =District from pincodes where pincode =@pincode
	insert into @location
	select   distinct top 5 (location) from details where pincode=@pincode

	select @count= count(1) from @location

	if(@count < 5 )
		BEGIN
			insert into @location
			select distinct top (5-@count) (location) from Details where City=@District and location not in (select location from @location)
		END

		select location from @location

END


GO
