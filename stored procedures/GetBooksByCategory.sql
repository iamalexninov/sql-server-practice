/*
GetBooksByCategory

Input: CategoryName
Task: List all books in a specific category
Should show: Title, Author Name, PublicationYear
Practice: Multiple joins with string parameter
*/

create procedure GetBooksByCategory
	@CategoryName nvarchar(50)
as
begin
	select 
		b.Title,
		a.FirstName + ' ' + a.LastName as AuthorFullName,
		b.PublicationYear
	from Books as b
	inner join Categories as c on b.CategoryID = c.CategoryID
	inner join Authors as a on b.AuthorID = a.AuthorID
	where c.CategoryName = @CategoryName
end;