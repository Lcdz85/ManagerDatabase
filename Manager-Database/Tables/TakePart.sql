CREATE TABLE [dbo].[TakePart]
( 
    [StartDate] DATETIME NOT NULL, 
    [EndDate] DATE NULL, 
    [EmployeeId] UNIQUEIDENTIFIER NOT NULL, 
    [ProjectId] UNIQUEIDENTIFIER NOT NULL, 
    CONSTRAINT [FK_TakePart_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId]), 
    CONSTRAINT [FK_TakePart_Project] FOREIGN KEY ([ProjectId]) REFERENCES [Project]([ProjectId]), 
    CONSTRAINT [PK_TakePart] PRIMARY KEY ([EmployeeId], [ProjectId], [StartDate])
)

GO

CREATE TRIGGER [dbo].[TR_FreeEmployee]
    ON [dbo].[TakePart]
    AFTER INSERT
    AS
    BEGIN

        IF EXISTS
        (
            SELECT *
            FROM [TakePart] t, [inserted] i
            WHERE t.[EmployeeId] = i.[EmployeeId]
            AND t.[EndDate] IS NULL
        )
        BEGIN
            PRINT 'Busy employee'
            ROLLBACK
        END

    END
