/*
[] - CountMembersByType
Input: MembershipType (e.g., 'Standard', 'Premium', 'Student')
Task: Count how many members exist for each membership type
Should show: MembershipType, TotalMembers
Practice: Simple aggregation
*/

alter procedure CountMembersByType
	@MembershipType nvarchar(15)
as 
begin
	select 
		m.MembershipType,
		count(m.MembershipType) as TotalMembers
	from dbo.Members as m
	where m.MembershipType = @MembershipType
	group by m.MembershipType
end;