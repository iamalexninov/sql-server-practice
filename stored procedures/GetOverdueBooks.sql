/*
GetOverdueBooks
Input: None
Task: List all currently overdue books
Should show: Book Title, Member Name, DueDate, Days Overdue
Practice: Date calculations
*/

create procedure GetOverdueBooks
as
begin
	select 
		b.Title,
		m.FirstName + ' ' + m.LastName as FullName,
		convert(date, l.DueDate) as DueDate,
		datediff(day, l.DueDate, GETDATE()) as DaysOverdue
	from Books as b
	inner join Loans as l on b.BookID = l.BookID
	inner join Members as m on l.MemberID = m.MemberID
end;