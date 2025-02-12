/*
FindAvailableBooks
Input: None
Task: Show all books that have at least one copy available
Should show: Title, Author FullName, AvailableCopies
Practice: JOINs with condition
*/

create procedure FindAvailableBooks
as
begin
	select 
		b.Title,
		a.FirstName + ' ' + a.LastName as AuthorFullName,
		b.AvailableCopies
	from Books as b
	inner join Authors as a on b.AuthorID = a.AuthorID 
	where b.AvailableCopies >= 1;
end;