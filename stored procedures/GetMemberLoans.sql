/*
GetMemberLoans

Input: MemberID
Task: Show all current loans for a specific member
Should show: Book Title, LoanDate, DueDate
Practice: Multiple joins with date comparison
*/

create procedure GetMemberLoans
	@MemberID int
as 
begin
	select 
		b.Title,
		l.LoanDate,
		l.DueDate
	from Loans as l
	inner join Books as b on l.BookID = b.BookID
	inner join Members as m on l.MemberID = m.MemberID
	where m.MemberID = @MemberID
end;
