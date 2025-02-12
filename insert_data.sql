-- Insert Sample Data
INSERT INTO Members (FirstName, LastName, Email, Phone, MembershipType)
VALUES 
    ('John', 'Doe', 'john.doe@email.com', '123-456-7890', 'Standard'),
    ('Jane', 'Smith', 'jane.smith@email.com', '123-456-7891', 'Premium'),
    ('Bob', 'Johnson', 'bob.johnson@email.com', '123-456-7892', 'Student');

INSERT INTO Authors (FirstName, LastName, Nationality)
VALUES 
    ('George', 'Orwell', 'British'),
    ('Jane', 'Austen', 'British'),
    ('Ernest', 'Hemingway', 'American');

INSERT INTO Categories (CategoryName, Description)
VALUES 
    ('Fiction', 'Fictional literature'),
    ('Non-Fiction', 'Non-fictional literature'),
    ('Science Fiction', 'Science fiction books');

INSERT INTO Books (ISBN, Title, AuthorID, CategoryID, PublicationYear, Publisher, TotalCopies, AvailableCopies, Price)
VALUES 
    ('9780451524935', '1984', 1, 1, 1949, 'Secker and Warburg', 5, 3, 15.99),
    ('9780141439518', 'Pride and Prejudice', 2, 1, 1813, 'T. Egerton, Whitehall', 3, 2, 12.99),
    ('9780684801223', 'The Old Man and the Sea', 3, 1, 1952, 'Charles Scribners Sons', 4, 4, 14.99);

-- Create sample loan
INSERT INTO Loans (BookID, MemberID, DueDate)
VALUES 
    (1, 1, DATEADD(day, 14, GETDATE()));

-- Update available copies for the loaned book
UPDATE Books 
SET AvailableCopies = AvailableCopies - 1 
WHERE BookID = 1;