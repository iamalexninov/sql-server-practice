/*
CountBooksByPublisher

Input: None
Task: Count how many books we have from each publisher
Should show: Publisher, BookCount, TotalCopies
Practice: GROUP BY with multiple aggregates
*/

create procedure CountBooksByPublisher
as 
begin
	select 
		Publisher, 
		count(BookID) as BookCount,
		TotalCopies
	from Books
	group by Publisher, TotalCopies
end;