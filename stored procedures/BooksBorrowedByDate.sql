/*
BooksBorrowedByDate

Input: TargetDate (DATE)
Task: Show all books borrowed on a specific date
Should show: Book Title, Member Name, LoanDate
Practice: Date filtering
*/

alter procedure BooksBorrowedByDate
	@TargetDate date
as 
begin
	select 
		b.Title as BookTitle,
		m.FirstName + ' ' + m.LastName as MemberFullName,
		convert(date, l.LoanDate) as LoadDate
	from Loans as l
	inner join Books as b on l.BookID = b.BookID
	inner join Members as m on l.MemberID = m.MemberID
	where convert(date, l.LoanDate) = @TargetDate
end;