/*
GetActiveMembersWithNoLoans

Input: None
Task: Find all active members who have never borrowed a book
Should show: Member Name, JoinDate, MembershipType
Practice: LEFT JOIN with NULL check
*/

create procedure GetActiveMembersWithNoLoans
as 
begin
	-- active members without books
	select
		m.MemberID,
		m.FirstName,
		convert(date, m.JoinDate) as JoinDate,
		m.MembershipStatus,
		m.Email,
		m.Phone
	from Members as m
	left join Loans as l on m.MemberID = l.MemberID
	where m.MembershipStatus = 1 and l.LoanID is null
	order by m.JoinDate desc;
end;

