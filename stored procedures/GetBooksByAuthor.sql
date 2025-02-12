/*
[] - GetBooksByAuthor
Input: AuthorID - parameter
Task: Create a stored procedure that returns all books by a specific author
Should show: BookID, Title, PublicationYear, TotalCopies, AvailableCopies
Practice: Basic SELECT with WHERE clause
*/

create procedure GetBooksByAuthor
	@AuthorID int
as 
begin
	select 
		b.BookID,
		b.Title,
		b.PublicationYear,
		b.TotalCopies,
		b.AvailableCopies
	from dbo.Books as b
	where b.AuthorID = @AuthorID
end;