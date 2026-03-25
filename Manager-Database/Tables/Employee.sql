CREATE TABLE [dbo].[Employee]
(
	[EmployeeId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), 
    [Firstname] VARCHAR(64) NOT NULL, 
    [Lastname] VARCHAR(64) NOT NULL, 
    [Hiredate] DATE NOT NULL, 
    [IsProjectManager] BIT NOT NULL
)
