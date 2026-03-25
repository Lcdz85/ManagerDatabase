CREATE TABLE [dbo].[Project]
(
	[ProjectId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), 
    [Name] VARCHAR(256) NOT NULL, 
    [Description] NVARCHAR(MAX) NOT NULL, 
    [CreationDate] DATETIME NOT NULL DEFAULT GETDATE(), 
    [EmployeeId] UNIQUEIDENTIFIER NOT NULL, 
    CONSTRAINT [FK_Project_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
)

GO

CREATE TRIGGER [dbo].[TR_EmployeeManager]
    ON [Project]
    AFTER INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON;

        IF EXISTS
        (
            SELECT 1
            FROM inserted i
            INNER JOIN dbo.Employee e
                ON e.EmployeeId = i.EmployeeId
            WHERE e.IsProjectManager <> 1
        )
        BEGIN
            RAISERROR('L''employé n''est pas manager.', 16, 1);
            ROLLBACK TRANSACTION;
        END
    END;