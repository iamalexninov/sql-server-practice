/*
SearchMemberByName

Input: SearchString
Task: Find members whose first or last name contains the search string
Should show: MemberID, FullName, Email, MembershipType
Practice: LIKE operator
*/

alter procedure SearchMemberByName
	@SearchString nvarchar(10)
as
begin
	select 
		MemberID,
		(FirstName + ' ' + LastName) as FullName,
		Email,
		MembershipType
	from Members
	where FirstName like '%' + @SearchString + '%' or 
		  LastName like '%' + @SearchString + '%';
end;